package at.fhj.ima.employee.employeemanager.entity

import javax.persistence.*

@Entity
class CustomQuestion(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: Int? = null,
    @Column(nullable = false, unique = false)
    var correctAnswer: String? = null,
    @Column(nullable = false, unique = false)
    var incorrectAnswer1: String? = null,
    @Column(nullable = false, unique = false)
    var incorrectAnswer2: String? = null,
    @Column(nullable = false, unique = false)
    var incorrectAnswer3: String? = null,
    @Column(nullable = false, unique = false)
    var question: String? = null,
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "custom_quiz_id")
    var motherQuiz: CustomQuiz
){
}