<%-- 
    Document   : practice-quiz
    Created on : Mar 4, 2023, 4:29:41 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html> 
    <!--Head: Contains meta info-->
    <head>  
        <!-- Required meta tags -->
        <!--Character Encoding : UTF-8 -->
        <!-- Setting The Viewport for Responsive web design -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0, shrink-to-fit=no">
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" integrity="sha384-9aIt2nRpC12Uk9gS9baDl411NQApFmC26EwAOH8WgZl5MYYxFfc+NcPb1dKGj7Sk" crossorigin="anonymous">
        <!-- Link to the external CSS file -->
        <!-- <link rel="stylesheet" href="./css/style.css">  -->
        <!--Title of the Website/Main page-->
        <!--End of Head-->
    </head> 
    <!-- Bagin Body -->
    <body>
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
                        <!-- card title -->
                        <h5 class="text-left" id="title" style="display: block;">Commonly used data types DO NOT include:</h5>
                        <div class="row">
                            <div class="col-md-10">
                                <div id = "quizContent">
                                    <div><button data-index="0" class="btn btn-primary rounded-pill mb-2">1. strings</button></div>
                                    <div><button data-index="1" class="btn btn-primary rounded-pill mb-2">2. booleans</button></div>
                                    <div><button data-index="2" class="btn btn-primary rounded-pill mb-2">3. alerts</button></div>
                                    <div><button data-index="3" class="btn btn-primary rounded-pill mb-2">4. numbers</button></div>
                                </div>
                            </div>
                        </div>
                        <hr class="line">
                    </div>
                </div>               
            </div>
            <br>
            <!-- End main -->
        </main>
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <!-- jQuery, javascript file for the Bootstrap's javascript file to function -->
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
        <!-- Bootstrap Javascript -->
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js" integrity="sha384-OgVRvuATP1z7JjHLkuOU7Xw704+h835Lr+6QL9UvYjZE3Ipu6Tp75j7Bh/kR0JKI" crossorigin="anonymous"></script>
        <!-- End Body -->
    </body>

</html>
