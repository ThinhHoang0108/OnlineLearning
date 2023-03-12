
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Bootstrap CRUD Data Table for Database with Modal Form</title>
        <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
        <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <link href="csslogin/manager.css" rel="stylesheet" type="text/css"/>
        <style>
            img{
                width: 200px;
                height: 300px;
            }
        </style>
    <body>

        <div class="container">
            <div class="table-wrapper">
                <div class="table-title">
                    <div class="row">
                        <div class="col-sm-6">
                            <h2>Manage <b> User</b></h2>
                        </div>
                        <div class="col-lg-4">
                            <a href="#addEmployeeModal" class="btn btn-success" data-toggle="modal"> <i class="material-icons">&#xE147;</i> <span>Add New User</span></a>				
                        </div>
                    </div>
                </div>
                <table class="table table-striped table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Name</th>
                            <th>DOB</th>
                            <th>Username</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${sessionScope.listUserByPageing}" var="o">
                            <tr>
                                <td>${o.userID}</td>
                                <td><a href="UserDetail?userID=${o.userID}">${o.name}</a></td>
                                <td>${o.dob}</td>                               
                                <td>${o.username}</td>

                            </tr>
                        </c:forEach>        


                    </tbody>
                </table>
            </div>
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
                                <input name="Dob" type="date" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>Phone</label>
                                <input name="phone" type="text" class="form-control" required>
                            </div>
                            <div class="form-group">
                                <label>UserName</label>
                                <input name="username" class="form-control" required></input>
                            </div>
                            <div class="form-group">
                                <label>Password</label>
                                <input name="password" class="form-control" required>
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
        <div class="container">
            <c:choose>
                <c:when test="${listUserByPageing == null || listUserByPageing.size() ==0}">
                    Not have any Course
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
        </div><


        <script src="js/manager.js" type="text/javascript"></script>
    </body>
</html>