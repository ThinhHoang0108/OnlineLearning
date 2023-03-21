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
                            <h1 class="h3 mb-0 text-gray-800">Manager User</h1>
                            <p>${message1}</p>
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="dashboard">Dashboard</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Manager User</li>
                            </ol>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 mb-4">
                                <!-- Simple Tables -->
                                <div class="card">
                                    <div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                        <form action="search-user" method="get" style="width: 900px; float: right !important">
                                            <div class="input-group">

                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <select name="roleID" class="form-control form-control-sm mb-1" style="width: 5vh">
                                                    <option value="0">Filter by Role</option>
                                                    <c:forEach items="${sessionScope.listRole}" var="lv">
                                                        <option value="${lv.role_id}">${lv.role_name}</option>
                                                    </c:forEach>
                                                </select>
                                                &nbsp;&nbsp;&nbsp;&nbsp;
                                                <button type="submit" class="btn btn-primary mb-2">
                                                    <i class="fas fa-search"></i>
                                                </button>
                                            </div>
                                        </form>
                                        <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"> <i class="material-icons">&#xE147;</i> <span>Add New User</span></a>                                    </div>
                                    <div class="table-responsive">
                                        <table class="table align-items-center table-flush">
                                            <thead class="thead-light">
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Name</th>
                                                    <th>DOB</th>
                                                    <th>Role</th>
                                                    <th>Username</th>                                                 
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach items="${sessionScope.listUserByPageing}" var="o">

                                                    <tr>
                                                        <td>${o.userID}</td>
                                                        <td><a href="UserDetail?userID=${o.userID}">${o.name}</a></td>
                                                        <td>${o.dob}</td> 
                                                        <td>${o.role.role_name}</td>
                                                        <td>${o.username}</td>

                                                    </tr>

                                                </c:forEach>  
                                            </tbody>
                                        </table>
                                    </div>
                                    <div id="addEmployeeModal" class="modal fade">
                                        <div class="modal-dialog">
                                            <div class="modal-content">
                                                <form action="addUser" >
                                                    <div class="modal-header">						
                                                        <h4 class="modal-title">Add User</h4>
                                                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    </div>
                                                    <div class="modal-body">					

                                                        <div class="form-group">
                                                            <label>Name</label>
                                                            <input name="name" type="text" class="form-control" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Dob</label>
                                                            <input name="dob" type="date" class="form-control" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Phone</label>
                                                            <input name="phone" type="text" class="form-control" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Email</label>
                                                            <input name="email" type="text" class="form-control" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>UserName</label>
                                                            <input name="username" class="form-control" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Password</label>
                                                            <input name="password" class="form-control" required>
                                                        </div>
                                                        <div class="form-group">
                                                            <label>Role</label>
                                                            <select name="role" class="form-select" aria-label="Default select example">
                                                                <c:forEach items="${listRole}" var="lc">
                                                                    <option value="${lc.role_id}">${lc.role_name}</option>
                                                                </c:forEach>
                                                            </select>
                                                        </div>


                                                    </div>
                                                    <div class="modal-footer">
                                                        <input type="button" class="btn btn-default" data-dismiss="modal" value="Cancel">
                                                        <input type="submit" class="btn btn-success" value="Add">
                                                    </div>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="card-footer"> <div class="container">
                                            <c:choose>
                                                <c:when test="${listUserByPageing == null || listUserByPageing.size() ==0}">
                                                    Not have any User
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