<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>

<layout:page-container title="Employees" activePage="listEmployees">

    <div class="row">
        <div class="col-md-10 col-md-offset-1">

            <form id="searchform">
                <div class="row">
                    <div class="col">
                        <label for="inputSearch" class="form-label">Search</label>
                        <input id="inputSearch" name="search" class="form-control" value="${param.search}"/>
                    </div>
                    <div class="col">
                        <label for="departmentSearch" class="form-label">Select Department</label>
                        <select id="departmentSearch" name="department" class="form-control">
                            <option value=""></option>
                            <c:forEach var="department" items="${departments}">
                                <option value="${department.id}"<c:if test="${param.department == department.id}"> selected</c:if>>${department.name}</option>
                            </c:forEach>
                        </select>
                    </div>
                </div>
            </form>

            <table data-toggle="table" class="table table-striped">
                <thead>
                <tr>
                    <th data-sortable="true">SSN</th>
                    <th data-sortable="true">First Name</th>
                    <th data-sortable="true">Last Name</th>
                    <th data-sortable="true">Day of birth</th>
                    <th data-sortable="true">Department</th>
                    <th>Actions</th>
                </tr>
                </thead>
                <tbody>
                <!--  list all employees ----------------------------------------------------------- -->
                <c:forEach items="${employees}" var="employee">
                    <tr>
                        <td>${employee.ssn}</td>
                        <td>${employee.firstName}</td>
                        <td>${employee.lastName}</td>
                        <td>
                            <fmt:parseDate value="${employee.dayOfBirth}" pattern="yyyy-MM-dd" var="parsedDate"
                                           type="date"/>
                            <fmt:formatDate value="${parsedDate}" type="date" pattern="dd.MM.yyyy"/>
                        </td>
                        <td>${employee.department.name}</td>
                        <td>
                            <%--<sec:authorize access="hasAuthority('ROLE_ADMIN')">
                            <div class="row">
                                <a href="editEmployee?id=${employee.id}" class="col btn btn-xs btn-success"><i class="bi bi-pen"></i> Edit</a>
                                <form method="post" class="col" action="/deleteEmployee?id=${employee.id}">
                                    <sec:csrfInput/>
                                    <button data-bs-toggle="modal" data-bs-target="#confirmDelete" type="button" class="btn btn-danger"><i class="bi bi-trash"></i> Delete
                                    </button>
                                </form>
                            </div>
                            </sec:authorize>--%>

                    <sec:authorize access="hasAuthority('ROLE_ADMIN')">
                            <a href="editEmployee?id=${employee.id}" class="col btn btn-xs btn-success"><i class="bi bi-pen"></i>Edit</a>
                                <button data-href="deleteEmployee?id=${employee.id}" data-bs-toggle="modal"
                                        data-bs-target="#confirmDelete" type="button" class="btn btn-danger"><i class="bi bi-trash"></i>Delete</button>
                    </sec:authorize>

                        </td>
                    </tr>
                </c:forEach>
                <!--  list all employees ----------------------------------------------------------- -->
                </tbody>
            </table>
        </div>
    </div>
    <!-- Modal -->
    <div class="modal fade" id="confirmDelete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Attention!</h5>
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
