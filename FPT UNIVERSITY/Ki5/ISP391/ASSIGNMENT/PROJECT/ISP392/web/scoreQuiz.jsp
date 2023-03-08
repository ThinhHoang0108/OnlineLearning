<%-- 
    Document   : scoreQuiz
    Created on : Mar 8, 2023, 10:39:06 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
    </head>
    <body>
        <main>

            <br>
            <br>
            <!-- Begin container -->
            <div class="container">

                <!-- Begin card -->
                <div class="card shadow rounded border-info"> 

                    <!-- Begin body -->
                    <div class="card-body">

                        <!-- card title -->
                        <h2 class="text-left" id="title" style="display: block;">Test Completed!</h2>
                        <hr class="line">
                        <div class="row">
                            <div class="col-md-1">
                            </div>
                            <div class="col-md-10">

                                <div id="mainContent">

                                    <div id = "score">
                                        <p>Your final score: ${requestScope.SCORE}</p>
                                        <div>
                                            <a href="home.jsp" class="btn bg-primary text-white rounded-pill mb-2" style="float: bottom"/>Home</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>               
                </div>
                <br>
                <!-- End main -->
                </main>
                <!-- link to external javascript -->
                <script src="./js/questions.js"></script>
                <script src="./js/script.js"></script>

                <!-- jQuery first, then Popper.js, then Bootstrap JS -->
                <!-- jQuery, javascript file for the Bootstrap's javascript file to function -->
                <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>

                <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>

                <!-- Bootstrap Javascript -->
                <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>

                <!-- End Body -->
                </body>
                </html>
