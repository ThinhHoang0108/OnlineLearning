<!DOCTYPE html>

<html lang="en">
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <!-- Template Main CSS File -->
        <link href="assets/css/style.css" rel="stylesheet">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://getbootstrap.com/docs/5.3/assets/css/docs.css" rel="stylesheet">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    </head>

    <body>
        <%@ include file="component/nvabar.jsp" %>

        <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <c:forEach items="${sessionScope.listSliders}" var="o">
                    <div class="carousel-item ${o.sliderId == firstSliderId?"active":""}">
                        <img class="d-block w-100" src="${o.slider_url}"  style="width: 80%;height: 80vh">
                    </div>
                </c:forEach>

            </div>

            <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <main id="main">

            <!-- ======= About Section ======= -->
            <section id="about" class="about">
                <div class="container" data-aos="fade-up">

                    <div class="row">
                        <div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left" data-aos-delay="100">
                            <img src="img/about.jpg" class="img-fluid" alt="">
                        </div>
                        <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content">
                            <h3>This website provide many courses in whole world</h3>
                            <p class="fst-italic">
                                When you study in our website, you will see
                            </p>
                            <ul>
                                <li><i class="bi bi-check-circle"></i> Learning easily </li>
                                <li><i class="bi bi-check-circle"></i> Many new foreigner learner</li>
                                <li><i class="bi bi-check-circle"></i> Many free courses</li>
                            </ul>
                            <p>
                                Let's study with Team 2_ISP392_IS1603_FPT University
                            </p>

                        </div>
                    </div>

                </div>
            </section><!-- End About Section -->

            <!-- ======= Counts Section ======= -->
            <section id="counts" class="counts section-bg">
                <div class="container">

                    <div class="row counters">

                        <div class="col-lg-3 col-6 text-center">
                            <span data-purecounter-start="0" data-purecounter-end="${countMember}" data-purecounter-duration="1" class="purecounter"></span>
                            <p>Students</p>
                        </div>

                        <div class="col-lg-3 col-6 text-center">
                            <span data-purecounter-start="0" data-purecounter-end="${countTopic}" data-purecounter-duration="1" class="purecounter"></span>
                            <p>Courses</p>
                        </div>

                        <div class="col-lg-3 col-6 text-center">
                            <span data-purecounter-start="0" data-purecounter-end="42" data-purecounter-duration="1" class="purecounter"></span>
                            <p>Events</p>
                        </div>

                        <div class="col-lg-3 col-6 text-center">
                            <span data-purecounter-start="0" data-purecounter-end="15" data-purecounter-duration="1" class="purecounter"></span>
                            <p>Trainers</p>
                        </div>

                    </div>

                </div>
            </section><!-- End Counts Section  -->

            <!-- ======= Why Us Section ======= -->
            <section id="why-us" class="why-us">
                <div class="container" data-aos="fade-up">

                    <div class="row">
                        <div class="col-lg-4 d-flex align-items-stretch">
                            <div class="content">
                                <h3>Why Choose Mentor?</h3>
                                <p>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Duis aute irure dolor in reprehenderit
                                    Asperiores dolores sed et. Tenetur quia eos. Autem tempore quibusdam vel necessitatibus optio ad corporis.
                                </p>
                                <div class="text-center">
                                    <a href="about.html" class="more-btn">Learn More <i class="bx bx-chevron-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
                            <div class="icon-boxes d-flex flex-column justify-content-center">
                                <div class="row">
                                    <div class="col-xl-4 d-flex align-items-stretch">
                                        <div class="icon-box mt-4 mt-xl-0">
                                            <i class="bx bx-receipt"></i>
                                            <h4>Corporis voluptates sit</h4>
                                            <p>Consequuntur sunt aut quasi enim aliquam quae harum pariatur laboris nisi ut aliquip</p>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 d-flex align-items-stretch">
                                        <div class="icon-box mt-4 mt-xl-0">
                                            <i class="bx bx-cube-alt"></i>
                                            <h4>Ullamco laboris ladore pan</h4>
                                            <p>Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt</p>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 d-flex align-items-stretch">
                                        <div class="icon-box mt-4 mt-xl-0">
                                            <i class="bx bx-images"></i>
                                            <h4>Labore consequatur</h4>
                                            <p>Aut suscipit aut cum nemo deleniti aut omnis. Doloribus ut maiores omnis facere</p>
                                        </div>
                                    </div>
                                </div>
                            </div><!-- End .content-->
                        </div>
                    </div>

                </div>
            </section><!-- End Why Us Section -->

            <!-- ======= Features Section ======= -->
            <section id="features" class="features">
                <div class="container" data-aos="fade-up">

                    <div class="row" data-aos="zoom-in" data-aos-delay="100">
                        <div class="col-lg-3 col-md-4">
                            <div class="icon-box">
                                <i class="ri-store-line" style="color: #ffbb2c;"></i>
                                <h3><a href="">Lorem Ipsum</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 mt-4 mt-md-0">
                            <div class="icon-box">
                                <i class="ri-bar-chart-box-line" style="color: #5578ff;"></i>
                                <h3><a href="">Dolor Sitema</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 mt-4 mt-md-0">
                            <div class="icon-box">
                                <i class="ri-calendar-todo-line" style="color: #e80368;"></i>
                                <h3><a href="">Sed perspiciatis</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 mt-4 mt-lg-0">
                            <div class="icon-box">
                                <i class="ri-paint-brush-line" style="color: #e361ff;"></i>
                                <h3><a href="">Magni Dolores</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 mt-4">
                            <div class="icon-box">
                                <i class="ri-database-2-line" style="color: #47aeff;"></i>
                                <h3><a href="">Nemo Enim</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 mt-4">
                            <div class="icon-box">
                                <i class="ri-gradienter-line" style="color: #ffa76e;"></i>
                                <h3><a href="">Eiusmod Tempor</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 mt-4">
                            <div class="icon-box">
                                <i class="ri-file-list-3-line" style="color: #11dbcf;"></i>
                                <h3><a href="">Midela Teren</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 mt-4">
                            <div class="icon-box">
                                <i class="ri-price-tag-2-line" style="color: #4233ff;"></i>
                                <h3><a href="">Pira Neve</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 mt-4">
                            <div class="icon-box">
                                <i class="ri-anchor-line" style="color: #b2904f;"></i>
                                <h3><a href="">Dirada Pack</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 mt-4">
                            <div class="icon-box">
                                <i class="ri-disc-line" style="color: #b20969;"></i>
                                <h3><a href="">Moton Ideal</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 mt-4">
                            <div class="icon-box">
                                <i class="ri-base-station-line" style="color: #ff5828;"></i>
                                <h3><a href="">Verdo Park</a></h3>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-4 mt-4">
                            <div class="icon-box">
                                <i class="ri-fingerprint-line" style="color: #29cc61;"></i>
                                <h3><a href="">Flavor Nivelanda</a></h3>
                            </div>
                        </div>
                    </div>

                </div>
            </section><!-- End Features Section -->

            <!-- ======= Popular Courses Section ======= -->
            <section id="popular-courses" class="courses">
                <div class="container" data-aos="fade-up">

                    <div class="section-title">
                        <h2>Courses</h2>
                        <p>Popular Courses</p>
                    </div>

                    <div class="row" data-aos="zoom-in" data-aos-delay="100">

                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch">

                            <div class="course-item">
                                <img src="assets/img/course-1.jpg" class="img-fluid" alt="...">
                                <div class="course-content">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <h4>Web Development</h4>
                                        <p class="price">$169</p>
                                    </div>

                                    <h3><a href="course-details.html">Website Design</a></h3>
                                    <p>Et architecto provident deleniti facere repellat nobis iste. Id facere quia quae dolores dolorem tempore.</p>
                                    <div class="trainer d-flex justify-content-between align-items-center">

                                        <div class="trainer-profile d-flex align-items-center">

                                            <img src="assets/img/trainers/trainer-1.jpg" class="img-fluid" alt="">
                                            <span>Antonio</span>
                                        </div>
                                        <div class="trainer-rank d-flex align-items-center">
                                            <i class="bx bx-user"></i>&nbsp;50
                                            &nbsp;&nbsp;
                                            <i class="bx bx-heart"></i>&nbsp;65
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- End Course Item-->

                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-md-0">
                            <div class="course-item">
                                <img src="assets/img/course-2.jpg" class="img-fluid" alt="...">
                                <div class="course-content">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <h4>Marketing</h4>
                                        <p class="price">$250</p>
                                    </div>

                                    <h3><a href="course-details.html">Search Engine Optimization</a></h3>
                                    <p>Et architecto provident deleniti facere repellat nobis iste. Id facere quia quae dolores dolorem tempore.</p>
                                    <div class="trainer d-flex justify-content-between align-items-center">
                                        <div class="trainer-profile d-flex align-items-center">
                                            <img src="assets/img/trainers/trainer-2.jpg" class="img-fluid" alt="">
                                            <span>Lana</span>
                                        </div>
                                        <div class="trainer-rank d-flex align-items-center">
                                            <i class="bx bx-user"></i>&nbsp;35
                                            &nbsp;&nbsp;
                                            <i class="bx bx-heart"></i>&nbsp;42
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- End Course Item-->

                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch mt-4 mt-lg-0">
                            <div class="course-item">
                                <img src="assets/img/course-3.jpg" class="img-fluid" alt="...">
                                <div class="course-content">
                                    <div class="d-flex justify-content-between align-items-center mb-3">
                                        <h4>Content</h4>
                                        <p class="price">$180</p>
                                    </div>

                                    <h3><a href="course-details.html">Copywriting</a></h3>
                                    <p>Et architecto provident deleniti facere repellat nobis iste. Id facere quia quae dolores dolorem tempore.</p>
                                    <div class="trainer d-flex justify-content-between align-items-center">
                                        <div class="trainer-profile d-flex align-items-center">
                                            <img src="assets/img/trainers/trainer-3.jpg" class="img-fluid" alt="">
                                            <span>Brandon</span>
                                        </div>
                                        <div class="trainer-rank d-flex align-items-center">
                                            <i class="bx bx-user"></i>&nbsp;20
                                            &nbsp;&nbsp;
                                            <i class="bx bx-heart"></i>&nbsp;85
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div> <!-- End Course Item-->

                    </div>

                </div>
            </section><!-- End Popular Courses Section -->

            <!-- ======= Trainers Section ======= -->
            <section id="trainers" class="trainers">
                <div class="container" data-aos="fade-up">

                    <div class="row" data-aos="zoom-in" data-aos-delay="100">
                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
                            <div class="member">
                                <img src="assets/img/trainers/trainer-1.jpg" class="img-fluid" alt="">
                                <div class="member-content">
                                    <h4>Walter White</h4>
                                    <span>Web Development</span>
                                    <p>
                                        Magni qui quod omnis unde et eos fuga et exercitationem. Odio veritatis perspiciatis quaerat qui aut aut aut
                                    </p>
                                    <div class="social">
                                        <a href=""><i class="bi bi-twitter"></i></a>
                                        <a href=""><i class="bi bi-facebook"></i></a>
                                        <a href=""><i class="bi bi-instagram"></i></a>
                                        <a href=""><i class="bi bi-linkedin"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
                            <div class="member">
                                <img src="assets/img/trainers/trainer-2.jpg" class="img-fluid" alt="">
                                <div class="member-content">
                                    <h4>Sarah Jhinson</h4>
                                    <span>Marketing</span>
                                    <p>
                                        Repellat fugiat adipisci nemo illum nesciunt voluptas repellendus. In architecto rerum rerum temporibus
                                    </p>
                                    <div class="social">
                                        <a href=""><i class="bi bi-twitter"></i></a>
                                        <a href=""><i class="bi bi-facebook"></i></a>
                                        <a href=""><i class="bi bi-instagram"></i></a>
                                        <a href=""><i class="bi bi-linkedin"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
                            <div class="member">
                                <img src="assets/img/trainers/trainer-3.jpg" class="img-fluid" alt="">
                                <div class="member-content">
                                    <h4>William Anderson</h4>
                                    <span>Content</span>
                                    <p>
                                        Voluptas necessitatibus occaecati quia. Earum totam consequuntur qui porro et laborum toro des clara
                                    </p>
                                    <div class="social">
                                        <a href=""><i class="bi bi-twitter"></i></a>
                                        <a href=""><i class="bi bi-facebook"></i></a>
                                        <a href=""><i class="bi bi-instagram"></i></a>
                                        <a href=""><i class="bi bi-linkedin"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>

                </div>
            </section><!-- End Trainers Section -->

        </main><!-- End #main -->
        <%@ include file="component/footer.jsp" %>
        <div id="preloader"></div>
        <a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <!-- Vendor JS Files -->
        <script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
        <script src="assets/vendor/aos/aos.js"></script>
        <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendor/php-email-form/validate.js"></script>
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <!-- Template Main JS File -->
        <script src="assets/js/main.js"></script>

    </body>

</html>