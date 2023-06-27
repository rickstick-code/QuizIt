package at.fhj.ima.employee.employeemanager.entity


import javax.persistence.Entity
import javax.persistence.Id
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.OneToMany
import javax.persistence.OneToOne
import javax.persistence.CascadeType
import javax.persistence.ElementCollection

@Entity
class Settings(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,
    @OneToOne(cascade = [CascadeType.REMOVE])
    var user: User? = null,
    @ElementCollection
    var categories: MutableList<String> = mutableListOf()
) {
}

