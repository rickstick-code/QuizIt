<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>

<layout:page-container title="QuizIT" activePage="home">

    <div class="container text-center">
        <h1 class="mt-5">Welcome to QuizIT</h1>
        <p>Our Quiz App for WAppDev</p>
        <a type="button" class="btn btn-primary mt-5 btn-lg" href="/quiz">Start Quiz</a>
        <h3 class="mt-5 mb-3">Placeholder Question: ${question.question.text}</h3>
        <p>${question.correctAnswer}</p>
        <p>${question.incorrectAnswers[0]}</p>
        <p>${question.incorrectAnswers[1]}</p>
        <p>${question.incorrectAnswers[2]}</p>
        <p class="mt-5">Apparent difficulty of this question according to API: ${question.difficulty}</p>

    </div>

</layout:page-container>