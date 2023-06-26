package at.fhj.ima.employee.employeemanager.entity

import javax.persistence.*
import javax.validation.constraints.NotNull
import javax.validation.constraints.Size

@Entity
class CustomQuestion(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,
    @Column(nullable = false, unique = false)
    @field:Size(min = 1, max = 50)
    var correctAnswer: String? = null,
    @Column(nullable = false, unique = false)
    @field:Size(min = 1, max = 50)
    var incorrectAnswer1: String? = null,
    @Column(nullable = false, unique = false)
    @field:Size(min = 1, max = 50)
    var incorrectAnswer2: String? = null,
    @Column(nullable = false, unique = false)
    @field:Size(min = 1, max = 50)
    var incorrectAnswer3: String? = null,
    @Column(nullable = false, unique = false)
    @field:Size(min = 1, max = 240)
    var question: String? = null,
    @ManyToOne(fetch = FetchType.LAZY, cascade= [CascadeType.ALL])
    @JoinColumn(name = "custom_quiz_id")
    var motherQuiz: CustomQuiz
){
}