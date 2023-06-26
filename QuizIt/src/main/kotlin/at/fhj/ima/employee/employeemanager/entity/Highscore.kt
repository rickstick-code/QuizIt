package at.fhj.ima.employee.employeemanager.entity

import javax.persistence.CascadeType
import javax.persistence.Entity
import javax.persistence.GeneratedValue
import javax.persistence.GenerationType
import javax.persistence.Id
import javax.persistence.ManyToOne


@Entity
class Highscore(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,
    var score: Int? = null,
    @ManyToOne(cascade = [CascadeType.REMOVE])
    var user: User? = null
) {
}

