<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta content="width=device-width, initial-scale=1.0" name="viewport">

        <title>Blog Details</title>
        <meta content="" name="description">
        <meta content="" name="keywords">
        <!-- Google Fonts -->
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Open+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,600;1,700&family=Roboto:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&family=Work+Sans:ital,wght@0,300;0,400;0,500;0,600;0,700;1,300;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">

        <!-- Vendor CSS Files -->
        <link href="assets/vendorblog/bootstrap/css/bootstrap.min.css" rel="stylesheet">
        <link href="assets/vendorblog/bootstrap-icons/bootstrap-icons.css" rel="stylesheet">
        <link href="assets/vendorblog/fontawesome-free/css/all.min.css" rel="stylesheet">
        <link href="assets/vendorblog/aos/aos.css" rel="stylesheet">
        <link href="assets/vendorblog/glightbox/css/glightbox.min.css" rel="stylesheet">
        <link href="assets/vendorblog/swiper/swiper-bundle.min.css" rel="stylesheet">

        <!-- Template Main CSS File -->
        <link href="assets/cssblog/main.css" rel="stylesheet">

        <!-- =======================================================
        * Template Name: UpConstruction - v1.3.0
        * Template URL: https://bootstrapmade.com/upconstruction-bootstrap-construction-website-template/
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
            <div class="breadcrumbs d-flex align-items-center" style="background-image: url('assets/imgblog/breadcrumbs-bg.jpg');">
                <div class="container position-relative d-flex flex-column align-items-center" data-aos="fade">

                    <h2>Blog Details</h2>
                    <ol>
                        <li><a href="home.jsp">Home</a></li>
                        <li><a href="bloglist.jsp">Blog</a></li>
                        <li>Blog Details</li>
                    </ol>

                </div>
            </div><!-- End Breadcrumbs -->

            <!-- ======= Blog Details Section ======= -->
            <section id="blog" class="blog">
                <div class="container" data-aos="fade-up" data-aos-delay="100">

                    <div class="row g-5">

                        <div class="col-lg-8">

                            <article class="blog-details">

                                <div class="post-img">
                                    <img src="${blog.thumnailURL}" alt="" class="img-fluid">
                                </div>

                                <h2 class="title">${blog.content}</h2>

                                <div class="meta-top">
                                    <ul>
                                        <li class="d-flex align-items-center"><i class="bi bi-person"></i> ${blog.user.name}</li>
                                        <li class="d-flex align-items-center"><i class="bi bi-clock"></i><time datetime="2020-01-01">${blog.createDate}</time></li>
                                        <li class="d-flex align-items-center"><i class="bi bi-chat-dots"></i>${sessionScope.totalComment} Comments</li>
                                    </ul>
                                </div><!-- End meta top -->

                                <div class="content">
                                    <p>
                                        ${blog.description}
                                    </p>
                                </div><!-- End post content -->

                                <div class="meta-bottom">
                                    <i class="bi bi-tags"></i>
                                    <ul class="tags">
                                        <li><a href="listCourseByCate?categoryID=${blog.category.id}&cateName=${blog.category.name}">${blog.category.name}</a></li>
                                    </ul>
                                </div><!-- End meta bottom -->

                            </article><!-- End blog post -->


                            <div class="comments">
                                <div class="container">
                                    <c:choose>
                                        <c:when test="${sessionScope.account == null}">
                                            <div class="reply-form">
                                                <h4>Leave a Reply</h4>
                                                <a href="login.jsp" class="btn btn-primary">Please login </a>
                                            </div>
                                        </c:when>
                                        <c:otherwise>
                                            <div class="reply-form">
                                                <h4>Leave a Reply</h4>
                                                <p>Your email address will not be published. Required fields are marked * </p>
                                                <form method="post" action="blogdetail">
                                                    <input type="hidden" name="blogID" value="${requestScope.blogID}" />
                                                    <div class="row">
                                                        <div class="col form-group">
                                                            <textarea name="content" class="form-control" placeholder="Your Comment*" required></textarea>
                                                        </div>
                                                    </div>
                                                    <button type="submit" class="btn btn-primary">Post Comment</button>
                                                </form>
                                            </div>
                                            <br><br>
                                            <h4 class="comments-count">${sessionScope.totalComment} Comments</h4>
                                        </c:otherwise>
                                    </c:choose>
                                </div>

                                <c:forEach items="${sessionScope.listComment}" var="c">
                                    <div id="comment-1" class="comment">
                                        <div class="d-flex">
                                            <div class="comment-img"></div>
                                            <div>
                                                <h5><a>${c.user.name}</a></h5>
                                                <time datetime="2020-01-01">${c.createDate}</time>
                                                <p>
                                                    ${c.content}
                                                </p>
                                            </div>
                                        </div>
                                        <hr class="line">
                                    </div><!-- End comment #1 -->
                                </c:forEach>



                            </div><!-- End blog comments -->
                        </div>

                        <div class="col-lg-4">

                            <div class="sidebar">


                                <div class="sidebar-item recent-posts">
                                    <h3 class="sidebar-title">Recent Posts</h3>

                                    <div class="mt-3">

                                        <div class="post-item mt-3">
                                            <img src="assets/imgblog/blog/blog-recent-1.jpg" alt="">
                                            <div>
                                                <h4><a href="blog-details.html">Nihil blanditiis at in nihil autem</a></h4>
                                                <time datetime="">${blog.createDate}</time>
                                            </div>
                                        </div><!-- End recent post item-->

                                        <div class="post-item">
                                            <img src="assets/imgblog/blog/blog-recent-2.jpg" alt="">
                                            <div>
                                                <h4><a href="blog-details.html">Quidem autem et impedit</a></h4>
                                                <time datetime="2020-01-01">Jan 1, 2020</time>
                                            </div>
                                        </div><!-- End recent post item-->

                                        <div class="post-item">
                                            <img src="assets/imgblog/blog/blog-recent-3.jpg" alt="">
                                            <div>
                                                <h4><a href="blog-details.html">Id quia et et ut maxime similique occaecati ut</a></h4>
                                                <time datetime="2020-01-01">Jan 1, 2020</time>
                                            </div>
                                        </div><!-- End recent post item-->

                                        <div class="post-item">
                                            <img src="assets/imgblog/blog/blog-recent-4.jpg" alt="">
                                            <div>
                                                <h4><a href="blog-details.html">Laborum corporis quo dara net para</a></h4>
                                                <time datetime="2020-01-01">Jan 1, 2020</time>
                                            </div>
                                        </div><!-- End recent post item-->

                                        <div class="post-item">
                                            <img src="assets/imgblog/blog/blog-recent-5.jpg" alt="">
                                            <div>
                                                <h4><a href="blog-details.html">Et dolores corrupti quae illo quod dolor</a></h4>
                                                <time datetime="2020-01-01">Jan 1, 2020</time>
                                            </div>
                                        </div><!-- End recent post item-->

                                    </div>

                                </div><!-- End sidebar recent posts-->


                            </div><!-- End Blog Sidebar -->

                        </div>
                    </div>

                </div>
            </section><!-- End Blog Details Section -->

        </main><!-- End #main -->

        <!-- ======= Footer ======= -->
        <%@ include file="component/footer.jsp" %>
        <!-- End Footer -->

        <a href="#" class="scroll-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

        <div id="preloader"></div>

        <!-- Vendor JS Files -->
        <script src="assets/vendorblog/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/vendorblog/aos/aos.js"></script>
        <script src="assets/vendorblog/glightbox/js/glightbox.min.js"></script>
        <script src="assets/vendorblog/isotope-layout/isotope.pkgd.min.js"></script>
        <script src="assets/vendorblog/swiper/swiper-bundle.min.js"></script>
        <script src="assets/vendorblog/purecounter/purecounter_vanilla.js"></script>
        <script src="assets/vendorblog/php-email-form/validate.js"></script>

        <!-- Template Main JS File -->
        <script src="assets/jsblog/main.js"></script>

    </body>

</html>