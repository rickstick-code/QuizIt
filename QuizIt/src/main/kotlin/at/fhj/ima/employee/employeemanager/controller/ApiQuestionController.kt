package at.fhj.ima.employee.employeemanager.controller

import at.fhj.ima.employee.employeemanager.entity.ApiQuestion
import at.fhj.ima.employee.employeemanager.entity.Highscore
import at.fhj.ima.employee.employeemanager.entity.Question
import at.fhj.ima.employee.employeemanager.entity.User
import at.fhj.ima.employee.employeemanager.repository.SettingsRepository
import at.fhj.ima.employee.employeemanager.repository.UserRepository
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.*
import org.springframework.web.reactive.function.client.WebClient
import org.springframework.web.reactive.result.view.RedirectView
import javax.servlet.http.HttpServletRequest
import javax.validation.Valid


@Controller
class ApiQuestionController(val userRepository: UserRepository, val settingsRepository: SettingsRepository) {

    @RequestMapping("/quiz", method = [RequestMethod.GET])
    fun getQuestion(request: HttpServletRequest, model: Model): String {
        val builder: WebClient.Builder = WebClient.builder()
        var url = "https://the-trivia-api.com/v2/questions"
        var categories = "?categories="

        // TODO Get a persistent variable!!!!
        //val score: Int = model.getAttribute("score") as? Int ?: 0
        //model.addAttribute("score", score)

        // should work with no login either now
        val auth = SecurityContextHolder.getContext().authentication
        if(auth.authorities.first().authority != "ROLE_ANONYMOUS"){
            val user = userRepository.findByUsernameIgnoreCase(auth.name)

            // choosing categories (only authenticated users)

            val usersettings = settingsRepository.findByUser(user)
            if (usersettings != null && usersettings.categories.isNotEmpty()){
                for (cat in usersettings.categories){
                    categories += cat + ","
                }
                if (categories.last() == ','){
                    categories = categories.dropLast(1)
                }
                url += categories
                System.out.println(url)
                model["score"] = user.currentScore
            }
        } else {
            model["score"] = "Only available for logged in user!"
        }


        val question: ApiQuestion? = builder.build().get().uri(url).retrieve().bodyToFlux(ApiQuestion::class.java).blockFirst()

        System.out.println("----------------------------------------------")
        System.out.println("Question:   " + question!!.question!!.text)
        System.out.println("Answer:     " + question.correctAnswer)
        System.out.println("Category:   " + question.category)

        if (question.question?.text != null) {
            model["question"] = question
            val answers = question.incorrectAnswers.plus(question.correctAnswer)
            val shuffledAnswers = answers.shuffled()
            model["answers"] = shuffledAnswers
        } else {
            model["question"] = ApiQuestion(question = Question("Api Error: Contact Administrators"))
        }

        System.out.println("User:       " + auth.name)
        System.out.println("----------------------------------------------")

        return "quiz"
    }

    @RequestMapping("/update-score", method = [RequestMethod.POST])
    fun updateScore(answer:String, selectedAnswer:String, model: Model): String  {

        // TODO VVVVVVVVVVVVVVVVV
        /*
        Hier musst du dann noch beide values vergleichen Rick
        und du musst schauen wie schwer die Frage war
        entsprechend dann scores vergeben(check mal ob du auf die daten zugreifen kannst von get question irgendwie)
        wenn die person eingeloggt ist musst du dann checken ob der aktuelle score besser ist und ihn replacen
        */

        System.out.println("------------------SCORE----------------")
        println("Answer: $answer")
        println("Selected: $selectedAnswer")
        System.out.println("------------------SCORE----------------")

        val auth = SecurityContextHolder.getContext().authentication

        if(auth.authorities.first().authority != "ROLE_ANONYMOUS"){
            val user = userRepository.findByUsernameIgnoreCase(auth.name)
            user.currentScore = user.currentScore + 10
            userRepository.save(user)
            System.out.println("------------------SCORE----------------")
        } else {
            model["score"] = "Only available for logged in user!"
        }

        return  "redirect:quiz"
    }

}