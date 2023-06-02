package at.fhj.ima.employee.employeemanager

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.context.annotation.Bean
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder
import org.springframework.security.crypto.password.PasswordEncoder

@SpringBootApplication
@EnableGlobalMethodSecurity(securedEnabled = true)
class EmployeeManagerApplication{
	@Bean
	fun passwordEncoder(): PasswordEncoder {
		return BCryptPasswordEncoder();
	}
}

fun main(args: Array<String>) {
	runApplication<EmployeeManagerApplication>(*args)
}
