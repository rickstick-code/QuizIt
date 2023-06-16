<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


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
                    <c:forEach items="${allCategories}" var="category">
                        <tr>
                            <th scope="row">${nr}</th>
                            <td>${category}</td>
                            <td>
                                <div class="d-flex justify-content-center">
                                        <form:checkbox path="categories" value="${category}"/>
                                </div>
                            </td>
                        </tr>
                    <c:set var="nr" value="${nr+1}"/>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
            <sec:authorize access="!hasAuthority('ROLE_PREMIUM')">
        <div class="row justify-content-center mt-5">
            <div class="col-4 d-grid">
                <a class="btn btn-success" type="button" href="/upgradeRole">Upgrade to Premium</a>
            </div>
        </div>
            </sec:authorize>
        <div class="row justify-content-center mt-3">
            <div class="col-2 d-grid">
                <!-- not working with modal <a href="/deleteUser" type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#confirmDeleteUser">Delete User</a> -->
                <a href="/deleteUser" type="button" class="btn btn-danger">Delete User</a>
            </div>

            <div class="col-2 d-grid">
                <button class="btn btn-primary" type="submit">Save</button>
            </div>
        </div>

        </form:form>
    </div>

    <!-- Modal -->
    <div class="modal fade" id="confirmDeleteUser" tabindex="-1" aria-labelledby="deleteUserLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="deleteUserLabel">Attention!</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    Do your really want to delete this employee?
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
                    <a type="button" class="btn btn-danger btn-ok" >Delete</a>
                </div>
            </div>
        </div>
    </div>

</layout:page-container>