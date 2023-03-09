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
    <script>
        function timerfunction() {
        <% HttpSession session1 = request.getSession();%>
            var minute = <%=(int) session1.getAttribute("TIMER")%>;
            minute--;
            var sec = 60;
            setInterval(function () {
                document.getElementById("timer").innerHTML = minute + " : " + sec;
                sec--;
                if (sec == 00) {
                    minute--;
                    sec = 60;
                }
                if (minute == 0 && sec == 1) {
                    document.getElementById("myForm").submit();
                }
            }, 1000);
        }
    </script>
    <body onload="timerfunction()">
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
                            <p class="p-1 form-control text-center bg-light text-dark my-auto ms-2" style="width: 90px" id="timer"><svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" width="24" height="24"><path d="M12.5 7.25a.75.75 0 00-1.5 0v5.5c0 .27.144.518.378.651l3.5 2a.75.75 0 00.744-1.302L12.5 12.315V7.25z"></path><path fill-rule="evenodd" d="M12 1C5.925 1 1 5.925 1 12s4.925 11 11 11 11-4.925 11-11S18.075 1 12 1zM2.5 12a9.5 9.5 0 1119 0 9.5 9.5 0 01-19 0z"></path></svg>Time</p>

                        </div>
                        <hr class="line">
                        <!-- card title -->
                        <form action="DoQuiz" method="post" id="myForm">
                            <input type="hidden" name="quizzID" value="${requestScope.quizzID}" />
                            <input type="hidden" name="courseID" value="${requestScope.courseID}" />
                            <input type="hidden" name="attempt" value="${requestScope.attempt}" />
                            <ol class="text-left">
                                <c:forEach items="${sessionScope.DOING_QUIZZ}" var="questionMap">
                                    <li class="ms-3"><h4 class="text-left" id="title" style="display: block;">${questionMap.key.content}</h4>
                                        <input type="hidden" name="questionID" value="${questionMap.key.questionID}">
                                        <ol type="a" class="m-3">
                                            <c:if test="${questionMap.key.isIsMultipleChoice() eq 'true'}">
                                                <c:forEach var="ans" items="${questionMap.value}">
                                                    <li class="d-flex mb-1">
                                                        <input type="checkbox" name="answer_${questionMap.key.questionID}" value="${ans.answerID}" class="btn btn-primary rounded-pill mb-2" style="width: 14px">
                                                        <span class="col-11"><input type="text" name="name" value="${ans.content}" style="length:30px" readonly ></span>
                                                    </li>
                                                </c:forEach>
                                            </c:if>
                                            <c:if test="${questionMap.key.isIsMultipleChoice() ne 'true'}">
                                                <c:forEach var="ans" items="${questionMap.value}">
                                                    <li class="d-flex mb-1 row">
                                                        <input type="radio" name="answer_${questionMap.key.questionID}" value="${ans.answerID}" class="btn btn-primary rounded-pill mb-2" style="width: 14px">
                                                        <p>&nbsp;&nbsp;${ans.content}</p>
                                                    </li>
                                                </c:forEach>
                                            </c:if>
                                        </ol>
                                    </li>
                                    <hr class="line">
                                </c:forEach>
                            </ol>
                            <div class="col-12">
                                <div class="d-flex justify-content-center">
                                    <!--<button type="submit" class="btn btn-primary px-4 py-2 fw-bold">check</button>-->
                                    <button type="submit" name="btnAction" value="submitQuizz" class="btn btn-primary px-4 py-2 fw-bold">Submit</button> 
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
