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
                            <h1 class="h3 mb-0 text-gray-800">Manager Quiz</h1>
                            <c:if test="${sessionScope.checkSuccess == 'false'}">
                                <p class="text-danger">${sessionScope.messageStatus}</p>
                            </c:if>
                            <c:if test="${sessionScope.checkSuccess == 'true'}">
                                <p class="text-success">${sessionScope.messageStatus}</p>
                            </c:if>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Manager Quiz</li>
                            </ol>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 mb-4">
                                <!-- Simple Tables -->
                                <div class="card">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <form action="search-question" method="get" style="width: 900px; float: right !important">
                                            <div class="input-group">
                                                <select name="courseID" class="form-control form-control-sm mb-auto" style="width: 40%">
                                                    <option value="0">Filter by Course</option>
                                                    <c:forEach items="${sessionScope.listCourse}" var="c">
                                                        <option value="${c.id}">${c.content}</option>
                                                    </c:forEach>
                                                </select>

                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <select name="lessonID" class="form-control form-control-sm mb-1" style="width: 1px">
                                                    <option value="0">Filter by Lesson</option>
                                                    <c:forEach items="${sessionScope.listLesson}" var="lv">
                                                        <option value="${lv.lessonID}">${lv.content}</option>
                                                    </c:forEach>
                                                </select>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <input type="search" name="keyword" id="form1" value="${requestScope.keyword}" class="form-control ms-2 mb-2 py-3" style="height: 38px !important;" placeholder="Search"/>
                                                <button type="submit" class="btn btn-primary mb-2">
                                                    <i class="fas fa-search"></i>
                                                </button>
                                            </div>
                                        </form>
                                        <a href="QuizDetailController?action=AddNewQuizz&message=0" class="btn btn-primary ms-5 pt-2" />Add New</a>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table align-items-center table-flush">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Content</th>
                                                    <th>Level</th>
                                                    <th>Quiz name</th>
                                                    <th class="d-flex justify-content-center">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${sessionScope.listQuestion}" var="lq">
                                                    <tr>
                                                        <td>${lq.questionID}</td>
                                                        <td>${lq.content}</td>
                                                        <td>${lq.quiz.quizlevel.quizLevelName}</td>
                                                        <td>${lq.quiz.content}</td>
                                                        <td class="d-flex justify-content-center">  
                                                            <c:if test="${lq.status == 'true'}">
                                                                <a href="#" class="btn btn-danger btn-primary">Deactive</a>
                                                                &nbsp;&nbsp;
                                                            </c:if>
                                                            <c:if test="${l1.status == 'false'}">
                                                                <a href="#" class="btn btn-success btn-primary">Active</a>
                                                                &nbsp;&nbsp;
                                                            </c:if>
                                                            <a href="#" class="btn btn-primary">Detail</a>  
                                                        </td>                                         
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="card-footer"> <div class="container">
                                            <c:choose>
                                                <c:when test="${listQuestion == null || listQuestion.size() ==0}">
                                                    Not have any Quiz
                                                </c:when>
                                                <c:when test="${totalPage < 2}">
                                                    <nav aria-label="Page nvarbar" class="d-flex justify-content-center">
                                                        <ul class="pagination">
                                                            <li class="page-item disabled">
                                                                <span class="page-link">Previous</span>
                                                            </li>
                                                            <c:forEach begin="1" end="${totalPage}" var="i">
                                                                <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                                                                </c:forEach>
                                                            <li class="page-item disabled">
                                                                <span class="page-link">Next</span>
                                                            </li>
                                                        </ul>
                                                    </nav>
                                                </c:when>  
                                                <c:when test="${page < 2}">
                                                    <nav aria-label="Page nvarbar" class="d-flex justify-content-center">
                                                        <ul class="pagination">
                                                            <li class="page-item disabled">
                                                                <span class="page-link">Previous</span>
                                                            </li>
                                                            <c:forEach begin="1" end="${totalPage}" var="i">
                                                                <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                                                                </c:forEach>
                                                            <li class="page-item">
                                                                <a class="page-link" href="${pagination_url}page=${page+1}">Next</a>
                                                            </li>
                                                        </ul>
                                                    </nav>
                                                </c:when>  
                                                <c:when test="${page + 1 > totalPage}">
                                                    <nav aria-label="Page nvarbar" class="d-flex justify-content-center">
                                                        <ul class="pagination">
                                                            <li class="page-item">
                                                                <a class="page-link" href="${pagination_url}page=${page-1}">Previous</a>
                                                            </li>
                                                            <c:forEach begin="1" end="${totalPage}" var="i">
                                                                <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                                                                </c:forEach>
                                                            <li class="page-item disabled">
                                                                <span class="page-link">Next</span>
                                                            </li>
                                                        </ul>
                                                    </nav>
                                                </c:when>
                                                <c:otherwise>
                                                    <nav aria-label="Page nvarbar" class="d-flex justify-content-center">
                                                        <ul class="pagination">
                                                            <li class="page-item">
                                                                <a class="page-link" href="${pagination_url}page=${page-1}">Previous</a>
                                                            </li>
                                                            <c:forEach begin="1" end="${totalPage}" var="i">
                                                                <li class="page-item ${i == page?"active":""}"><a class="page-link" href="${pagination_url}page=${i}">${i}</a></li>
                                                                </c:forEach>
                                                            <li class="page-item">
                                                                <a class="page-link" href="${pagination_url}page=${page+1}">Next</a>
                                                            </li>
                                                        </ul>
                                                    </nav>
                                                </c:otherwise>
                                            </c:choose>
                                        </div></div>
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