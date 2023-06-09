package at.fhj.ima.employee.employeemanager.controller

import at.fhj.ima.employee.employeemanager.entity.ApiQuestion
import at.fhj.ima.employee.employeemanager.entity.Question
import at.fhj.ima.employee.employeemanager.entity.User
import at.fhj.ima.employee.employeemanager.repository.UserRepository
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.PathVariable
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.reactive.function.client.WebClient
import javax.validation.Valid


@Controller
class ApiQuestionController(val userRepository: UserRepository) {

    @RequestMapping("/quiz", method = [RequestMethod.GET])
    fun getQuestion(model: Model): String {
        val builder: WebClient.Builder = WebClient.builder()
        val url = "https://the-trivia-api.com/v2/questions"

        val question: ApiQuestion? = builder.build().get().uri(url).retrieve().bodyToFlux(ApiQuestion::class.java).blockFirst()

        System.out.println("----------------------------------------------")
        System.out.println("Question: " + question!!.question!!.text)

        if (question.question?.text != null) {
            model["question"] = question
        } else {
            model["question"] = ApiQuestion(question = Question("Api Error"))
        }


        //probably only works with logged-in user (not tested yet)
        val auth = SecurityContextHolder.getContext().authentication

        System.out.println("User: " + auth.name)
        System.out.println("----------------------------------------------")

        model["userscore"] = userRepository.findByUsernameIgnoreCase(auth.name).currentScore

        return "quiz"
    }

    /*
    @RequestMapping("/updateScore", method = [RequestMethod.POST])
    fun updateScore(@RequestParam(name = "score",defaultValue = "10") score: Int): String{
        val points = score.toInt()
        val auth = SecurityContextHolder.getContext().authentication
        userRepository.findByUsernameIgnoreCase(auth.name).currentScore += points

        return "redirect:quiz"
    }
     */
}