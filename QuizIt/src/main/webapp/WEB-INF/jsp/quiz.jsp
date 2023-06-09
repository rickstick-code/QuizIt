<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="QuizIT" activePage="quiz">
    <div class="container text-center">
        <h3 class="mt-5">${question.question.text}</h3>
        <p class="mt-2">Difficulty: ${question.difficulty}</p>
        <div class="row justify-content-center">
            <div class="col-4 d-grid">
                <a type="button" class="btn btn-primary mt-5 btn-lg" href="/quiz">${question.correctAnswer}</a>
            </div>
            <div class="col-2">
            </div>
            <div class="col-4 d-grid">
                <a type="button" class="btn btn-primary mt-5 btn-lg" href="/quiz">${question.incorrectAnswers[0]}</a>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-4 d-grid">
                <a type="button" class="btn btn-primary mt-5 btn-lg " href="/quiz">${question.incorrectAnswers[1]}</a>
            </div>
            <div class="col-2">
            </div>
            <div class="col-4 d-grid">
                <a type="button" class="btn btn-primary mt-5 btn-lg" href="/quiz">${question.incorrectAnswers[2]}</a>
            </div>
        </div>
        <div>
            <h4 class="mt-5">Score (not working): ${score}

                <!-- jstl is not working for this, solution: post request to server to update users currentScore (AJAX?)-->

                <c:choose>
                    <c:when test="${score != 0}">
                        <c:set var = "score" value = "${score}" scope="session"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var = "score" value = "${0}" scope="session"/>
                    </c:otherwise>
                </c:choose>
                <c:choose>
                    <c:when test = "${question.difficulty == 'hard'}">
                        <c:set var = "score" value = "${score + 3}" scope="session"/>
                        <c:out value="${score}"/>
                    </c:when>
                    <c:when test = "${question.difficulty == 'medium'}">
                        <c:set var = "score" value = "${score + 2}" scope="session"/>
                        <c:out value="${score}"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var = "score" value = "${score + 1}" scope="session"/>
                        <c:out value="${score}"/>
                    </c:otherwise>
                </c:choose>
            </h4>
            <p>${userscore}</p>

                <%--@elvariable id="score" type="java.lang.Integer"--%>
                <%--
                <form:form modelAttribute="score" action="updateScore" method="post">

                    <form:input path="score"/>
                    <button class="btn btn-secondary" type="submit">Update Score</button>
                </form:form>
                --%>
        </div>
    </div>


</layout:page-container>