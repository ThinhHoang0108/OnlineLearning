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
                        <a href="coursedetail?courseID=${o.courseId}&method=get"> <img class="d-block w-100" src="dashboard/img/${o.slider_url}"  style="width: 80%;height: 80vh"></a>
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
            <section id="features" class="features">
            </section>
            <!-- ======= Why Us Section ======= -->
            <section id="why-us" class="why-us">
                <div class="container" data-aos="fade-up">
                    <div class="section-title text-end">
                        <h2></h2>
                        <p>Post</p>
                    </div>
                    <div class="row">
                        <div class="col-lg-4 d-flex align-items-stretch">
                            <div class="content">
                                <h3>Why Choose E-Learning Website?</h3>
                                <p>
                                    eLearning is more flexible and simple than the traditional chalk-and-board techniques of teaching. 
                                    Many students have also admired it because of its efficiency and cost-effectiveness. Students can continue their learning process around other responsibilities and commitments through multimedia content and online resources anytime that is convenient for them.
                                </p>
                                <div class="text-center">
                                    <a href="about" class="more-btn">Learn More <i class="bx bx-chevron-right"></i></a>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-8 d-flex align-items-stretch" data-aos="zoom-in" data-aos-delay="100">
                            <div class="icon-boxes d-flex flex-column justify-content-center">
                                <div class="row">
                                    <div class="col-xl-4 d-flex align-items-stretch">
                                        <div class="icon-box mt-4 mt-xl-0">
                                            <i class="bx bx-receipt"></i>
                                            <h4>1. It Is Cost-Effective</h4>
                                            <p>eLearning is cost-effective and it helps with an employee's professional growth.</p>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 d-flex align-items-stretch">
                                        <div class="icon-box mt-4 mt-xl-0">
                                            <i class="bx bx-cube-alt"></i>
                                            <h4>2. It Allows For Frequent Assessments</h4>
                                            <p>Regular, short tests can keep you aware and alert all the time. You can become more focused and conscious of your work.</p>
                                        </div>
                                    </div>
                                    <div class="col-xl-4 d-flex align-items-stretch">
                                        <div class="icon-box mt-4 mt-xl-0">
                                            <i class="bx bx-images"></i>
                                            <h4>3. It Aids In Employee Training</h4>
                                            <p>Training can be delivered more quickly through eLearning, and employees can receive training anytime, anywhere.</p>
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
            </section><!-- End Features Section -->
            <!-- ======= Popular Courses Section ======= -->
            <section id="popular-courses" class="courses">
                <div class="container" data-aos="fade-up">

                    <div class="section-title">
                        <h2>Courses</h2>
                        <p>New Courses</p>
                    </div>

                    <div class="row" data-aos="zoom-in" data-aos-delay="100">
                        <c:forEach items="${listTop3CourseNew}" var="n">

                            <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
                                <div class="course-item">
                                    <img src="${n.thumnailURL}" class="img-fluid" alt="...">
                                    <div class="course-content">
                                        <div class="d-flex justify-content-between align-items-center mb-3">
                                            <h4>${n.category.name}</h4>
                                        </div>

                                        <h3><a href="#">${n.content}</a></h3>
                                        <p>${n.description}</p>
                                        <div class="trainer d-flex justify-content-between align-items-center">
                                            <div class="trainer-profile d-flex align-items-center">
                                            </div>
                                            <div class="trainer-rank d-flex align-items-center">
                                                <i class="bx bx-user"></i>&nbsp;
                                                &nbsp;&nbsp;
                                                <i class="bx bx-heart"></i>&nbsp;
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div> <!-- End Course Item-->
                        </c:forEach>

                    </div>
                </div>
            </section><!-- End Popular Courses Section -->

            <!-- ======= Trainers Section ======= -->
            <section id="trainers" class="trainers">

                <div class="container" data-aos="fade-up">

                    <div class="section-title text-center">
                        <h2>Team 2</h2>
                        <p>Our Team</p>
                    </div>
                    <div class="row" data-aos="zoom-in" data-aos-delay="100">
                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
                            <div class="member">
                                <img src="assets/img/trainers/thinh.jpg" class="img-fluid" alt="">
                                <div class="member-content">
                                    <h4>Hoang Xuan Thinh</h4>
                                    <span>Technical Leader</span>
                                    <p>Et architecto provident deleniti facere repellat nobis iste. Id facere quia quae dolores dolorem tempore.</p>
                                    <div class="social">
                                        <a href=""><i class="bi bi-facebook"></i></a>
                                        <a href=""><i class="bi bi-instagram"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
                            <div class="member">
                                <img src="assets/img/trainers/thang.jpg" class="img-fluid" alt="">
                                <div class="member-content">
                                    <h4>Vu Xuan Thang</h4>
                                    <span>Document Leader</span>
                                    <p>Et architecto provident deleniti facere repellat nobis iste. Id facere quia quae dolores dolorem tempore.</p>
                                    <div class="social">
                                        <a href="https://www.facebook.com/ThangBono2908"><i class="bi bi-facebook"></i></a>
                                        <a href=""><i class="bi bi-instagram"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 d-flex align-items-stretch">
                            <div class="member">
                                <img src="assets/img/trainers/Ly.jpg" class="img-fluid" alt="">
                                <div class="member-content">
                                    <h4>Tran Huong Ly</h4>
                                    <span>Tester</span>
                                    <p>Et architecto provident deleniti facere repellat nobis iste. Id facere quia quae dolores dolorem tempore.</p>
                                    <div class="social">
                                        <a href="https://www.facebook.com/thilan.han.73"><i class="bi bi-facebook"></i></a>
                                        <a href=""><i class="bi bi-instagram"></i></a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-6 d-flex align-items-end">
                        </div>
                        <div class="col-lg-4 col-md-6 d-flex align-items-end">
                            <div class="member">
                                <img src="assets/img/trainers/tuan.jpg" class="img-fluid" alt="">
                                <div class="member-content">
                                    <h4>Nguyen Minh Tuan</h4>
                                    <span>Developer</span>
                                    <p>Et architecto provident deleniti facere repellat nobis iste. Id facere quia quae dolores dolorem tempore.</p>
                                    <div class="social">
                                        <a href="https://www.facebook.com/profile.php?id=100011442981743"><i class="bi bi-facebook"></i></a>
                                        <a href=""><i class="bi bi-instagram"></i></a>
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