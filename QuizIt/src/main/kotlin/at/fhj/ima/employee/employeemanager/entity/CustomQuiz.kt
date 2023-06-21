package at.fhj.ima.employee.employeemanager.entity

import javax.persistence.*

class CustomQuiz(
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    var id: String? = null,
    @Column(nullable = true, unique = true)
    var quizname: String = "",
    @OneToMany
    var customQuestions: ArrayList<CustomQuestion> = arrayListOf(),
    @Column(nullable = false, unique = true)
    var creator: User
) {
}