package at.fhj.ima.employee.employeemanager.security

import at.fhj.ima.employee.employeemanager.repository.UserRepository
import org.springframework.security.core.userdetails.UserDetails
import org.springframework.security.core.userdetails.UserDetailsService
import org.springframework.security.core.userdetails.UsernameNotFoundException
import org.springframework.stereotype.Service
import java.lang.Exception

@Service
class EmployeeManagerUserDetailsService(val userRepository:
                                        UserRepository) : UserDetailsService {
    override fun loadUserByUsername(username: String?): UserDetails {
        try {
            return EmployeeManagerPrincipal(userRepository.findByUsernameIgnoreCase(username))
        }
        catch (e:Exception){
            throw UsernameNotFoundException(username)
        }
    }
}