<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="QuizIT" activePage="customQuestion">

    <div class="container text-center mt-5">
        <div class="container text-center">
            <h1 class="mt-5">Quiz Over</h1>
            <p>You got ${resultScore} of ${maxScore} points</p>
            <a type="button" class="btn btn-primary btn-lg" href="/customQuiz">Back to the other Quizzes</a>
        </div>
    </div>

</layout:page-container>
