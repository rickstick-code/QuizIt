<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="QuizIT" activePage="customQuiz">

    <div class="container text-center mt-5">
        <div class="container text-center">
            <h1 class="mt-5">Custom Quizzes</h1>
            <p>Play Quizzes made by Users for Users</p>
        </div>
        <table class="table table-borderless mt-5">
            <tr>
                <th>Create your own Custom Quiz</th>
                <th>Play a random Quiz</th>
            </tr>
            <tr>
                <td><a type="button" class="btn btn-primary btn-lg" href="/createQuiz">Create Quiz</a></td>
                <td><a type="button" class="btn btn-primary btn-lg" href="${randomQuiz}">Random Quiz</a></td>
            </tr>
        </table>

        <div class="container text-center">

            <table data-toggle="table" class="table table-striped">
                <thead>
                <tr>
                    <th data-sortable="true">ID</th>
                    <th data-sortable="true">Quiz Name</th>
                    <th data-sortable="true">Questions</th>
                    <th data-sortable="true">Creator</th>
                    <th>Play</th>
                </tr>
                </thead>
                <tbody>
                <!--  list all quizes ----------------------------------------------------------- -->
                <c:forEach items="${customQuiz}" var="customQuiz">
                    <tr>
                        <td>${customQuiz.id}</td>
                        <td>${customQuiz.quizname}</td>
                        <td>${fn:length(customQuiz.customQuestions)}</td>
                        <td>${customQuiz.creator.username}</td>
                        <td>
                            <div class="row">
                                <a href="goToQuiz?id=${customQuiz.id}" class="col btn btn-xs btn-success"><i class="bi bi-pen"></i>Play</a>
                            </div>
                        </td>
                    </tr>
                </c:forEach>
                <!--  list all quizes ----------------------------------------------------------- -->
                </tbody>
            </table>
        </div>
    </div>
</layout:page-container>