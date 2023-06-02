package at.fhj.ima.employee.employeemanager.repository

import at.fhj.ima.employee.employeemanager.entity.Department
import at.fhj.ima.employee.employeemanager.entity.Employee
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository

@Repository
interface EmployeeRepository : JpaRepository<Employee, Int> {

    @Query("SELECT e FROM Employee AS e WHERE LOWER(CONCAT(e.firstName, ' ', e.lastName)) LIKE CONCAT('%', LOWER(COALESCE(:search, '')), '%') AND (:department IS NULL OR e.department = :department) ")
    fun findBySearchText(@Param("search") search: String?, @Param("department") department: Department?): List<Employee>

}

