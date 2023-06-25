package at.fhj.ima.employee.employeemanager.controller

import at.fhj.ima.employee.employeemanager.entity.ApiQuestion
import at.fhj.ima.employee.employeemanager.entity.Highscore
import at.fhj.ima.employee.employeemanager.entity.Question
import at.fhj.ima.employee.employeemanager.entity.User
import at.fhj.ima.employee.employeemanager.repository.HighscoreRepository
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
class ApiQuestionController(val userRepository: UserRepository, val settingsRepository: SettingsRepository, val highscoreRepository : HighscoreRepository) {

    @RequestMapping("/quiz", method = [RequestMethod.GET])
    fun getQuestion(request: HttpServletRequest, model: Model): String {
        val builder: WebClient.Builder = WebClient.builder()
        var url = "https://the-trivia-api.com/v2/questions"

        // should work with no login either now
        val auth = SecurityContextHolder.getContext().authentication
        if(auth.authorities.first().authority != "ROLE_ANONYMOUS"){
            val user = userRepository.findByUsernameIgnoreCase(auth.name)

            // choosing categories (only authenticated users)
            val usersettings = settingsRepository.findByUser(user)
            if (usersettings != null && usersettings.categories.isNotEmpty()){
                url += "?categories=" + usersettings.categories.joinToString(",").trim(',')
                model["score"] = user.currentScore
            }
        } else {
            model["score"] = "Only available for logged in user!"
        }

        val question: ApiQuestion? = builder.build().get().uri(url).retrieve().bodyToFlux(ApiQuestion::class.java).blockFirst()

        println("----------------------------------------------")
        println("Question:   " + question!!.question!!.text)
        println("Answer:     " + question.correctAnswer)
        println("Category:   " + question.category)

        if (question.question?.text != null) {
            model["question"] = question
            model["answers"] = question.incorrectAnswers.plus(question.correctAnswer).shuffled()
        } else {
            model["question"] = ApiQuestion(question = Question("Api Error: Contact Administrators"))
        }

        println("User:       " + auth.name)
        println("----------------------------------------------")

        return "quiz"
    }

    @RequestMapping("/update-score", method = [RequestMethod.POST])
    fun updateScore(answer:String, selectedAnswer:String, difficulty:String, model: Model): String  {
        val auth = SecurityContextHolder.getContext().authentication

        if(auth.authorities.first().authority != "ROLE_ANONYMOUS"){
            val user = userRepository.findByUsernameIgnoreCase(auth.name)
            if(answer == selectedAnswer){
                when (difficulty) {
                    "hard" -> user.currentScore = user.currentScore + 3
                    "medium" -> user.currentScore = user.currentScore + 2
                    else -> user.currentScore = user.currentScore + 1
                }
            } else {
                val highscore = Highscore(score = user.currentScore, user = user)
                highscoreRepository.save(highscore)
                user.currentScore = 0
            }
            userRepository.save(user)
        }

        return  "redirect:quiz"
    }

}