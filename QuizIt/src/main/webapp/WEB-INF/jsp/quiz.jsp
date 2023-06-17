<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="QuizIT" activePage="quiz">
    <div class="container text-center">
        <h3 class="mt-5">${question.question.text}</h3>
        <p class="mt-2">Difficulty: ${question.difficulty}</p>

        <form action="/update-score" method="post" id="quizForm">
            <div class="row justify-content-center">
                <div class="col-4 d-grid">
                    <button type="submit" class="btn btn-primary mt-5 btn-lg" name="selectedAnswer" value="${answers[0]}">${answers[0]}</button>
                </div>
                <div class="col-2">
                </div>
                <div class="col-4 d-grid">
                    <button type="submit" class="btn btn-primary mt-5 btn-lg" name="selectedAnswer" value="${answers[1]}">${answers[1]}</button>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-4 d-grid">
                    <button type="submit" class="btn btn-primary mt-5 btn-lg" name="selectedAnswer" value="${answers[2]}">${answers[2]}</button>
                </div>
                <div class="col-2">
                </div>
                <div class="col-4 d-grid">
                    <button type="submit" class="btn btn-primary mt-5 btn-lg" name="selectedAnswer" value="${answers[3]}">${answers[3]}</button>
                </div>
            </div>

            <input type="hidden" name="score" value="${score}">
            <input type="hidden" name="answer" value="${question.correctAnswer}">
        </form>

        <div>
            <h4 class="mt-5">Score (not checking wrong answers): ${score}</h4>
        </div>
    </div>


</layout:page-container>