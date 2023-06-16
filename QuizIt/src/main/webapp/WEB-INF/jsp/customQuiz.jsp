<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<layout:page-container title="QuizIT" activePage="customQuiz">

    <div class="container text-center">
        <h1 class="mt-5">Custom Quizzes</h1>
        <p>Play Quizzes made by Users for Users</p>
    </div>
    <div class="container text-center">
        <p>Create your own Custom Quiz</p>
        <a type="button" class="btn btn-primary mt-5 btn-lg" href="/createQuiz">Create Quiz</a>
    </div>
    <div class="container text-center">
        <p>Play other peoples Quizzes</p>
        <a type="button" class="btn btn-primary mt-5 btn-lg" href="/quiz">Random Quiz</a>
    </div>
    <div class="container text-center">
        <form id="searchform">
            <div class="row">
                <div class="col">
                    <label for="cqSearch" class="form-label">Find Quiz with QuizCode</label>
                    <input id="cqSearch" name="search" class="form-control" value="${param.search}"/>
                </div>
            </div>
        </form>
    </div>
</layout:page-container>