package at.fhj.ima.employee.employeemanager.controller

import at.fhj.ima.employee.employeemanager.entity.Settings
import at.fhj.ima.employee.employeemanager.entity.User
import at.fhj.ima.employee.employeemanager.entity.UserRole
import at.fhj.ima.employee.employeemanager.repository.HighscoreRepository
import at.fhj.ima.employee.employeemanager.repository.SettingsRepository
import at.fhj.ima.employee.employeemanager.repository.UserRepository
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.core.context.SecurityContextHolder
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod


@Controller
class QuizItController(val settingsRepository: SettingsRepository, val userRepository: UserRepository, val highscoreRepository : HighscoreRepository) {

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
    fun deleteUser(): String {
        println("-------------------USER DELETED--------- ")
        return "home"
    }

    @RequestMapping("/customQuiz", method = [RequestMethod.GET])
    fun customQuiz(): String {
        return "customQuiz"
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
}