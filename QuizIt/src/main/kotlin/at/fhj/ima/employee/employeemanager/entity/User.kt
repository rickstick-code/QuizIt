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
        var password: String,
        @Enumerated(EnumType.STRING)
        var role: UserRole
)