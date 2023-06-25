package at.fhj.ima.employee.employeemanager.security

import org.springframework.beans.factory.annotation.Autowired
import org.springframework.context.annotation.Bean
import org.springframework.context.annotation.Configuration
import org.springframework.security.config.annotation.web.builders.HttpSecurity
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity
import org.springframework.security.web.DefaultSecurityFilterChain

@Configuration
@EnableWebSecurity
class WebSecurityConfiguration {
    @Autowired
    private lateinit var userDetailsService: EmployeeManagerUserDetailsService;
    @Bean
    fun filterChain(http: HttpSecurity):DefaultSecurityFilterChain {
        http
                .authorizeRequests()
                // you anonymous urls here
                .antMatchers("/login").permitAll()
                .antMatchers("/quiz").permitAll()
                .antMatchers("/error").permitAll()
                .antMatchers("/register").permitAll()
                .antMatchers("/get-register").permitAll()
                .antMatchers("/update-score").permitAll()
                // Hier werden die Files für Design etc auch erlaubt wenn man nicht eingeloggt ist
                .antMatchers("/css/**", "/js/**", "/webjars/**").permitAll()
                //.antMatchers("/anonymous1").permitAll()
                //.antMatchers("/manager").hasRole(„Manager“)
                //.anyRequest().authenticated()
                .anyRequest().permitAll()
                .and()
                .formLogin()//.loginPage("/login")
                .and()
                    .csrf()
                    .disable()
                .rememberMe().key("uniqueAndSecret").userDetailsService(userDetailsService);
        return http.build()
    }
}
