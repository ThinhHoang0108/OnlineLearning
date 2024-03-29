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
                <a href="home" class="logo me-xxl-auto"><img src="assets/img/logo.jpeg" alt="" class="img-fluid"></a>

                <nav id="navbar" class="navbar order-last order-lg-0">
                    <ul>
                        <li><a class="active" href="home">Home</a></li>
                        <li><a href="about">About</a></li>
                        <li><a href="courselist">Courses</a></li>
                        <li><a href="blog">Blog</a></li>

                        <li class="dropdown"><a href="#"><span>Categories</span> <i class="bi bi-chevron-down"></i></a>
                            <ul>
                                <c:forEach  items="${sessionScope.listCategories}" var="l">
                                    <li><a href="listCourseByCate?categoryID=${l.id}&cateName=${l.name}">${l.name}</a></li>
                                    </c:forEach>
                            </ul>
                        </li>
                        <c:choose>
                            <c:when test="${sessionScope.account != null}">
                                <li class="dropdown">
                                    <a href="#"><span>Profile</span> <i class="bi bi-chevron-down"></i></a>
                                    <ul>
                                        <li><a href="changeProfile.jsp"><i class="bi bi-person-circle">&nbsp;&nbsp;Your infomation</i></a></li> 
                                        <li><a href="quiz-list"><i class="bi bi-journal-bookmark">&nbsp;&nbsp;My taken quiz</i></a></li> 
                                        <li><a href="registration-list"><i class="bi bi-basket">&nbsp;&nbsp;My Registration</i></a></li>
                                            <c:if test="${sessionScope.account.roleID == 3}">
                                            <li> <a href="dashboard">
                                                    <i class="bi bi-person-fill-lock">&nbsp;&nbsp;Dashbord</i>
                                                </a></li>
                                            </c:if>
                                        <li>
                                            <a href="logout"> 
                                                <i class="bi bi-box-arrow-right">&nbsp;&nbsp;Logout</i> 
                                            </a>
                                        </li>
                                    </ul>
                                </li>
                            </c:when>
                            <c:otherwise>                
                                <a href="login.jsp"">Login</a>
                            </c:otherwise> 
                        </c:choose>

                    </ul>


                </nav><!-- .navbar -->

            </div>
        </header><!-- End Header -->
    </body>
</html>
