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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>

<nav class="navbar navbar-dark bg-dark navbar-expand-md">
    <div class="container">
        <a class="navbar-brand" href="/">QuizIT</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="offcanvas" data-bs-target="#offcanvasDarkNavbar" aria-controls="offcanvasDarkNavbar" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="offcanvas offcanvas-end text-bg-dark" tabindex="-1" id="offcanvasDarkNavbar" aria-labelledby="offcanvasDarkNavbarLabel">
            <div class="offcanvas-header">
                <h5 class="offcanvas-title" id="offcanvasDarkNavbarLabel">QuizIT</h5>
                <button type="button" class="btn-close btn-close-white" data-bs-dismiss="offcanvas" aria-label="Close"></button>
            </div>
            <div class="offcanvas-body">
                <ul class="navbar-nav justify-content-start flex-grow-1 pe-3">
                    <li class="nav-item">
                        <a class="nav-link mx-1" href="/">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link mx-1" href="/highscore">Highscore</a>
                    </li>
                    <sec:authorize access="not hasAuthority('ROLE_ANONYMOUS')">
                    <li class="nav-item">
                        <a class="nav-link mx-1" href="/customQuiz">Custom Quiz</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link mx-1" href="/settings">Settings</a>
                    </li>
                    </sec:authorize>
                    <sec:authorize access="hasAuthority('ROLE_ANONYMOUS')">
                    <li style="width: 100%;"></li>
                    <li class="nav-item" style="white-space: nowrap;">
                        <a class="btn btn-outline-light" href="/login"><i class="bi bi-box-arrow-right"></i> Login</a>
                    </li>
                    <li class="nav-item" style="white-space: nowrap;">
                        <a class="btn btn-outline-light" href="/register"><i class="bi bi-box-arrow-right"></i> Sign-in</a>
                    </li>
                    </sec:authorize>
                </ul>
            </div>

        </div>
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
</body>
</html>
