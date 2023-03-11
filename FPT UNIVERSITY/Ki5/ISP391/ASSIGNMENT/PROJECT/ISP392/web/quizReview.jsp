<%-- 
    Document   : quizz
    Created on : Mar 8, 2023, 2:10:39 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>  
        <!-- Required meta tags -->
        <!--Character Encoding : UTF-8 -->
        <meta charset="UTF-8" />  
        <!-- Setting The Viewport for Responsive web design -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <!-- Link to the external CSS file -->
        <!-- <link rel="stylesheet" href="./css/style.css">  -->
        <!--Title of the Website/Main page-->
        <title>Code Quiz</title> 
        <!--End of Head-->
    </head> 
    <body>
        <!-- Begin Header -->
        <!--        <header>   
                     Navigation Bar 
                    <nav class="navbar navbar-expand-md navbar-light bg-light">
                        <a class="nav-link text-primary" id = "navhighscorelink" >High Scores</a>
                        <span class="ml-auto" id="timer"></span>
                         End Navigation bar 
                    </nav>
                     End Header 
                </header> -->
        <!-- Begin main -->
        <main>
            <br>
            <br>
            <!-- Begin container -->
            <div class="container">
                <!-- Begin card -->
                <div class="card shadow rounded border-info"> 
                    <!-- Begin body -->
                    <div class="card-body">
                        <div class="d-flex justify-content-center">
                            <h2 class="card-title mb-4 text-info text-center" id="title">Quiz Review</h2>
                        </div>
                        <hr class="line">
                        <!-- card title -->
                        <form action="DoQuiz" method="post" id="myForm">
                            <input type="hidden" name="quizzID" value="${requestScope.quizzID}" />
                            <input type="hidden" name="courseID" value="${requestScope.courseID}" />
                            <input type="hidden" name="attempt" value="${requestScope.attempt}" />
                            <ol class="text-left">
                                <c:forEach items="${sessionScope.REVIEW_QUIZZ}" var="questionMap">
                                    <li class="ms-3"><h4 class="text-left" id="title" style="display: block;">${questionMap.key.content}</h4>
                                        <input type="hidden" name="questionID" value="${questionMap.key.questionID}">
                                        <ol type="a" class="m-3">
                                            <c:if test="${questionMap.key.isIsMultipleChoice() eq 'true'}">
                                                <c:forEach var="ans" items="${questionMap.value}">
                                                    <li class="d-flex mb-1">
                                                        <input type="checkbox" checked="check" name="answer_${questionMap.key.questionID}" value="${ans.answerID}" class="btn btn-primary rounded-pill mb-2" style="width: 14px">
                                                        <span class="col-11"><input type="text" name="name" value="${ans.content}" style="length:30px" readonly ></span>
                                                    </li>
                                                </c:forEach>
                                            </c:if>

                                            <c:if test="${questionMap.key.isIsMultipleChoice() ne 'true'}"><!-- Cau 1 dap an -->
                                                <c:forEach var="ans" items="${questionMap.value}">
                                                    <c:if test="${ans.correct eq  'true'}"><!-- La cau dung -->
                                                        <c:if test="${ans.userCheckQuestion eq 'true' }"><!-- La cau minh chon -->
                                                            <li class="d-flex mb-1 row">
                                                                <input type="radio" checked="check" name="answer_${questionMap.key.questionID}" value="${ans.answerID}" class="btn btn-primary rounded-pill mb-2" style="width: 14px">
                                                                <p class="text-success">&nbsp;&nbsp;${ans.content}</p>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${ans.userCheckQuestion ne 'true' }"><!-- Khong phai cau minh chon -->
                                                            <li class="d-flex mb-1 row">
                                                                <input type="radio" name="answer_${questionMap.key.questionID}" value="${ans.answerID}" class="btn btn-primary rounded-pill mb-2" style="width: 14px">
                                                                <p class="text-success">&nbsp;&nbsp;${ans.content}</p>
                                                            </li>
                                                        </c:if>
                                                    </c:if>
                                                    <c:if test="${ans.correct ne 'true'}"><!-- La cau sai -->
                                                        <c:if test="${ans.userCheckQuestion eq 'true' }"><!-- La cau minh chon -->
                                                            <li class="d-flex mb-1 row">
                                                                <input type="radio" checked="check" name="answer_${questionMap.key.questionID}" value="${ans.answerID}" class="btn btn-primary rounded-pill mb-2" style="width: 14px">
                                                                <p class="text-danger">&nbsp;&nbsp;${ans.content}</p>
                                                            </li>
                                                        </c:if>
                                                        <c:if test="${ans.userCheckQuestion ne 'true' }"><!-- Khong phai cau minh chon -->
                                                            <li class="d-flex mb-1 row">
                                                                <input type="radio"  name="answer_${questionMap.key.questionID}" value="${ans.answerID}" class="btn btn-primary rounded-pill mb-2" style="width: 14px">
                                                                <p>&nbsp;&nbsp;${ans.content}</p>
                                                            </li>
                                                        </c:if>
                                                    </c:if>
                                                </c:forEach>
                                            </c:if>
                                        </ol>
                                    </li>
                                    <hr class="line">
                                </c:forEach>
                            </ol>
                            <div class="col-12">
                                <div class="d-flex justify-content-center">
                                    <a href="home.jsp" class="btn bg-primary text-white rounded-pill mb-2" style="float: bottom"/>Home</a>
                                </div>
                            </div>     
                        </form>
                    </div>
                </div>               
            </div>
            <br>
            <!-- End main -->
        </main>
        <!--         link to external javascript 
                <script src="./js/questions.js"></script>
                <script src="./js/script.js"></script>-->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <!-- jQuery, javascript file for the Bootstrap's javascript file to function -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <!-- Bootstrap Javascript -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <!-- End Body -->
    </body>
</html>
