package at.fhj.ima.employee.employeemanager.controller

import at.fhj.ima.employee.employeemanager.entity.ApiQuestion
import at.fhj.ima.employee.employeemanager.entity.Question
import at.fhj.ima.employee.employeemanager.entity.User
import at.fhj.ima.employee.employeemanager.repository.SettingsRepository
import at.fhj.ima.employee.employeemanager.repository.UserRepository
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.PostMapping
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

        //probably only works with logged-in user (not tested yet)
        val auth = SecurityContextHolder.getContext().authentication
        val user = userRepository.findByUsernameIgnoreCase(auth.name)

        // choosing categories (only authenticated users)
        val usersettings = settingsRepository.findByUser(user)
        if (usersettings != null && usersettings.categories.isNotEmpty()){
            for (cat in usersettings.categories){
                if (cat.active){
                    categories += cat.name +","
                }
            }
            if (categories.last() == ','){
                categories = categories.dropLast(1)
            }
            url += categories
            System.out.println(url)
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

        model["userscore"] = user.currentScore

        return "quiz"
    }

    @RequestMapping("/updateScore", method = [RequestMethod.POST])
    fun updateScore(@RequestBody score: Int): String{
        System.out.println("----------------------------------------------")
        System.out.println(score)
        System.out.println("----------------------------------------------")
        val points = score.toInt()
        val auth = SecurityContextHolder.getContext().authentication
        userRepository.findByUsernameIgnoreCase(auth.name).currentScore += points

        return "redirect:quiz"
    }

}