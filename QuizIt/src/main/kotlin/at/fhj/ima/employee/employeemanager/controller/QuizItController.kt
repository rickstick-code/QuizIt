package at.fhj.ima.employee.employeemanager.controller

import at.fhj.ima.employee.employeemanager.entity.Category
import at.fhj.ima.employee.employeemanager.entity.Settings
import at.fhj.ima.employee.employeemanager.repository.SettingsRepository
import at.fhj.ima.employee.employeemanager.repository.UserRepository
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.servlet.ModelAndView




@Controller
class QuizItController(val settingsRepository: SettingsRepository, val userRepository: UserRepository) {

    @RequestMapping(path=["/", "/home"], method = [RequestMethod.GET])
    fun home(): String {
        return "home"
    }

    @RequestMapping("/highscore", method = [RequestMethod.GET])
    fun listHighscores(): String {
        return "highscore"
    }
    @RequestMapping("/settings", method = [RequestMethod.GET])
    fun showSettings(model: Model): String {
        val auth = SecurityContextHolder.getContext().authentication
        val user = userRepository.findByUsernameIgnoreCase(auth.name)
        val usersettings = settingsRepository.findByUser(user)


        // all categories available
        val categories = mutableListOf<Category>()
        categories.add(Category(name = "music", active = true))
        categories.add(Category(name = "sport_and_leisure", active = true))
        categories.add(Category(name = "film_and_tv", active = true))
        categories.add(Category(name = "arts_and_literature", active = true))
        categories.add(Category(name = "society_and_culture", active = true))
        categories.add(Category(name = "science", active = true))
        categories.add(Category(name = "geography", active = true))
        categories.add(Category(name = "food_and_drink", active = true))
        categories.add(Category(name = "general_knowledge", active = true))


        if (usersettings != null) {
            if (usersettings.categories.isEmpty()) {
                usersettings.categories.addAll(categories)
            }

            model["settings"] = usersettings
        } else {
            settingsRepository.save(Settings(user = user, categories = categories))
            model["settings"] = settingsRepository.findByUser(user)!!
        }


        return "settings"
    }

    @RequestMapping("/saveSettings",method = [RequestMethod.POST])
    fun saveSettings(@ModelAttribute settings: Settings):String{

        settingsRepository.save(settings)
        return "redirect:settings"
    }

    @RequestMapping("/customQuiz", method = [RequestMethod.GET])
    fun customQuiz(): String {
        return "customQuiz"
    }
}