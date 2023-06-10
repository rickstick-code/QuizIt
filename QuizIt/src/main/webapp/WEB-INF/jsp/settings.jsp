<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>


<layout:page-container title="QuizIT" activePage="settings">

    <div class="container text-center">
        <h1 class="mt-5">Settings</h1>
            <%--@elvariable id="settings" type="at.fhj.ima.employee.employeemanager.entity.Settings"--%>
        <form:form modelAttribute="settings" method="post" action="saveSettings">

        <div class="row justify-content-center">
            <div class="mt-5 col-4">
                <label for="inputUsername" class="form-label">Username</label>
                <form:input path="user.username" class="form-control" id="inputUsername" type="text"/>
            </div>
        </div>

        <div class="row justify-content-center mt-5">
            <div class="col-5">
                <table class="table table-striped text-start">
                    <thead>
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Categories</th>
                        <th scope="col" class="text-center">Active</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:set var="nr" scope="page" value="1"/>
                    <c:forEach items="${settings.categories}" var="category">
                        <tr>
                            <th scope="row">${nr}</th>
                            <td>${category.name}</td>
                            <td>
                                <div class="d-flex justify-content-center">
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" value="" id="flexCheckChecked${nr}" <c:if test="${category.active}">checked</c:if>>
                                        <label class="form-check-label" for="flexCheckChecked${nr}"></label>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    <c:set var="nr" value="${nr+1}"/>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>

        <div class="row justify-content-center mt-5">
            <div class="col-4 d-grid">
                <button class="btn btn-success" type="button">Upgrade to Premium</button>
            </div>
        </div>
        <div class="row justify-content-center mt-3">
            <div class="col-2 d-grid">
                <button class="btn btn-danger" type="button">Delete User</button>
            </div>
            <div class="col-2 d-grid">
                <button class="btn btn-primary" type="submit">Save</button>
            </div>
        </div>

        </form:form>
    </div>
    <p>i hate forms</p>
</layout:page-container>