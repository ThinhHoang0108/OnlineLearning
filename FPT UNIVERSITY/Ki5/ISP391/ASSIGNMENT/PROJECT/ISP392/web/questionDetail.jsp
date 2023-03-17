<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="">
        <title>Admin - Dashboard</title>
        <link href="dashboard/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
        <link href="dashboard/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
        <link href="dashboard/css/ruang-admin.min.css" rel="stylesheet">
    </head>

    <body id="page-top">
        <div id="wrapper">
            <!-- Sidebar -->
            <%@ include file="component/adminNvabar.jsp" %>
            <!-- Sidebar -->
            <div id="content-wrapper" class="d-flex flex-column">
                <div id="content">
                    <!-- TopBar -->
                    <nav class="navbar navbar-expand navbar-light bg-navbar topbar mb-4 static-top">
                        <button id="sidebarToggleTop" class="btn btn-link rounded-circle mr-3">
                            <i class="fa fa-bars"></i>
                        </button>
                    </nav>
                    <!-- Topbar -->
                    <!-- Container Fluid-->
                    <div class="container-fluid" id="container-wrapper">
                        <div class="d-sm-flex align-items-center justify-content-between mb-4">
                            <h1 class="h3 mb-0 text-gray-800">Manager Question</h1>
                            <!--<c:if test="${sessionScope.checkSuccess == 'false'}">
                                 <p class="text-danger">${sessionScope.messageStatus}</p>
                            </c:if>
                            <c:if test="${sessionScope.checkSuccess == 'true'}">
                                <p class="text-success">${sessionScope.messageStatus}</p>
                            </c:if> -->
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item"><a href="question-list">Manager Question</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Question Detail</li>
                            </ol>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 mb-4">
                                <div class ="row" style="margin-top: 80px">
                                    <div class="mb-3 mx-auto d-block shadow p-3 mb-5 bg-white rounded" style="padding: 10px 24px 14px 24px !important; border-radius: 8px; width: 80%; margin-left: 10px; width: 100% !important">
                                        <div class="row mt-3">
                                            <h4>Question: </h4>
                                            &nbsp;&nbsp;&nbsp;&nbsp;
                                            <form action="updateQuestion" class="row">
                                                <input type="hidden" name="questionID" value="${requestScope.QUESTION.questionID}">

                                                <div class="col"  style="width: 800px">
                                                    <input class="form-control" type="text" name="questionContent"  value="${requestScope.QUESTION.content}">
                                                </div>
                                                <div class="col-1">
                                                    <button type="submit" name="action" value="Update" class="btn btn-success">Update</button>
                                                </div>

                                            </form>
                                        </div>
                                        <div class="row">
                                            <br>
                                        </div>
                                        <ol type="A">
                                            <c:forEach var="a" items="${requestScope.ANSWER}">
                                                <li>
                                                    <form action="updateAnswer" class="row">
                                                        <input type="hidden" name="questionID" value="${requestScope.QUESTION.questionID}">
                                                        <input type="hidden" name="answerID" value="${a.answerID}">
                                                        <div class="col-6">
                                                            <input class="form-control col-6" type="text" name="answerContent" value="${a.content}">
                                                        </div>
                                                        <div class="col-1">
                                                            <select name="isCorrect" id="true" class="form-control">
                                                                <option value="${a.correct}" selected>${a.correct}</option>
                                                                <option value="true">True</option>
                                                                <option value="false">False</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-3">
                                                            <button type="submit" name="action" value="Update" class="btn btn-success">Update</button>
                                                            <button type="submit" name="action" value="Delete" class="btn btn-danger">Delete</button>
                                                        </div>
                                                    </form>
                                                </li>
                                                <br>
                                            </c:forEach>
                                            <form action="updateAnswer">
                                                <li>
                                                    <div class="row">
                                                        <input type="hidden" name="questionID" value="${requestScope.QUESTION.questionID}">
                                                        <div class="col-6">
                                                            <input class="form-control col-6" type="text" name="answerContent" value="">
                                                        </div>
                                                        <div class="col-1">
                                                            <select name="isCorrect" id="true" class="form-control">
                                                                <option value="true" selected="">True</option>
                                                                <option value="false">False</option>
                                                            </select>
                                                        </div>
                                                        <div class="col-3">
                                                            <button type="submit" name="action" value="Add" class="btn btn-primary">Add New</button>
                                                        </div>
                                                    </div>
                                                </li>
                                            </form>

                                        </ol>

                                    </div><br>
                                </div>

                            </div>
                        </div>
                        <!--Row-->
                    </div>
                    <!---Container Fluid-->
                </div>
            </div>
        </div>

        <!-- Scroll to top -->
        <a class="scroll-to-top rounded" href="#page-top">
            <i class="fas fa-angle-up"></i>
        </a>

        <script src="dashboard/vendor/jquery/jquery.min.js"></script>
        <script src="dashboard/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="dashboard/vendor/jquery-easing/jquery.easing.min.js"></script>
        <script src="dashboard/js/ruang-admin.min.js"></script>
        <script src="dashboard/vendor/chart.js/Chart.min.js"></script>
        <script src="dashboard/js/demo/chart-area-demo.js"></script>  
    </body>

</html>