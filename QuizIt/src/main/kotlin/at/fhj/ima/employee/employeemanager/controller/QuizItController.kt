package at.fhj.ima.employee.employeemanager.controller

import at.fhj.ima.employee.employeemanager.entity.*
import at.fhj.ima.employee.employeemanager.repository.CustomQuizRepository
import at.fhj.ima.employee.employeemanager.repository.HighscoreRepository
import at.fhj.ima.employee.employeemanager.repository.SettingsRepository
import at.fhj.ima.employee.employeemanager.repository.UserRepository
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.util.FileCopyUtils
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.*
import java.io.IOException
import javax.servlet.http.HttpServletRequest
import javax.servlet.http.HttpServletResponse
import javax.validation.Valid



@Controller
class QuizItController(val settingsRepository: SettingsRepository, val userRepository: UserRepository, val highscoreRepository : HighscoreRepository, val customQuizRepository: CustomQuizRepository) {

    @RequestMapping(path=["/", "/home"], method = [RequestMethod.GET])
    fun home(): String {
        val auth = SecurityContextHolder.getContext().authentication

        if(auth.authorities.first().authority != "ROLE_ANONYMOUS") {
            if(settingsRepository.findByUser(userRepository.findByUsernameIgnoreCase(auth.name)) == null){
                return "redirect:settings"
            }
        }
        return "home"
    }

    @RequestMapping("/highscore", method = [RequestMethod.GET])
    fun listHighscores(model: Model): String {
        model["highscores"] = highscoreRepository.findTop10ByOrderByScoreDesc()

        return "highscore"
    }
    @RequestMapping("/settings", method = [RequestMethod.GET])
    fun showSettings(model: Model): String {
        val auth = SecurityContextHolder.getContext().authentication
        val user = userRepository.findByUsernameIgnoreCase(auth.name)

        if(auth.authorities.first().authority != "ROLE_ANONYMOUS") {
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
        }
        return "settings"
    }

    @RequestMapping("/saveSettings",method = [RequestMethod.POST])
    fun saveSettings(@ModelAttribute settings: Settings, model: Model):String{
        try {
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
        } catch (e: Exception) {
            model["errorMessage"] = "That username is already taken!"
        }


        return "redirect:settings"
    }

    @RequestMapping("/upgradeRole",method = [RequestMethod.GET])
    fun upgradeRole(): String{
        val auth = SecurityContextHolder.getContext().authentication

        System.out.println("-------------------BEFORE UPGRADE--------- " + auth.authorities)
        if ( auth.authorities.size == 1) {
            val user = userRepository.findByUsernameIgnoreCase(auth.name)
            user.role = UserRole.ROLE_PREMIUM
            userRepository.save(user)
            val newAuthorities: MutableList<GrantedAuthority> = auth.authorities.toMutableList()
            newAuthorities.add(SimpleGrantedAuthority(UserRole.ROLE_PREMIUM.toString()))

            val newAuth = UsernamePasswordAuthenticationToken(auth.principal, auth.credentials, newAuthorities)
            SecurityContextHolder.getContext().authentication = newAuth
            System.out.println("-------------------AFTER UPGRADE--------- " + newAuth.authorities)
        }

        return "redirect:settings"
    }

    @RequestMapping("/deleteUser",method = [RequestMethod.GET])
    fun deleteUser(model: Model, request: HttpServletRequest, response: HttpServletResponse,): String {
        val auth = SecurityContextHolder.getContext().authentication

        if(auth.authorities.first().authority != "ROLE_ANONYMOUS") {
            val user = userRepository.findByUsernameIgnoreCase(auth.name)

            // Log out the user
            val logoutHandler = SecurityContextLogoutHandler()
            logoutHandler.logout(request, response, auth)

            highscoreRepository.delete(highscoreRepository.findByUser(user)!!)
            settingsRepository.delete(settingsRepository.findByUser(user)!!)
            userRepository.delete(user)
        }

        return "home"
    }


    @RequestMapping("/register", method = [RequestMethod.GET])
    fun register(): String {
        return "register"
    }

    @RequestMapping("/get-register", method = [RequestMethod.POST])
    fun getRegister(username:String, password:String, email:String, model: Model): String  {
        userRepository.save(User(username = username, email = email, password = BCryptPasswordEncoder().encode(password) , role = UserRole.ROLE_USER))
        val auth = SecurityContextHolder.getContext().authentication
        val newAuthorities: MutableList<GrantedAuthority> = mutableListOf()
        newAuthorities.add(SimpleGrantedAuthority(UserRole.ROLE_PREMIUM.toString()))
        val newAuth = UsernamePasswordAuthenticationToken(username, auth.credentials, newAuthorities)
        SecurityContextHolder.getContext().authentication = newAuth
        return  "redirect:login"
    }


    @Secured("ROLE_ADMIN" , "ROLE_PREMIUM")
    @RequestMapping(path=["/customQuiz"], method = [RequestMethod.GET])
    fun customQuiz(model: Model,@RequestParam(required = false) customQuiz: CustomQuiz? = null): String {
        model["customQuiz"] = customQuizRepository.findAll()
        return "customQuiz"
    }

    @Secured("ROLE_ADMIN" , "ROLE_PREMIUM")
    @RequestMapping("/customQuestion", method = [RequestMethod.GET])
    fun customQuestion(): String {
        return "customQuestion"
    }

    @Secured("ROLE_ADMIN" , "ROLE_PREMIUM")
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

    @Secured("ROLE_ADMIN" , "ROLE_PREMIUM")
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

    @RequestMapping("/downloadHighscore")
    @Throws(IOException::class)
    fun downloadHighscore(response: HttpServletResponse, request: HttpServletRequest?) {
        //jsonPersonal is the string that you're going to create dynamically in your code
        var highscoreList = "A list of the Top10 Highscores: \n"
        val highscore = highscoreRepository.findTop10ByOrderByScoreDesc()
        for (line in highscore){
            highscoreList += "Score: " + line.score + ", User: " + line.user!!.username + "\n"
        }
        response.characterEncoding = "UTF-8"
        response.setHeader("Content-Transfer-Encoding", "binary")
        response.contentType = "text/plain"
        response.setContentLength(highscoreList.length)
        response.setHeader("Content-Disposition", "attachment")

        //this copies the content of your string to the output stream
        FileCopyUtils.copy(highscoreList.toByteArray(),response.outputStream)
        response.flushBuffer()
    }
}