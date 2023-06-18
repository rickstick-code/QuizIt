<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>

<layout:page-container title="QuizIT" activePage="highscore">

    <div class="container text-center">
        <h1 class="mt-5">Highscores</h1>
        <div class="row justify-content-center mt-5">
            <div class="col-md-4">
                <table class="table table-striped text-start">
                    <thead>
                    <tr>
                        <th scope="col">Score</th>
                        <th scope="col">User</th>
                    </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>
                                55
                            </td>
                            <td>
                                Nameeee
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>

        </div>
        <div class="row justify-content-center">
            <div class="col-md-4 d-grid">
                <button class="btn-primary btn-lg btn mt-5">Download Highscores</button>
            </div>
        </div>

    </div>
</layout:page-container>