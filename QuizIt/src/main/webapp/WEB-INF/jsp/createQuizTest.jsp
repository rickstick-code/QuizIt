<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="bootstrap" tagdir="/WEB-INF/tags/bootstrap" %>
<%@taglib prefix="layout" tagdir="/WEB-INF/tags/layout" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<layout:page-container title="QuizIT" activePage="createQuiz">

    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <c:set var="errors" value="${requestScope['org.springframework.validation.BindingResult.customQuiz']}" />
                <fieldset>
                    <legend>Create Custom Quiz</legend>

                    <div class="mb-3">
                        "*" marks mandatory fields
                    </div>

                    <div class="mb-3">
                        <label for="inputQuizName" class="form-label">Quiz Name</label>
                        <input type="text" class="form-control" id="inputQuizName" aria-describedby="Name" placeholder="Give your Quiz a name">
                    </div>

                    <div class="mb-3">
                        <label for="inputQuestion1" class="form-label">Question 1*</label>
                        <input type="text" class="form-control" id="inputQuestion1" aria-describedby="Question1" placeholder="Your Question here">
                        <table class="table table-borderless">
                            <tr>
                                <td>Correct Answer</td>
                                <td>Wrong Answer 1</td>
                                <td>Wrong Answer 2</td>
                                <td>Wrong Answer 3</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="inputCA1" aria-describedby="CA1">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA1a" aria-describedby="WA1a">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA1b" aria-describedby="WA1b">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA1c" aria-describedby="WA1c">
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="mb-3">
                        <label for="inputQuestion2" class="form-label">Question 2*</label>
                        <input type="text" class="form-control" id="inputQuestion2" aria-describedby="Question2" placeholder="Your Question here">
                        <table class="table table-borderless">
                            <tr>
                                <td>Correct Answer</td>
                                <td>Wrong Answer 1</td>
                                <td>Wrong Answer 2</td>
                                <td>Wrong Answer 3</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="inputCA2" aria-describedby="CA2">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA2a" aria-describedby="WA2a">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA2b" aria-describedby="WA2b">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA2c" aria-describedby="WA2c">
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="mb-3">
                        <label for="inputQuestion3" class="form-label">Question 3*</label>
                        <input type="text" class="form-control" id="inputQuestion3" aria-describedby="Question3" placeholder="Your Question here">
                        <table class="table table-borderless">
                            <tr>
                                <td>Correct Answer</td>
                                <td>Wrong Answer 1</td>
                                <td>Wrong Answer 2</td>
                                <td>Wrong Answer 3</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="inputCA3" aria-describedby="CA3">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA3a" aria-describedby="WA3a">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA3b" aria-describedby="WA3b">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA3c" aria-describedby="WA3c">
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="mb-3">
                        <label for="inputQuestion4" class="form-label">Question 4</label>
                        <input type="text" class="form-control" id="inputQuestion4" aria-describedby="Question4" placeholder="Your Question here">
                        <table class="table table-borderless">
                            <tr>
                                <td>Correct Answer</td>
                                <td>Wrong Answer 1</td>
                                <td>Wrong Answer 2</td>
                                <td>Wrong Answer 3</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="inputCA4" aria-describedby="CA4">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA4a" aria-describedby="WA4a">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA4b" aria-describedby="WA4b">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA4c" aria-describedby="WA4c">
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="mb-3">
                        <label for="inputQuestion5" class="form-label">Question 5</label>
                        <input type="text" class="form-control" id="inputQuestion5" aria-describedby="Question5" placeholder="Your Question here">
                        <table class="table table-borderless">
                            <tr>
                                <td>Correct Answer</td>
                                <td>Wrong Answer 1</td>
                                <td>Wrong Answer 2</td>
                                <td>Wrong Answer 3</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="inputCA5" aria-describedby="CA5">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA5a" aria-describedby="WA5a">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA5b" aria-describedby="WA5b">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA5c" aria-describedby="WA5c">
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="mb-3">
                        <label for="inputQuestion6" class="form-label">Question 6</label>
                        <input type="text" class="form-control" id="inputQuestion6" aria-describedby="Question6" placeholder="Your Question here">
                        <table class="table table-borderless">
                            <tr>
                                <td>Correct Answer</td>
                                <td>Wrong Answer 1</td>
                                <td>Wrong Answer 2</td>
                                <td>Wrong Answer 3</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="inputCA6" aria-describedby="CA6">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA6a" aria-describedby="WA6a">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA6b" aria-describedby="WA6b">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA6c" aria-describedby="WA6c">
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="mb-3">
                        <label for="inputQuestion7" class="form-label">Question 7</label>
                        <input type="text" class="form-control" id="inputQuestion7" aria-describedby="Question7" placeholder="Your Question here">
                        <table class="table table-borderless">
                            <tr>
                                <td>Correct Answer</td>
                                <td>Wrong Answer 1</td>
                                <td>Wrong Answer 2</td>
                                <td>Wrong Answer 3</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="inputCA7" aria-describedby="CA7">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA7a" aria-describedby="WA7a">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA7b" aria-describedby="WA7b">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA7c" aria-describedby="WA7c">
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="mb-3">
                        <label for="inputQuestion8" class="form-label">Question 8</label>
                        <input type="text" class="form-control" id="inputQuestion8" aria-describedby="Question8" placeholder="Your Question here">
                        <table class="table table-borderless">
                            <tr>
                                <td>Correct Answer</td>
                                <td>Wrong Answer 1</td>
                                <td>Wrong Answer 2</td>
                                <td>Wrong Answer 3</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="inputCA8" aria-describedby="CA8">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA8a" aria-describedby="WA8a">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA8b" aria-describedby="WA8b">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA8c" aria-describedby="WA8c">
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="mb-3">
                        <label for="inputQuestion9" class="form-label">Question 9</label>
                        <input type="text" class="form-control" id="inputQuestion9" aria-describedby="Question9" placeholder="Your Question here">
                        <table class="table table-borderless">
                            <tr>
                                <td>Correct Answer</td>
                                <td>Wrong Answer 1</td>
                                <td>Wrong Answer 2</td>
                                <td>Wrong Answer 3</td>
                            </tr>
                            <tr>
                                <td>
                                    <input type="text" class="form-control" id="inputCA9" aria-describedby="CA9">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA9a" aria-describedby="WA9a">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA9b" aria-describedby="WA9b">
                                </td>
                                <td>
                                    <input type="text" class="form-control" id="inputWA9c" aria-describedby="WA9c">
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="mb-3">
                        <button type="submit" class="btn btn-primary">Submit</button>
                        <a href="customQuiz" class="btn btn-default">Cancel</a>
                    </div>

                </fieldset>
        </div>
    </div>

</layout:page-container>