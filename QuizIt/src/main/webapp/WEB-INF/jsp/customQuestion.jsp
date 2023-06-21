<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<layout:page-container title="QuizIT" activePage="customQuestion">

    <form:hidden path="id" />

    <div class="container text-center">
        <h1 class="mt-5">Question here</h1>
    </div>
</layout:page-container>