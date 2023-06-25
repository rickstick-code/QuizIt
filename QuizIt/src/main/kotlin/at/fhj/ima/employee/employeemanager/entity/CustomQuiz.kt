package at.fhj.ima.employee.employeemanager.entity

import java.io.Serializable
import javax.persistence.*

@Entity
class CustomQuiz(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,
    @Column(nullable = true, unique = true)
    var quizname: String = "",
    @OneToMany
    var customQuestions: List<CustomQuestion> = listOf(),
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