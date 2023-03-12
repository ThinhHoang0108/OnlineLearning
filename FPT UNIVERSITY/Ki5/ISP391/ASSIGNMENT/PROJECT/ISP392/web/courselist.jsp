<!DOCTYPE html>
<html lang="en">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Courses - Mentor Bootstrap Template</title>
        <meta content="" name="description">
        <meta content="" name="keywords">

        <!-- Favicons -->
        <link href="assets/img/favicon.png" rel="icon">
        <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

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
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/css/bootstrap.min.css" integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS" crossorigin="anonymous">
        <!-- =======================================================
        * Template Name: Mentor - v4.10.0
        * Template URL: https://bootstrapmade.com/mentor-free-education-bootstrap-theme/
        * Author: BootstrapMade.com
        * License: https://bootstrapmade.com/license/
        ======================================================== -->
    </head>

    <body>

        <!-- ======= Header ======= -->
        <%@ include file="component/nvabar.jsp" %>
        <!-- End Header -->

        <main id="main" data-aos="fade-in">

            <!-- ======= Breadcrumbs ======= -->
            <div class="breadcrumbs">
                <div class="container">
                    <h2>Courses</h2>
                    <p>View all course we have </p>
                </div>
            </div><!-- End Breadcrumbs -->

            <!-- ======= Courses Section ======= -->
            <section id="courses" class="courses">
                <div class="container" data-aos="fade-up">

                    <div class="row" data-aos="zoom-in" data-aos-delay="100">    
                        <c:forEach items="${sessionScope.listCoursebyPageing}" var="l" >
                            <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
                                <div class="course-item">
                                    <img src="${l.thumnailURL}" class="img-fluid" alt="...">
                                    <div class="course-content">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h4>${l.createDate}</h4> 
                                        </div>
                                        <h3><a href="coursedetail?courseID=${l.id}&method=get">${l.content}</a></h3>
                                    </div>
                                </div>
                            </div> <!-- End Course Item-->
                        </c:forEach>
                    </div>
                    <!-- End Course Item-->

            </section>
            <div class="container">
                <c:choose>
                    <c:when test="${listCoursebyPageing == null || listCoursebyPageing.size() ==0}">
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
            </div><!-- End Courses Section -->

        </main><!-- End #main -->
        <!-- ======= Footer ======= -->
        <%@ include file="component/footer.jsp" %>
        <!-- End Footer -->
        <div id="preloader"></div>
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.6/dist/umd/popper.min.js" integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>
        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>

    </body>

</html>