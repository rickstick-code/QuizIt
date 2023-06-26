<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<layout:page-container title="QuizIT" activePage="createQuiz">

    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <c:set var="errors" value="${requestScope['org.springframework.validation.BindingResult.customQuiz']}" />
                <%--@elvariable id="customQuiz" type="at.fhj.ima.employee.employeemanager.entity.CustomQuiz"--%>
            <form:form modelAttribute="customQuiz" method="post" action="changeQuiz">

            <fieldset>
                <legend>Create Custom Quiz</legend>
                <form:hidden path="creator.id" value="${customQuiz.creator.id}"/>
                    <div class="mb-3">
                        all fields are mandatory
                    </div>

                    <div class="mb-3">
                        <label for="inputQuizName" class="form-label">Quiz Name</label>
                        <form:input path="quizname" class="form-control ${errors.hasFieldErrors('quizname') ? 'is-invalid' : ''}"
                                    id="inputQuizName" type="text" placeholder="Give your Quiz a name" readonly="${not empty customQuiz.quizname}"/>
                        <form:errors path="quizname" cssClass="invalid-feedback" />
                    </div>

                    <c:forEach var="questionIndex" begin="0" end="4">

                        <div class="mb-3">

                            <label for="inputQuestion${questionIndex}" class="form-label">Question ${questionIndex+1}</label>
                            <form:input path="customQuestions[${questionIndex}].question" class="form-control ${errors.hasFieldErrors('customQuestion.question') ? 'is-invalid' : ''}"
                                        id="inputQuestion${questionIndex}" type="text" placeholder="Your Question here" readonly="${not empty customQuestion.question}"/>
                            <form:errors path="customQuestions[${questionIndex}].question" cssClass="invalid-feedback" />
                            <table class="table table-borderless">
                                <tr>
                                    <td>Correct Answer</td>
                                    <td>Wrong Answer 1</td>
                                    <td>Wrong Answer 2</td>
                                    <td>Wrong Answer 3</td>
                                </tr>
                                <tr>
                                    <td>
                                        <form:input path="customQuestions[${questionIndex}].correctAnswer" class="form-control ${errors.hasFieldErrors('customQuestion.correctAnswer') ? 'is-invalid' : ''}"
                                                    id="inputCA${questionIndex}" type="text" readonly="${not empty customQuestion.correctAnswer}"/>
                                        <form:errors path="customQuestions[${questionIndex}].correctAnswer" cssClass="invalid-feedback" />
                                    </td>
                                    <td>
                                        <form:input path="customQuestions[${questionIndex}].incorrectAnswer1" class="form-control ${errors.hasFieldErrors('customQuestion.incorrectAnswer1') ? 'is-invalid' : ''}"
                                                    id="inputWA${questionIndex}a" type="text" readonly="${not empty customQuestion.incorrectAnswer1}"/>
                                        <form:errors path="customQuestions[${questionIndex}].incorrectAnswer1" cssClass="invalid-feedback" />
                                    </td>
                                    <td>
                                        <form:input path="customQuestions[${questionIndex}].incorrectAnswer2" class="form-control ${errors.hasFieldErrors('customQuestion.incorrectAnswer2') ? 'is-invalid' : ''}"
                                                    id="inputWA${questionIndex}b" type="text" readonly="${not empty customQuestion.incorrectAnswer2}"/>
                                        <form:errors path="customQuestions[${questionIndex}].incorrectAnswer2" cssClass="invalid-feedback" />
                                    </td>
                                    <td>
                                        <form:input path="customQuestions[${questionIndex}].incorrectAnswer3" class="form-control ${errors.hasFieldErrors('customQuestion.incorrectAnswer3') ? 'is-invalid' : ''}"
                                                    id="inputWA${questionIndex}c" type="text" readonly="${not empty customQuestion.incorrectAnswer3}"/>
                                        <form:errors path="customQuestions[${questionIndex}].incorrectAnswer3" cssClass="invalid-feedback" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </c:forEach>

                    <div class="mb-3">
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <a href="customQuiz" class="btn btn-default">Cancel</a>
                    </div>
            </fieldset>
            </form:form>
        </div>
    </div>



</layout:page-container>
