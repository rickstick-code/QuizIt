package at.fhj.ima.employee.employeemanager.controller

import org.springframework.stereotype.Controller
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.servlet.ModelAndView




@Controller
class QuizItController {

    @RequestMapping(path=["/", "/home"], method = [RequestMethod.GET])
    fun home(): String {
        return "home"
    }

    @RequestMapping("/highscore", method = [RequestMethod.GET])
    fun listHighscores(): String {
        return "highscore"
    }
    @RequestMapping("/settings", method = [RequestMethod.GET])
    fun showSettings(): String {
        return "settings"
    }

    @RequestMapping("/customQuiz", method = [RequestMethod.GET])
    fun customQuiz(): String {
        return "customQuiz"
    }
}