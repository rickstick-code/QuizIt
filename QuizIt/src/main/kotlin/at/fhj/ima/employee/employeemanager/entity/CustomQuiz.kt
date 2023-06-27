package at.fhj.ima.employee.employeemanager.entity

import java.io.Serializable
import javax.persistence.*
import javax.validation.constraints.Size

@Entity
class CustomQuiz(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,
    @Column(nullable = true, unique = true)
    @field:Size(min = 2, max = 240)
    var quizname: String = "",
    @OneToMany(cascade= [CascadeType.REFRESH,CascadeType.DETACH,CascadeType.DETACH,CascadeType.MERGE,CascadeType.PERSIST])
    var customQuestions: MutableList<CustomQuestion> = mutableListOf(),
    @ManyToOne
    var creator: User? = null
) : Comparable<CustomQuiz>, Serializable {
    override fun compareTo(other: CustomQuiz): Int {
        return compareValues(id, other.id)
    }

    override fun equals(other: Any?): Boolean {
        if (this === other) return true
        if (javaClass != other?.javaClass) return false
        other as CustomQuiz
        if (id != other.id) return false
        return true
    }

    override fun hashCode(): Int {
        return id.hashCode()
    }
}