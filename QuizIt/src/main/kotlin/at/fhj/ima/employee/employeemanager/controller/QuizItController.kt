package at.fhj.ima.employee.employeemanager.controller

import at.fhj.ima.employee.employeemanager.entity.*
import at.fhj.ima.employee.employeemanager.repository.CustomQuizRepository
import at.fhj.ima.employee.employeemanager.repository.SettingsRepository
import at.fhj.ima.employee.employeemanager.repository.UserRepository
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.*
import org.springframework.web.servlet.ModelAndView
import java.time.LocalDate
import javax.validation.Valid


@Controller
class QuizItController(val settingsRepository: SettingsRepository, val userRepository: UserRepository, val customQuizRepository: CustomQuizRepository) {

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

        val categories = mutableListOf<String>()
        categories.add("music")
        categories.add("sport_and_leisure")
        categories.add("film_and_tv")
        categories.add("arts_and_literature")
        categories.add("society_and_culture")
        categories.add("science")
        categories.add("geography")
        categories.add("food_and_drink")
        categories.add("general_knowledge")

        if (usersettings != null) {
            if (usersettings.categories.isEmpty()) {
                usersettings.categories.addAll(categories)
            }
            model["allCategories"] = categories
            model["settings"] = usersettings
        } else {
            settingsRepository.save(Settings(user = user, categories = categories))
            model["settings"] = settingsRepository.findByUser(user)!!
            model["allCategories"] = categories
        }

        return "settings"
    }

    @RequestMapping("/saveSettings",method = [RequestMethod.POST])
    fun saveSettings(@ModelAttribute settings: Settings):String{
        val auth = SecurityContextHolder.getContext().authentication
        val user = userRepository.findByUsernameIgnoreCase(auth.name)

        if (!settings.user?.username.isNullOrEmpty()) {
            user.username = settings.user!!.username
            userRepository.save(user)
            val newAuth = UsernamePasswordAuthenticationToken(user.username, auth.credentials, auth.authorities)
            SecurityContextHolder.getContext().authentication = newAuth
        }

        val usersettings = settingsRepository.findByUser(user)

        if (usersettings != null) {
            usersettings.categories = settings.categories
            settingsRepository.save(usersettings)
            System.out.println("-------------------Settings saved successfully---------")
        } else {
            System.out.println("-------------------No user found---------")
        }

        return "redirect:settings"
    }
/*
    @RequestMapping("/customQuiz", method = [RequestMethod.GET])
    fun customQuiz(): String {
        return "customQuiz"
    }
    */
    @RequestMapping(path=["/customQuiz"], method = [RequestMethod.GET])
    fun customQuiz(model: Model,@RequestParam(required = false) customQuiz: CustomQuiz? = null): String {
        model["customQuiz"] = customQuizRepository.findAll()
        return "customQuiz"
    }

    @RequestMapping("/customQuestion", method = [RequestMethod.GET])
    fun customQuestion(): String {
        return "customQuestion"
    }

    @Secured("ROLE_ADMIN")
    @RequestMapping("/createQuiz", method = [RequestMethod.GET])
    fun createQuiz(model: Model, @RequestParam(required = false) id: Int?): String {
        val auth = SecurityContextHolder.getContext().authentication
        val user = userRepository.findByUsernameIgnoreCase(auth.name)
        model.addAttribute("customQuiz", if (id == null) CustomQuiz(creator = user)
        else customQuizRepository.findById(id).orElse(CustomQuiz(creator = user)))
        if (id != null && (model.getAttribute("customQuiz") as CustomQuiz).id == null) {
            model["errorMessage"] = "Quiz with id ${id} could not be found!"
        }
        return populateCreateCustomQuizView(model)
    }

    private fun populateCreateCustomQuizView(model: Model): String {

        return "createQuiz"
    }

    @Secured("ROLE_ADMIN")
    @RequestMapping("/changeQuiz", method = [RequestMethod.POST])
    fun changeQuiz(@ModelAttribute @Valid customQuiz: CustomQuiz, bindingResult: BindingResult, model: Model): String {
        if(bindingResult.hasErrors()){
            return populateCreateCustomQuizView(model)
        }
        try {
            for (q in customQuiz.customQuestions) {
                q.motherQuiz = customQuiz
            }

            customQuizRepository.save(customQuiz)
        } catch (e: DataIntegrityViolationException) {
            model["errorMessage"] = "Could not store quiz, the quiz name already exists"
            return populateCreateCustomQuizView(model)
        } catch (e: Exception) {
            model["errorMessage"] = e.message ?: "Could not store quiz"
            return populateCreateCustomQuizView(model)
        }
        return  "redirect:customQuiz"
    }
}