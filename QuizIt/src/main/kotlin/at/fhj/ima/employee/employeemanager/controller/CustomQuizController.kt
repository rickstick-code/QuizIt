package at.fhj.ima.employee.employeemanager.controller

import at.fhj.ima.employee.employeemanager.entity.CustomQuiz
import at.fhj.ima.employee.employeemanager.entity.Employee
import at.fhj.ima.employee.employeemanager.repository.CustomQuizRepository
import at.fhj.ima.employee.employeemanager.repository.UserRepository
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured
import org.springframework.security.core.context.SecurityContextHolder

import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.ModelAttribute

import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import java.time.LocalDate
import javax.validation.Valid


public class CustomQuizController (val userRepository: UserRepository, val customQuizRepository: CustomQuizRepository) {
    /*
    @Secured("ROLE_ADMIN")
    @RequestMapping("/createQuiz", method = [RequestMethod.GET])
    fun createQuiz(model: Model, @RequestParam(required = false) id: Int?): String {
        val auth = SecurityContextHolder.getContext().authentication
        val user = userRepository.findByUsernameIgnoreCase(auth.name)
        model["customQuiz"] = if (id == null) CustomQuiz(creator = user)
        else customQuizRepository.findById(id).orElse(CustomQuiz(creator = user))
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
            customQuizRepository.save(customQuiz)
        } catch (e: DataIntegrityViolationException) {
            model["errorMessage"] = "Could not store quiz, DataIntegrityViolationException"
            return populateCreateCustomQuizView(model)
        } catch (e: Exception) {
            model["errorMessage"] = e.message ?: "Could not store quiz"
            return populateCreateCustomQuizView(model)
        }
        return  "redirect:customQuiz"
    }
     */
}