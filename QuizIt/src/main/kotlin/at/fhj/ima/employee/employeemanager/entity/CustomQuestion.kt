package at.fhj.ima.employee.employeemanager.entity

import javax.persistence.*

class CustomQuestion(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: String? = null,
    @Column(nullable = false, unique = false)
    var correctAnswer: String? = null,
    @Column(nullable = false, unique = false)
    var incorrectAnswers: ArrayList<String> = arrayListOf(),
    @Column(nullable = false, unique = false)
    var question: Question? = Question(""),
    @ManyToOne
    var motherQuiz: CustomQuiz
){
}