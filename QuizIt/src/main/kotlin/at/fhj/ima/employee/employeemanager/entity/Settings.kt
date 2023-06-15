package at.fhj.ima.employee.employeemanager.entity


import javax.persistence.Entity
import javax.persistence.Id
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.OneToMany
import javax.persistence.OneToOne
import javax.persistence.CascadeType

@Entity
class Settings(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,
    @OneToOne
    var user: User? = null,
    @OneToMany(cascade = [CascadeType.ALL])
    var categories: MutableList<Category> = mutableListOf<Category>()
) {
}

