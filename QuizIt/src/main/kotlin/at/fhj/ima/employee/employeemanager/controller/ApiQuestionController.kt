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
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.ResponseBody
import org.springframework.web.reactive.function.client.WebClient
import javax.validation.Valid


@Controller
class ApiQuestionController(val userRepository: UserRepository, val settingsRepository: SettingsRepository) {

    @RequestMapping("/quiz", method = [RequestMethod.GET])
    fun getQuestion(model: Model): String {
        val builder: WebClient.Builder = WebClient.builder()
        var url = "https://the-trivia-api.com/v2/questions"
        var categories = "?categories="


        // should work with no login either now
        val auth = SecurityContextHolder.getContext().authentication

        if(auth.principal != "anonymousUser"){
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
            }
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

        model["userscore"] = 0 // hier noch current score von user holen wenns einen gibt

        return "quiz"
    }

    @RequestMapping("/update-score", method = [RequestMethod.POST])
    @ResponseBody
    fun updateScore(@RequestParam("score") score: Int, answer:String, model: Model): String {

        System.out.println("------------------SCORE----------------")
        println("Score: $score")
        println("Answer: $answer") //just a random ass answer to test if u can pass parameters

        return "Score updated successfully"
    }

}