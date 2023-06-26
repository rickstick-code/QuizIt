<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<layout:page-container title="Employees" activePage="editEmployee">

    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <c:set var="errors" value="${requestScope['org.springframework.validation.BindingResult.employee']}" />
                <%--@elvariable id="employee" type="at.fhj.ima.employee.employeemanager.entity.Employee"--%>
            <form:form modelAttribute="employee" method="post" action="changeEmployee">

                <form:hidden path="id" />

                <fieldset>
                    <legend>Change Employee ${employee.ssn}</legend>

                    <! ---------------- ssn ---------------- -->
                    <div class="mb-3">
                        <label for="inputSSN" class="form-label">SSN</label>
                        <form:input path="ssn" class="form-control ${errors.hasFieldErrors('ssn') ? 'is-invalid' : ''}"
                                    id="inputSSN" type="number" readonly="${not empty employee.ssn}"/>
                        <form:errors path="ssn" cssClass="invalid-feedback" />
                    </div>

                    <! ---------------- first Name ---------------- -->
                    <div class="mb-3">
                        <label for="inputFirstName" class="form-label">First Name</label>
                        <form:input path="firstName" class="form-control ${errors.hasFieldErrors('firstName') ? 'is-invalid' : ''}" id="inputFirstName" type="text"/>
                        <form:errors path="firstName" cssClass="invalid-feedback" />
                    </div>

                    <! ---------------- last Name ---------------- -->
                    <div class="mb-3">
                        <label for="inputLastName" class="form-label">Last
                            Name</label>
                         <form:input path="lastName" class="form-control ${errors.hasFieldErrors('lastName') ? 'is-invalid' : ''}" id="inputLastName" type="text"/>
                        <form:errors path="lastName" cssClass="invalid-feedback" />
                    </div>

                    <! ---------------- dayOfBirth ---------------- -->
                    <div class="mb-3">
                        <label for="inputDate" class="form-label">Date</label>
                        <form:input path="dayOfBirth" class="form-control ${errors.hasFieldErrors('dayOfBirth') ? 'is-invalid' : ''}"
                                    id="inputDate" placeholder="Date" type="date"
                                    />
                        <form:errors path="dayOfBirth" cssClass="invalid-feedback" />
                    </div>

                    <! ---------------- department ------------------>
                    <div class="mb-3">
                        <label for="department" class="form-label">Department</label>
                        <form:select id="department" path="department" cssClass="form-control ${errors.hasFieldErrors('department') ? 'is-invalid' : ''}">
                            <form:option value="">&nbsp;</form:option>
                            <form:options items="${departments}" itemValue="id" itemLabel="name" />
                        </form:select>
                        <form:errors path="department" cssClass="invalid-feedback" />
                    </div>

                    <! ---------------- projects ------------------>
                    <div class="mb-3">
                        <label for="projects" class="form-label">Projects</label>
                        <form:select id="projects" path="projects" cssClass="form-control">
                            <form:options items="${projects}" itemValue="id" itemLabel="name" />
                        </form:select>
                    </div>

                    <! ---------------- buttons ---------------- -->
                    <div class="mb-3">
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <a href="listEmployees" class="btn btn-default">Cancel</a>
                    </div>

                </fieldset>
            </form:form>
        </div>
    </div>

</layout:page-container>
