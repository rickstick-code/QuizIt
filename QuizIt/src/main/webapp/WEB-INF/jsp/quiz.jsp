<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="QuizIT" activePage="quiz">
    <div class="container text-center">
        <h3 class="mt-5">${question.question.text}</h3>
        <p class="mt-2">Difficulty: ${question.difficulty}</p>

        <!-- new version with random answers -->
        <div class="row justify-content-center">
            <div class="col-4 d-grid">
                <a type="button" class="btn btn-primary mt-5 btn-lg" href="/quiz" id="AnswerA">${answers[0]}</a>
            </div>
            <div class="col-2">
            </div>
            <div class="col-4 d-grid">
                <a type="button" class="btn btn-primary mt-5 btn-lg" href="/quiz" id="AnswerB">${answers[1]}</a>
            </div>
        </div>
        <div class="row justify-content-center">
            <div class="col-4 d-grid">
                <a type="button" class="btn btn-primary mt-5 btn-lg " href="/quiz" id="AnswerC">${answers[2]}</a>
            </div>
            <div class="col-2">
            </div>
            <div class="col-4 d-grid">
                <a type="button" class="btn btn-primary mt-5 btn-lg" href="/quiz" id="AnswerD">${answers[3]}</a>
            </div>
        </div>

        <form action="/update-score" method="post">
            <input type="hidden" name="score" value="${score + 1}">
            <input type="hidden" name="answer" value="${answers[0]}">
            <button type="submit" class="btn btn-primary mt-5 btn-lg">Submit</button>
        </form>

        <!-- Schauen vielleicht kann man den ganzen spaß weghauen und die logik im Controller machen -->
        <div>
            <h4 class="mt-5">Score (not checking wrong answers): ${score}</h4>
        </div>
    </div>


</layout:page-container>