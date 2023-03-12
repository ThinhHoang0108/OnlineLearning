<%-- 
    Document   : Registration
    Created on : Mar 13, 2023, 3:43:15 AM
    Author     : dell
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

        <link rel="icon" type="image/x-icon" href="assets/favicon.ico" />
        <!-- Bootstrap icons-->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
        <link href="css/dashboard.css" rel="stylesheet" />
        <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/js/all.min.js" crossorigin="anonymous"></script>
        <!--        <script src="js/scripts.js"></script>-->
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <!-- MDB -->
        <link rel="icon" href="img/mdb-favicon.ico" type="image/x-icon" />
        <!-- Font Awesome -->
        <link
            rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css"
            />
        <!-- Google Fonts Roboto -->
        <link
            rel="stylesheet"
            href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap"
            />
        <!-- MDB -->
        <link rel="stylesheet" href="css/dashboard.css" />
        <link rel="stylesheet" href="css/mdb.min.css" />
        <!-- MDB -->
        <script type="text/javascript" src="js/navbarCategory.js"></script>
        <script type="text/javascript" src="js/mdb.min.js"></script>
        <!-- Custom scripts -->
        <script type="text/javascript"></script>
    </head>

    <body class="sb-sidenav-toggled">
        <%@include file="components/navBarComponent.jsp" %>

        <div id="layoutSidenav" class="mb-4">
            <%@include file="components/catgoryComponent_1.jsp" %>
            <div id="layoutSidenav_content">
                <div class="container-fluid px-4 px-lg-5 mb-5" style="margin-top: 91px">
                    <h1>Registration List</h1>
                    <div class="text-danger">${sessionScope.messageRegis}</div>
                    <form action="filter-registration" method="POST" style="width: 1000px; float: right !important">

                        <div class="input-group row">
                            <div class="col-3">
                                Subject:
                                <select name="subId" class="form-control" style="margin: 2px">
                                    <option value="0">All Subject</option>
                                    <c:forEach items="${listSubjects}" var="S">
                                        <option value="${S.subjectId}" ${S.subjectId == requestScope.subId?"selected":""}>${S.subjectName}</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="col-2">
                                Date From: 
                                <input type="date" class="form-control" value="${requestScope.date_from}" style="margin-top: 2px" id="Date_From" name="date_from" placeholder="Date From">
                            </div>
                            <div class="col-2">
                                Date To:<br>
                                <input type="date" class="form-control col-3" value="${requestScope.date_to}" style="margin-top: 2px; margin-left: 1px" id="Date_To" name="date_to" placeholder="Date To">
                            </div>
                            <div class="col-5">
                                <br>
                                <div class="d-flex">
                                    <input type="search" name="keyword" id="form1" value="${requestScope.email}" class="form-control mb-2 py-3" style="height: 38px !important;" placeholder="Search By Email"/>
                                    <button type="submit" class="btn btn-primary mb-2">
                                        <i class="fas fa-search"></i>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </form> 
                    <div class ="row" style="margin-top: 80px">

                        <div class="mb-3 mx-auto d-block shadow p-3 mb-5 bg-white rounded" style="padding: 10px 0px 14px 24px !important; border-radius: 8px; width: 32%; margin-left: 10px; width: 100% !important">
                            <table class="table table-bordered table-hover table-striped row">
                                <thead>
                                    <tr class="row text-center">
                                        <th class="col-1">ID</th>
                                        <th class="col-2">Email</th>
                                        <th class="col-2">Price Package Name</th>
                                        <th class="col-1">Price</th>
                                        <th class="col-2">Subject Name</th>
                                        <th class="col-2">Regis Date</th>
                                        <th class="col-2">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${sessionScope.listRegistration}" var="R">
                                        <tr class="row">
                                            <td class="col-1 text-center">${R.regisId}</td>
                                            <td class="col-2 text-center">${R.email}</td>
                                            <td class="col-2 text-center">${R.priceName}</td>
                                            <td class="col-1 text-center">${R.price}</td>
                                            <td class="col-2 text-center">${R.subName}</td>
                                            <td class="col-2 text-center">${R.regisDate}</td>
                                            <td class="col-2 text-center">
                                                <c:if test="${R.status == 'true'}">
                                                    <a href="edit-status-regis?action=hide&regisId=${R.regisId}" class="btn btn-danger"/>Lock</a>
                                                </c:if>
                                                <c:if test="${R.status == 'false'}">
                                                    <a href="edit-status-regis?action=show&regisId=${R.regisId}" class="btn btn-success"/>Unlock</a>
                                                </c:if>

                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div><br>
                    </div>
                </div>
            </div>
        </div>



    </body>
</html>
