package at.fhj.ima.employee.employeemanager.controller

import at.fhj.ima.employee.employeemanager.entity.Department
import at.fhj.ima.employee.employeemanager.entity.Employee
import at.fhj.ima.employee.employeemanager.repository.DepartmentRepository
import at.fhj.ima.employee.employeemanager.repository.EmployeeRepository
import at.fhj.ima.employee.employeemanager.repository.ProjectRepository
import org.springframework.dao.DataIntegrityViolationException
import org.springframework.security.access.annotation.Secured
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.ui.set
import org.springframework.validation.BindingResult
import org.springframework.web.bind.annotation.ModelAttribute
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestMethod
import org.springframework.web.bind.annotation.RequestParam
import java.time.LocalDate
import javax.validation.Valid

@Controller
class EmployeeController(val employeeRepository: EmployeeRepository, val departmentRepository: DepartmentRepository, val projectRepository: ProjectRepository) {

    @Secured("ROLE_ADMIN" , "ROLE_PREMIUM")
    @RequestMapping("/editEmployee", method = [RequestMethod.GET])
    fun editEmployee(model: Model, @RequestParam(required = false) id: Int?): String {
        model["employee"] = if (id == null) Employee(dayOfBirth = LocalDate.now())
        else employeeRepository.findById(id).orElse(Employee(dayOfBirth = LocalDate.now()))
        if (id != null && (model.getAttribute("employee") as Employee).id == null) {
            model["errorMessage"] = "Employee with id ${id} could not be found!"
        }
        return populateEditEmployeeView(model)
    }

    private fun populateEditEmployeeView(model: Model): String {
        model["departments"] = departmentRepository.findAll()
        model["projects"] = projectRepository.findAll()
        return "editEmployee"
    }

    @Secured("ROLE_ADMIN" , "ROLE_PREMIUM")
    @RequestMapping("/changeEmployee", method = [RequestMethod.POST])
    fun changeEmployee(@ModelAttribute @Valid employee: Employee, bindingResult: BindingResult, model: Model): String {
        if(bindingResult.hasErrors()){
            return populateEditEmployeeView(model)
        }
        try {
            employeeRepository.save(employee)
        } catch (e: DataIntegrityViolationException) {
            model["errorMessage"] = "Could not store employee, maybe this SSN is already in use?"
            return populateEditEmployeeView(model)
        } catch (e: Exception) {
            model["errorMessage"] = e.message ?: "Could not store employee"
            return populateEditEmployeeView(model)
        }
        return  "redirect:listEmployees"//"redirect:/editEmployee?id=" + employee.id
    }

    @RequestMapping(path=["/listEmployees"], method = [RequestMethod.GET])
    fun listEmployees(model: Model, @RequestParam(required = false) search: String? = null, @RequestParam(required = false) department: Department? = null): String {
        model["employees"] = employeeRepository.findBySearchText(search, department)
        model["departments"] = departmentRepository.findAll()
        return "listEmployees"
    }

    @Secured("ROLE_ADMIN" , "ROLE_PREMIUM")
    @RequestMapping("/deleteEmployee", method = [RequestMethod.GET])
    fun deleteEmployee(model: Model, @RequestParam id: Int): String {
        val employee = employeeRepository.findById(id).get()
        employeeRepository.delete(employee);
        model["message"] = "Employee having SSN ${employee.ssn} deleted"
        return listEmployees(model)
    }

}
