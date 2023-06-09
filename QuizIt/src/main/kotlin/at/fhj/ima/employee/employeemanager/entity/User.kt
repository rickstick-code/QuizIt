package at.fhj.ima.employee.employeemanager.entity

import javax.persistence.*

enum class UserRole {
    ROLE_USER,
    ROLE_ADMIN
}
@Entity
class User(
        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        var id: Int? = null,
        @Column(nullable = false, unique = true)
        var username: String,
        @Column(nullable = false, unique = true)
        var email: String,
        var password: String,
        @Enumerated(EnumType.STRING)
        var role: UserRole,
        var currentScore: Int = 0 //for when a user is attempting a quiz
)