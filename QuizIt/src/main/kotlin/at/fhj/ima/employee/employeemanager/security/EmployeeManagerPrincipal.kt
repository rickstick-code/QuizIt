package at.fhj.ima.employee.employeemanager.security

import at.fhj.ima.employee.employeemanager.entity.User
import at.fhj.ima.employee.employeemanager.entity.UserRole
import org.springframework.security.core.GrantedAuthority
import org.springframework.security.core.authority.SimpleGrantedAuthority
import org.springframework.security.core.userdetails.UserDetails

class EmployeeManagerPrincipal(val user: User) :
        UserDetails
{
    override fun getAuthorities(): MutableCollection<out GrantedAuthority> {
        val roles = mutableListOf<GrantedAuthority>()
        roles.add(SimpleGrantedAuthority(UserRole.ROLE_USER.toString()))
        if (user.role == UserRole.ROLE_PREMIUM) {
            roles.add(SimpleGrantedAuthority(UserRole.ROLE_PREMIUM.toString()))
        }
        if (user.role == UserRole.ROLE_ADMIN){
            roles.add(SimpleGrantedAuthority(UserRole.ROLE_ADMIN.toString()))
            roles.add(SimpleGrantedAuthority(UserRole.ROLE_PREMIUM.toString()))
        }
        return roles
    }

    override fun getPassword(): String {
        return user.password
    }

    override fun getUsername(): String {
        return user.username
    }

    override fun isAccountNonExpired(): Boolean {
        return true
    }

    override fun isAccountNonLocked(): Boolean {
        return true
    }

    override fun isCredentialsNonExpired(): Boolean {
        return true
    }

    override fun isEnabled(): Boolean {
        return true
    }

}