<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>

<layout:page-container title="QuizIT" activePage="home">

    <div class="container text-center">
        <h1 class="mt-5">Welcome to QuizIT</h1>
        <p>Our Quiz App for WAppDev</p>
        <a type="button" class="btn btn-primary mt-5 btn-lg" href="/quiz">Start Quiz</a>
    </div>

</layout:page-container>