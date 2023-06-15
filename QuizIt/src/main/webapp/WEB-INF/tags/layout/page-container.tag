<%@ attribute name="title" required="true" %>
<%@ attribute name="activePage" required="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<!DOCTYPE html>
<html>
<head>
    <bootstrap:bootstrap-metadata/>
    <title>${title}</title>
    <bootstrap:bootstrap-css/>
    <link href="/css/custom.css" rel="stylesheet"/>
</head>
<body>


<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container">
        <a class="navbar-brand" href="/">QuizIT</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNavAltMarkup">
            <div class="navbar-nav">
                <a class="nav-item nav-link mx-1" href="/">Home</a>
                <a class="nav-item nav-link mx-1" href="/highscore">Highscore</a>
                <a class="nav-item nav-link mx-1" href="/customQuiz">Custom Quiz</a>
                <a class="nav-item nav-link mx-1" href="/settings">Settings</a>
            </div>
        </div>
        <a class="btn btn-outline-light" href="/logout"><i class="bi bi-box-arrow-right"></i> Logout</a>

        <%--
        Employee dropdown menu for reference
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <c:if test="${activePage == 'listEmployees' or activePage == 'editEmployee'}">
                    <c:set var="employeesMenuActive">active</c:set>
                </c:if>
                <li class="nav-item ${employeesMenuActive} dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button"
                       data-bs-toggle="dropdown"
                       aria-haspopup="true" aria-expanded="false">
                        Employee
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item" href="/listEmployees">List Employee</a>
                        <sec:authorize access="hasAuthority('ROLE_ADMIN')">
                            <a class="dropdown-item" href="/editEmployee">Create
                                Employee</a>
                        </sec:authorize>
                    </div>
                </li>
            </ul>

            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <span class="nav-link"><i class="bi bi-person"></i><c:out value="${currentUser}"/></span>
                </li>
            </ul>
            <form:form method="post" class="d-flex" action="/logout">
                <button class="btn btn-outline-light" type="submit"><i class="bi bi-box-arrow-right"></i> Logout</button>
            </form:form>
        </div>
        --%>
    </div>
</nav>


<div class="container" role="main">

    <!-- Messages ----------------------------------------------------------- -->

    <!-- Error message ----------------------------------------------------------- -->
    <c:if test="${not empty errorMessage}">
        <div class="alert alert-danger" role="alert">${errorMessage}</div>
    </c:if>
    <!-- Error message ----------------------------------------------------------- -->

    <!-- Warning message ----------------------------------------------------------- -->
    <c:if test="${not empty warningMessage}">
        <div class="alert alert-warning" role="warning">${warningMessage}</div>
    </c:if>
    <!-- Warning message ----------------------------------------------------------- -->

    <!-- successful message ----------------------------------------------------------- -->
    <c:if test="${not empty message}">
        <div class="alert alert-success" role="warning">${message}</div>
    </c:if>
    <!-- successful message ----------------------------------------------------------- -->

    <!-- Messages ----------------------------------------------------------- -->
    <jsp:doBody/>
</div>
<bootstrap:bootstrap-js/>
<script src="/js/custom.js"></script>
</body>
</html>
