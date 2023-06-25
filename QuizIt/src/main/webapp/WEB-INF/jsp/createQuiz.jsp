<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@ taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<layout:page-container title="QuizIT" activePage="createQuiz">

    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <fieldset>
                <legend>Create Custom Quiz</legend>

                <form id="quizForm" action="submitQuiz" method="post" onsubmit="validateForm(event)">

                    <div class="mb-3">
                        "*" marks mandatory fields
                    </div>

                    <div class="mb-3">
                        <label for="inputQuizName" class="form-label">Quiz Name*</label>
                        <input type="text" class="form-control" id="inputQuizName" aria-describedby="Name" placeholder="Give your Quiz a name" name="quizname" value="">
                    </div>

                    <c:forEach var="questionIndex" begin="1" end="9">
                        <div class="mb-3">
                            <label for="inputQuestion${questionIndex}" class="form-label">Question ${questionIndex}<c:if test="${questionIndex <= 3}">*</c:if></label>
                            <input type="text" class="form-control" id="inputQuestion${questionIndex}" aria-describedby="Question${questionIndex}" placeholder="Your Question here" name="customQuestions[${questionIndex - 1}].questionText">
                            <table class="table table-borderless">
                                <tr>
                                    <td>Correct Answer</td>
                                    <td>Wrong Answer 1</td>
                                    <td>Wrong Answer 2</td>
                                    <td>Wrong Answer 3</td>
                                </tr>
                                <tr>
                                    <td>
                                        <input type="text" class="form-control" id="inputCA${questionIndex}" aria-describedby="CA${questionIndex}" name="customQuestions[${questionIndex - 1}].correctAnswer">
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" id="inputWA${questionIndex}a" aria-describedby="WA${questionIndex}a" name="customQuestions[${questionIndex - 1}].incorrectAnswers[0]">
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" id="inputWA${questionIndex}b" aria-describedby="WA${questionIndex}b" name="customQuestions[${questionIndex - 1}].incorrectAnswers[1]">
                                    </td>
                                    <td>
                                        <input type="text" class="form-control" id="inputWA${questionIndex}c" aria-describedby="WA${questionIndex}c" name="customQuestions[${questionIndex - 1}].incorrectAnswers[2]">
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </c:forEach>

                    <div class="mb-3">
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <a href="customQuiz" class="btn btn-default">Cancel</a>
                    </div>
                </form>
            </fieldset>
        </div>
    </div>

    <script>
        function validateForm(event) {
            var quizNameInput = document.getElementById('inputQuizName');
            var isValid = true;

            if (quizNameInput.value === '') {
                isValid = false;
                quizNameInput.classList.add('is-invalid');
            } else {
                quizNameInput.classList.remove('is-invalid');
            }

            for (var i = 1; i <= 3; i++) {
                var questionInput = document.getElementById('inputQuestion' + i);
                var caInput = document.getElementById('inputCA' + i);
                var wa1Input = document.getElementById('inputWA' + i + 'a');
                var wa2Input = document.getElementById('inputWA' + i + 'b');
                var wa3Input = document.getElementById('inputWA' + i + 'c');

                if (questionInput.value === '' || caInput.value === '' || wa1Input.value === '' || wa2Input.value === '' || wa3Input.value === '') {
                    isValid = false;
                    questionInput.classList.add('is-invalid');
                    caInput.classList.add('is-invalid');
                    wa1Input.classList.add('is-invalid');
                    wa2Input.classList.add('is-invalid');
                    wa3Input.classList.add('is-invalid');
                } else {
                    questionInput.classList.remove('is-invalid');
                    caInput.classList.remove('is-invalid');
                    wa1Input.classList.remove('is-invalid');
                    wa2Input.classList.remove('is-invalid');
                    wa3Input.classList.remove('is-invalid');
                }
            }

            if (!isValid) {
                event.preventDefault();
                alert('Please fill in all the mandatory fields');
            }
        }
    </script>

</layout:page-container>
