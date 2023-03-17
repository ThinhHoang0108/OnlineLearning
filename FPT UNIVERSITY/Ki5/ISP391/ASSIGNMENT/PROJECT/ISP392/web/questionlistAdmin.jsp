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
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
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
                            <h1 class="h3 mb-0 text-gray-800">Question List</h1>
                            <c:if test="${sessionScope.checkSuccess == 'false'}">
                                <p class="text-danger">${sessionScope.messageStatus}</p>
                            </c:if>
                            <c:if test="${sessionScope.checkSuccess == 'true'}">
                                <p class="text-success">${sessionScope.messageStatus}</p>
                            </c:if>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="dashboard.jsp">Dashboard</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Manager Question</li>
                            </ol>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 mb-4">
                                <!-- Simple Tables -->
                                <div class="card">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
                                            Add
                                        </button>
                                    </div>
                                    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <form action="insert-questionAD" method="post">
                                                    <div class="modal-header">
                                                        <h5 class="modal-title" id="exampleModalLabel">Insert Question</h5>
                                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                                    </div>
                                                    <div class="modal-body">
                                                        <p>Content</p>
                                                        <input type="hidden" name="courseID" value="${requestScope.courseID}" />
                                                        <input type="hidden" name="quizID" value="${requestScope.quizID}">
                                                        <input type="hidden" name="lessonID" value="${requestScope.lessonID}" />
                                                        <input type="text" name="content" value="" class="form-control">
                                                        <br>
                                                    </div>
                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                        <input type="submit" value="insert" name="action" class="btn btn-primary"/>
                                                    </div>
                                                </form>

                                            </div>
                                        </div>
                                    </div>
                                    <div class="table-responsive">
                                        <table class="table align-items-center table-flush">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Content</th>
                                                    <th>Course ID</th>
                                                    <th>Lesson ID</th>
                                                    <th>Status</th>
                                                    <th class="d-flex justify-content-center">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${QUESTIONS}" var="lq">
                                                    <tr>
                                                        <td>${lq.questionID}</td>
                                                        <td>${lq.content}</td>
                                                        <td>${lq.courseID}</td>
                                                        <td>${lq.lessonID}</td>
                                                        <td> <c:if test="${lq.status == 'true'}">
                                                                <span class="badge badge-success">Actice</span>
                                                            </c:if>
                                                            <c:if test="${l1.status == 'false'}">
                                                                <span class="badge badge-danger">Pending</span>
                                                            </c:if>
                                                        </td>
                                                        <td class="d-flex justify-content-center">  
                                                            <!--  <c:if test="${lq.status == 'true'}">
                                                                 <a href="#" class="btn btn-danger btn-primary">Deactive</a>
                                                                 &nbsp;&nbsp;
                                                            </c:if>
                                                            <c:if test="${l1.status == 'false'}">
                                                                <a href="#" class="btn btn-success btn-primary">Active</a>
                                                                &nbsp;&nbsp;
                                                            </c:if>
                                                            -->
                                                            <a href="question-detailAD?questionID=${lq.questionID}" class="btn btn-primary">Detail</a>  
                                                        </td>                                         
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>

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
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </body>

</html>