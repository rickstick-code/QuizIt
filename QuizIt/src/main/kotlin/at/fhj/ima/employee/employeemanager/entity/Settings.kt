package at.fhj.ima.employee.employeemanager.entity

import javax.persistence.*

@Entity
class Settings(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,
    @OneToOne
    var user: User,
    @OneToMany
    var categories: MutableList<Category>
) {
}

