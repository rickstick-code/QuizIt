package at.fhj.ima.employee.employeemanager.repository

import at.fhj.ima.employee.employeemanager.entity.Settings
import at.fhj.ima.employee.employeemanager.entity.User
import org.springframework.data.jpa.repository.JpaRepository
import org.springframework.data.jpa.repository.Query
import org.springframework.data.repository.query.Param
import org.springframework.stereotype.Repository

@Repository
interface SettingsRepository: JpaRepository<Settings, Int> {

    fun findByUser(user: User?): Settings?
}