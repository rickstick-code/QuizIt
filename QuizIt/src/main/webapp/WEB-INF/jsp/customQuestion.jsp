<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script> <%-- only older version are working????--%>

<layout:page-container title="QuizIT" activePage="quiz">
    <div class="container text-center">
        <h3 class="mt-5">${question.question.text}</h3>
        <p class="mt-2">Difficulty: ${question.difficulty}</p>
        <!-- old version with answers sorted (Answer A is always right) for testing
        <div class="row justify-content-center">
            <div class="col-4 d-grid">
                <a type="button" class="btn btn-primary mt-5 btn-lg" href="/quiz" id="AnswerA" onclick=postScore(50)>${question.correctAnswer}</a>
            </div>
            <div class="col-2">
            </div>
            <div class="col-4 d-grid">
                <a type="button" class="btn btn-primary mt-5 btn-lg" href="/quiz" id="AnswerB">${question.incorrectAnswers[0]}</a>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-4 d-grid">
                <a type="button" class="btn btn-primary mt-5 btn-lg " href="/quiz" id="AnswerC">${question.incorrectAnswers[1]}</a>
            </div>
            <div class="col-2">
            </div>
            <div class="col-4 d-grid">
                <a type="button" class="btn btn-primary mt-5 btn-lg" href="/quiz" id="AnswerD">${question.incorrectAnswers[2]}</a>
            </div>
        </div> -->

        <!-- new version with random answers -->
        <div class="row justify-content-center">
            <div class="col-md-4 d-grid">
                <a type="button" class="btn btn-primary mt-md-5 mt-3 btn-lg" href="/quiz" id="AnswerA">${answers[0]}</a>
            </div>
            <div class="col-md-2">
            </div>
            <div class="col-md-4 d-grid">
                <a type="button" class="btn btn-primary mt-md-5 mt-3 btn-lg" href="/quiz" id="AnswerB">${answers[1]}</a>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-md-4 d-grid">
                <a type="button" class="btn btn-primary mt-md-5 mt-3 btn-lg " href="/quiz" id="AnswerC">${answers[2]}</a>
            </div>
            <div class="col-md-2">
            </div>
            <div class="col-md-4 d-grid">
                <a type="button" class="btn btn-primary mt-md-5 mt-3 btn-lg" href="/quiz" id="AnswerD">${answers[3]}</a>
            </div>
        </div>


        <div>

            <h4 class="mt-5">Score (not checking wrong answers): ${score}

                <!-- score updating is not working, need post request
                solution1: hidden field with value (form:hidden)
                solution2: post request to server to update users currentScore (AJAX?) -> JavaScript-->

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
                    </c:when>
                    <c:when test = "${question.difficulty == 'medium'}">
                        <c:set var = "score" value = "${score + 2}" scope="session"/>
                    </c:when>
                    <c:otherwise>
                        <c:set var = "score" value = "${score + 1}" scope="session"/>
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
