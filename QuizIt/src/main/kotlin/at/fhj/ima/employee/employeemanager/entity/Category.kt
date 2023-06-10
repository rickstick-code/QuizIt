package at.fhj.ima.employee.employeemanager.entity

import javax.persistence.Entity
import javax.persistence.Id

@Entity
class Category(
    @Id
    var id: Int? = null,
    var name: String,
    var active: Boolean
)