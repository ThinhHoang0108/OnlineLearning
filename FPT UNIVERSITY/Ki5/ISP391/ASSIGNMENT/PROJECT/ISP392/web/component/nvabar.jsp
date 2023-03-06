<%-- 
    Document   : nvabar
    Created on : Feb 1, 2023, 9:45:36 AM
    Author     : ADMIN
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">
        <meta content="" name="description">
        <meta content="" name="keywords">
        <!-- Google Fonts -->
        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendor/animate.css/animate.min.css" rel="stylesheet">
        <link href="assets/vendor/aos/aos.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
        <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet">
        <link href="assets/vendor/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">

        <!-- =======================================================
        * Template Name: Mentor - v4.10.0
        * Template URL: https://bootstrapmade.com/mentor-free-education-bootstrap-theme/
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    </head>
    <body>
        <!-- ======= Header ======= -->
        <header id="header" class="fixed-top">
            <div class="container d-flex align-items-center">

                <h1 class="logo me-xxl-5"><a href="home.jsp"></a></h1>
                <!-- Uncomment below if you prefer to use an image logo -->
                <a href="home.jsp" class="logo me-xxl-auto"><img src="assets/img/logo.jpeg" alt="" class="img-fluid"></a>

                <nav id="navbar" class="navbar order-last order-lg-0">
                    <ul>
                        <li><a class="active" href="home.jsp">Home</a></li>
                        <li><a href="about">About</a></li>
                        <li><a href="courselist">Courses</a></li>
                        <li><a href="blog">Blog</a></li>

                        <li class="dropdown"><a href="#"><span>Categories</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <c:forEach  items="${sessionScope.listCategories}" var="l">
                                    <li><a href="#">${l.name}</a></li>
                                    </c:forEach>
                            </ul>
                        </li>
                    </ul>
                    <c:choose>
                        <c:when test="${sessionScope.account != null}">
                            <c:choose>
                                <c:when test="${sessionScope.account.roleID == 2}">
                                    <a href="userprofile"><span class="material-icons">
                                            account_circle 
                                        </span>
                                    </a>
                                </c:when>
                                <c:otherwise>
                                    <a href="dashboard">
                                        Dashboard
                                    </a>
                                </c:otherwise>
                            </c:choose>
                            <a href="logout"> 
                                <span class="material-icons">
                                    logout
                                </span>
                            </a>
                        </c:when>
                        <c:otherwise>                
                            <a href="login.jsp"">Login</a>
                        </c:otherwise>
                    </c:choose>


                </nav><!-- .navbar -->

            </div>
        </header><!-- End Header -->
    </body>
</html>
