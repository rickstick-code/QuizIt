<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="QuizIT" activePage="customQuestion">
    <div class="container text-center">
        <h3 class="mt-5">${customQuiz.customQuestions[0].question}</h3>
        <p class="mt-2">Difficulty: 10 points</p>

        <form action="/updateCustomScore" method="post" id="customQuizForm">
            <div class="row justify-content-center">
                <div class="col-4 d-grid">
                    <button type="submit" class="btn btn-primary mt-5 btn-lg" name="selectedAnswer" value="${customQuiz.customQuestions[0].correctAnswer}">${customQuiz.customQuestions[0].correctAnswer}</button>
                </div>
                <div class="col-2">
                </div>
                <div class="col-4 d-grid">
                    <button type="submit" class="btn btn-primary mt-5 btn-lg" name="selectedAnswer" value="${customQuiz.customQuestions[0].incorrectAnswer1}">${customQuiz.customQuestions[0].incorrectAnswer1}</button>
                </div>
            </div>
            <div class="row justify-content-center">
                <div class="col-4 d-grid">
                    <button type="submit" class="btn btn-primary mt-5 btn-lg" name="selectedAnswer" value="${customQuiz.customQuestions[0].incorrectAnswer2}">${customQuiz.customQuestions[0].incorrectAnswer2}</button>
                </div>
                <div class="col-2">
                </div>
                <div class="col-4 d-grid">
                    <button type="submit" class="btn btn-primary mt-5 btn-lg" name="selectedAnswer" value="${customQuiz.customQuestions[0].incorrectAnswer3}">${customQuiz.customQuestions[0].incorrectAnswer3}</button>
                </div>
            </div>
            <input type="hidden" name="answer" value="${question.correctAnswer}">
            <input type="hidden" name="difficulty" value="${question.difficulty}">
        </form>

        <div>
            <h4 class="mt-5">Score: ${score}</h4>
        </div>
    </div>


</layout:page-container>
