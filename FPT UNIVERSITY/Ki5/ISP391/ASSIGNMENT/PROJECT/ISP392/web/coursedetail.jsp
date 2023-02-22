<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Course Details - Mentor Bootstrap Template</title>
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
                    <h2>Course Details</h2>
                    <p>Est dolorum ut non facere possimus quibusdam eliasdasdadasdgendi voluptatem. Quia id aut similique quia voluptas sit quaerat debitis. Rerum omnis ipsam aperiam consequatur laboriosam nemo harum praesentium. </p>
                </div>
            </div><!-- End Breadcrumbs -->

            <!-- ======= Cource Details Section ======= -->
            <section id="course-details" class="course-details">
                <div class="container" data-aos="fade-up">

                    <div class="row">
                        <div class="col-lg-8">
                            <img src="assets/img/course-details.jpg" class="img-fluid" alt="">
                            <h3>Et enim incidunt fuga tempora</h3>
                            <p>
                                Qui et explicabo voluptatem et ab qui vero et voluptas. Sint voluptates temporibus quam autem. Atque nostrum voluptatum laudantium a doloremque enim et ut dicta. Nostrum ducimus est iure minima totam doloribus nisi ullam deserunt. Corporis aut officiis sit nihil est. Labore aut sapiente aperiam.
                                Qui voluptas qui vero ipsum ea voluptatem. Omnis et est. Voluptatem officia voluptatem adipisci et iusto provident doloremque consequatur. Quia et porro est. Et qui corrupti laudantium ipsa.
                                Eum quasi saepe aperiam qui delectus quaerat in. Vitae mollitia ipsa quam. Ipsa aut qui numquam eum iste est dolorum. Rem voluptas ut sit ut.
                            </p>
                        </div>
                        <div class="col-lg-4">

                            <div class="course-info d-flex justify-content-between align-items-center">
                                <h5>Trainer</h5>
                                <p><a href="#">Walter White</a></p>
                            </div>

                            <div class="course-info d-flex justify-content-between align-items-center">
                                <h5>Course Fee</h5>
                                <p>$165</p>
                            </div>

                            <div class="course-info d-flex justify-content-between align-items-center">
                                <h5>Available Seats</h5>
                                <p>30</p>
                            </div>

                            <div class="course-info d-flex justify-content-between align-items-center">
                                <h5>Schedule</h5>
                                <p>5.00 pm - 7.00 pm</p>
                            </div>

                        </div>
                    </div>

                </div>
            </section><!-- End Cource Details Section -->

            <!-- ======= Cource Details Tabs Section ======= -->
            <section id="cource-details-tabs" class="cource-details-tabs">
                <div class="container" data-aos="fade-up">

                    <div class="row">
                        <div class="col-lg-3">
                            <ul class="nav nav-tabs flex-column">
                                <c:forEach items="${listSubject}" var="l">
                                    <li class="nav-item">
                                        <a class="nav-link" data-bs-toggle="tab" href="#tab-${l.subjectID}">${l.content}</a>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                        <div class="col-lg-9 mt-4 mt-lg-0">
                            <div class="tab-content">
                                <c:forEach items="${listSubject}" var="g">
                                    <div class="tab-pane" id="tab-${g.subjectID}">
                                        <div class="row">
                                            <div class="col-lg-8 details order-2 order-lg-1">
                                                <h2>${g.description}</h2>
                                                <iframe width="800" height="500" src="https://www.youtube.com/embed/${g.thumbnail}" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>

                </div>
            </section><!-- End Cource Details Tabs Section -->

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

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>

    </body>

</html>