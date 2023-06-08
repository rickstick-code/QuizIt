package at.fhj.ima.employee.employeemanager.controller

import at.fhj.ima.employee.employeemanager.entity.ApiQuestion
import at.fhj.ima.employee.employeemanager.entity.Question
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.reactive.function.client.WebClient


@Controller
class ApiQuestionController() {

    @RequestMapping("/quiz", method = [RequestMethod.GET])
    fun getQuestion(model: Model): String {
        val builder: WebClient.Builder = WebClient.builder()
        val url = "https://the-trivia-api.com/v2/questions"

        val question: ApiQuestion? = builder.build().get().uri(url).retrieve().bodyToFlux(ApiQuestion::class.java).blockFirst()

        System.out.println("----------------------------------------------")
        System.out.println(question!!.question!!.text)
        System.out.println("----------------------------------------------")

        if (question.question?.text != null) {
            model["question"] = question
        } else {
            model["question"] = ApiQuestion(question = Question("Api Error"))
        }

        return "home"
    }
}