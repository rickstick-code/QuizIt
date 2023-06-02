package at.fhj.ima.employee.employeemanager.repository

import at.fhj.ima.employee.employeemanager.entity.Project
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.stereotype.Repository

@Repository
interface ProjectRepository : JpaRepository<Project, Int> {
}

