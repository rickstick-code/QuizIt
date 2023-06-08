package at.fhj.ima.employee.employeemanager.entity

import javax.persistence.Entity
import javax.persistence.Id


class ApiQuestion(
    var category: String? = null,
    var id: String? = null,
    var correctAnswer: String? = null,
    var incorrectAnswers: ArrayList<String> = arrayListOf(),
    var question: Question? = Question(""),
    var tags: ArrayList<String> = arrayListOf(),
    var type: String? = null,
    var difficulty: String? = null,
    var regions: ArrayList<String>? = arrayListOf(),
    var isNiche: Boolean? = null
    ) {
}
