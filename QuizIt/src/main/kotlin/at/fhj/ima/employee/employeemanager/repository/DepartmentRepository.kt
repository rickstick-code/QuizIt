package at.fhj.ima.employee.employeemanager.repository

import at.fhj.ima.employee.employeemanager.entity.Department
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface DepartmentRepository : JpaRepository<Department, Int> {
}

