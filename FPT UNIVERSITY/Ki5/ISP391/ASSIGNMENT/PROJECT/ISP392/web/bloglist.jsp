<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">

    <head>
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
        <link href="dashboard/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">

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

        <main id="main">

            <!-- ======= Breadcrumbs ======= -->
            <div class="breadcrumbs" data-aos="fade-in">
                <div class="container">
                    <h2>Blog</h2>
                </div>
            </div><!-- End Breadcrumbs -->

            <!-- ======= Events Section ======= -->
            <section id="events" class="events">
                <div class="container" data-aos="fade-up">
                    <div class="col-lg-4 col-md-6 d-flex align-items-start">
                        <form action="search-blog" method="post">
                            <div class="input-group">
                                <input type="search" name="keyword" id="form1" value="${requestScope.keyword}" class="form-control ms-2 mb-2 py-3" style="height: 38px !important;" placeholder="Search"/>
                                <button id="search-button" type="submit" class="btn btn-primary mb-5">
                                    <i class="fas fa-search"></i>
                                </button>
                            </div>
                        </form>  
                    </div>
                    <div class="row">
                        <c:forEach items="${sessionScope.listBlogByPageing}" var="g" >
                            <div class="col-md-6 d-flex align-items-stretch">
                                <div class="card">
                                    <div class="card-img">
                                        <a href="blogdetail?blogID=${g.id}">
                                            <img src="${g.thumnailURL}" alt="Image" class="img-fluid">
                                        </a>

                                    </div>

                                    <div class="card-body">
                                        <h5 class="card-title"><a href="blogdetail?blogID=${g.id}">${g.content}</a></h5>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                </div>

            </section><!-- End Events Section -->
            <div class="container">
                <c:choose>
                    <c:when test="${listBlogByPageing == null || listBlogByPageing.size() ==0}">
                        Not have any Blog
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
            </div>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.2.1/dist/js/bootstrap.min.js" integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k" crossorigin="anonymous"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>

    </body>

</html>