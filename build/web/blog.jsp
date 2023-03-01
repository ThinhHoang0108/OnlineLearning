<!DOCTYPE html>
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
                                        <li class="d-flex align-items-center"><i class="bi bi-person"></i> <a href="blog-details.html">John Doe</a></li>
                                        <li class="d-flex align-items-center"><i class="bi bi-clock"></i> <a href="blog-details.html"><time datetime="2020-01-01">${blog.createDate}</time></a></li>
                                        <li class="d-flex align-items-center"><i class="bi bi-chat-dots"></i> <a href="blog-details.html">12 Comments</a></li>
                                    </ul>
                                </div><!-- End meta top -->

                                <div class="content">
                                    <blockquote>
                                        <p>
                                          ${blog.description}
                                        </p>
                                    </blockquote>
                                </div><!-- End post content -->

                                <div class="meta-bottom">
                                    <i class="bi bi-folder"></i>
                                    <ul class="cats">
                                        <li><a href="#">Business</a></li>
                                    </ul>

                                    <i class="bi bi-tags"></i>
                                    <ul class="tags">
                                        <li><a href="#">Creative</a></li>
                                        <li><a href="#">Tips</a></li>
                                        <li><a href="#">Marketing</a></li>
                                    </ul>
                                </div><!-- End meta bottom -->

                            </article><!-- End blog post -->

                            <div class="post-author d-flex align-items-center">
                                <img src="assets/imgblog/blog/blog-author.jpg" class="rounded-circle flex-shrink-0" alt="">
                                <div>
                                    <h4>Jane Smith</h4>
                                    <div class="social-links">
                                        <a href="https://twitters.com/#"><i class="bi bi-twitter"></i></a>
                                        <a href="https://facebook.com/#"><i class="bi bi-facebook"></i></a>
                                        <a href="https://instagram.com/#"><i class="biu bi-instagram"></i></a>
                                    </div>
                                    <p>
                                        Itaque quidem optio quia voluptatibus dolorem dolor. Modi eum sed possimus accusantium. Quas repellat voluptatem officia numquam sint aspernatur voluptas. Esse et accusantium ut unde voluptas.
                                    </p>
                                </div>
                            </div><!-- End post author -->

                            <div class="comments">

                                <h4 class="comments-count">8 Comments</h4>

                                <div id="comment-1" class="comment">
                                    <div class="d-flex">
                                        <div class="comment-img"><img src="assets/imgblog/blog/comments-1.jpg" alt=""></div>
                                        <div>
                                            <h5><a href="">Georgia Reader</a> <a href="#" class="reply"><i class="bi bi-reply-fill"></i> Reply</a></h5>
                                            <time datetime="2020-01-01">01 Jan,2022</time>
                                            <p>
                                                Et rerum totam nisi. Molestiae vel quam dolorum vel voluptatem et et. Est ad aut sapiente quis molestiae est qui cum soluta.
                                                Vero aut rerum vel. Rerum quos laboriosam placeat ex qui. Sint qui facilis et.
                                            </p>
                                        </div>
                                    </div>
                                </div><!-- End comment #1 -->

                                <div id="comment-2" class="comment">
                                    <div class="d-flex">
                                        <div class="comment-img"><img src="assets/imgblog/blog/comments-2.jpg" alt=""></div>
                                        <div>
                                            <h5><a href="">Aron Alvarado</a> <a href="#" class="reply"><i class="bi bi-reply-fill"></i> Reply</a></h5>
                                            <time datetime="2020-01-01">01 Jan,2022</time>
                                            <p>
                                                Ipsam tempora sequi voluptatem quis sapiente non. Autem itaque eveniet saepe. Officiis illo ut beatae.
                                            </p>
                                        </div>
                                    </div>

                                    <div id="comment-reply-1" class="comment comment-reply">
                                        <div class="d-flex">
                                            <div class="comment-img"><img src="assets/imgblog/blog/comments-3.jpg" alt=""></div>
                                            <div>
                                                <h5><a href="">Lynda Small</a> <a href="#" class="reply"><i class="bi bi-reply-fill"></i> Reply</a></h5>
                                                <time datetime="2020-01-01">01 Jan,2022</time>
                                                <p>
                                                    Enim ipsa eum fugiat fuga repellat. Commodi quo quo dicta. Est ullam aspernatur ut vitae quia mollitia id non. Qui ad quas nostrum rerum sed necessitatibus aut est. Eum officiis sed repellat maxime vero nisi natus. Amet nesciunt nesciunt qui illum omnis est et dolor recusandae.

                                                    Recusandae sit ad aut impedit et. Ipsa labore dolor impedit et natus in porro aut. Magnam qui cum. Illo similique occaecati nihil modi eligendi. Pariatur distinctio labore omnis incidunt et illum. Expedita et dignissimos distinctio laborum minima fugiat.

                                                    Libero corporis qui. Nam illo odio beatae enim ducimus. Harum reiciendis error dolorum non autem quisquam vero rerum neque.
                                                </p>
                                            </div>
                                        </div>

                                        <div id="comment-reply-2" class="comment comment-reply">
                                            <div class="d-flex">
                                                <div class="comment-img"><img src="assets/imgblog/blog/comments-4.jpg" alt=""></div>
                                                <div>
                                                    <h5><a href="">Sianna Ramsay</a> <a href="#" class="reply"><i class="bi bi-reply-fill"></i> Reply</a></h5>
                                                    <time datetime="2020-01-01">01 Jan,2022</time>
                                                    <p>
                                                        Et dignissimos impedit nulla et quo distinctio ex nemo. Omnis quia dolores cupiditate et. Ut unde qui eligendi sapiente omnis ullam. Placeat porro est commodi est officiis voluptas repellat quisquam possimus. Perferendis id consectetur necessitatibus.
                                                    </p>
                                                </div>
                                            </div>

                                        </div><!-- End comment reply #2-->

                                    </div><!-- End comment reply #1-->

                                </div><!-- End comment #2-->

                                <div id="comment-3" class="comment">
                                    <div class="d-flex">
                                        <div class="comment-img"><img src="assets/imgblog/blog/comments-5.jpg" alt=""></div>
                                        <div>
                                            <h5><a href="">Nolan Davidson</a> <a href="#" class="reply"><i class="bi bi-reply-fill"></i> Reply</a></h5>
                                            <time datetime="2020-01-01">01 Jan,2022</time>
                                            <p>
                                                Distinctio nesciunt rerum reprehenderit sed. Iste omnis eius repellendus quia nihil ut accusantium tempore. Nesciunt expedita id dolor exercitationem aspernatur aut quam ut. Voluptatem est accusamus iste at.
                                                Non aut et et esse qui sit modi neque. Exercitationem et eos aspernatur. Ea est consequuntur officia beatae ea aut eos soluta. Non qui dolorum voluptatibus et optio veniam. Quam officia sit nostrum dolorem.
                                            </p>
                                        </div>
                                    </div>

                                </div><!-- End comment #3 -->

                                <div id="comment-4" class="comment">
                                    <div class="d-flex">
                                        <div class="comment-img"><img src="assets/imgblog/blog/comments-6.jpg" alt=""></div>
                                        <div>
                                            <h5><a href="">Kay Duggan</a> <a href="#" class="reply"><i class="bi bi-reply-fill"></i> Reply</a></h5>
                                            <time datetime="2020-01-01">01 Jan,2022</time>
                                            <p>
                                                Dolorem atque aut. Omnis doloremque blanditiis quia eum porro quis ut velit tempore. Cumque sed quia ut maxime. Est ad aut cum. Ut exercitationem non in fugiat.
                                            </p>
                                        </div>
                                    </div>

                                </div><!-- End comment #4 -->

                                <div class="reply-form">

                                    <h4>Leave a Reply</h4>
                                    <p>Your email address will not be published. Required fields are marked * </p>
                                    <form action="">
                                        <div class="row">
                                            <div class="col-md-6 form-group">
                                                <input name="name" type="text" class="form-control" placeholder="Your Name*">
                                            </div>
                                            <div class="col-md-6 form-group">
                                                <input name="email" type="text" class="form-control" placeholder="Your Email*">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col form-group">
                                                <input name="website" type="text" class="form-control" placeholder="Your Website">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col form-group">
                                                <textarea name="comment" class="form-control" placeholder="Your Comment*"></textarea>
                                            </div>
                                        </div>
                                        <button type="submit" class="btn btn-primary">Post Comment</button>

                                    </form>

                                </div>

                            </div><!-- End blog comments -->

                        </div>

                        <div class="col-lg-4">

                            <div class="sidebar">

                                <div class="sidebar-item search-form">
                                    <h3 class="sidebar-title">Search</h3>
                                    <form action="" class="mt-3">
                                        <input type="text">
                                        <button type="submit"><i class="bi bi-search"></i></button>
                                    </form>
                                </div><!-- End sidebar search formn-->

                                <div class="sidebar-item categories">
                                    <h3 class="sidebar-title">Categories</h3>
                                    <ul class="mt-3">
                                        <li><a href="#">General <span>(25)</span></a></li>
                                        <li><a href="#">Lifestyle <span>(12)</span></a></li>
                                        <li><a href="#">Travel <span>(5)</span></a></li>
                                        <li><a href="#">Design <span>(22)</span></a></li>
                                        <li><a href="#">Creative <span>(8)</span></a></li>
                                        <li><a href="#">Educaion <span>(14)</span></a></li>
                                    </ul>
                                </div><!-- End sidebar categories-->

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

                                <div class="sidebar-item tags">
                                    <h3 class="sidebar-title">Tags</h3>
                                    <ul class="mt-3">
                                        <li><a href="#">App</a></li>
                                        <li><a href="#">IT</a></li>
                                        <li><a href="#">Business</a></li>
                                        <li><a href="#">Mac</a></li>
                                        <li><a href="#">Design</a></li>
                                        <li><a href="#">Office</a></li>
                                        <li><a href="#">Creative</a></li>
                                        <li><a href="#">Studio</a></li>
                                        <li><a href="#">Smart</a></li>
                                        <li><a href="#">Tips</a></li>
                                        <li><a href="#">Marketing</a></li>
                                    </ul>
                                </div><!-- End sidebar tags-->

                            </div><!-- End Blog Sidebar -->

                        </div>
                    </div>

                </div>
            </section><!-- End Blog Details Section -->

        </main><!-- End #main -->

        <!-- ======= Footer ======= -->
        <footer id="footer" class="footer">

            <div class="footer-content position-relative">
                <div class="container">
                    <div class="row">

                        <div class="col-lg-4 col-md-6">
                            <div class="footer-info">
                                <h3>UpConstruction</h3>
                                <p>
                                    A108 Adam Street <br>
                                    NY 535022, USA<br><br>
                                    <strong>Phone:</strong> +1 5589 55488 55<br>
                                    <strong>Email:</strong> info@example.com<br>
                                </p>
                                <div class="social-links d-flex mt-3">
                                    <a href="#" class="d-flex align-items-center justify-content-center"><i class="bi bi-twitter"></i></a>
                                    <a href="#" class="d-flex align-items-center justify-content-center"><i class="bi bi-facebook"></i></a>
                                    <a href="#" class="d-flex align-items-center justify-content-center"><i class="bi bi-instagram"></i></a>
                                    <a href="#" class="d-flex align-items-center justify-content-center"><i class="bi bi-linkedin"></i></a>
                                </div>
                            </div>
                        </div><!-- End footer info column-->

                        <div class="col-lg-2 col-md-3 footer-links">
                            <h4>Useful Links</h4>
                            <ul>
                                <li><a href="#">Home</a></li>
                                <li><a href="#">About us</a></li>
                                <li><a href="#">Services</a></li>
                                <li><a href="#">Terms of service</a></li>
                                <li><a href="#">Privacy policy</a></li>
                            </ul>
                        </div><!-- End footer links column-->

                        <div class="col-lg-2 col-md-3 footer-links">
                            <h4>Our Services</h4>
                            <ul>
                                <li><a href="#">Web Design</a></li>
                                <li><a href="#">Web Development</a></li>
                                <li><a href="#">Product Management</a></li>
                                <li><a href="#">Marketing</a></li>
                                <li><a href="#">Graphic Design</a></li>
                            </ul>
                        </div><!-- End footer links column-->

                        <div class="col-lg-2 col-md-3 footer-links">
                            <h4>Hic solutasetp</h4>
                            <ul>
                                <li><a href="#">Molestiae accusamus iure</a></li>
                                <li><a href="#">Excepturi dignissimos</a></li>
                                <li><a href="#">Suscipit distinctio</a></li>
                                <li><a href="#">Dilecta</a></li>
                                <li><a href="#">Sit quas consectetur</a></li>
                            </ul>
                        </div><!-- End footer links column-->

                        <div class="col-lg-2 col-md-3 footer-links">
                            <h4>Nobis illum</h4>
                            <ul>
                                <li><a href="#">Ipsam</a></li>
                                <li><a href="#">Laudantium dolorum</a></li>
                                <li><a href="#">Dinera</a></li>
                                <li><a href="#">Trodelas</a></li>
                                <li><a href="#">Flexo</a></li>
                            </ul>
                        </div><!-- End footer links column-->

                    </div>
                </div>
            </div>

            <div class="footer-legal text-center position-relative">
                <div class="container">
                    <div class="copyright">
                        &copy; Copyright <strong><span>UpConstruction</span></strong>. All Rights Reserved
                    </div>
                    <div class="credits">
                        <!-- All the links in the footer should remain intact. -->
                        <!-- You can delete the links only if you purchased the pro version. -->
                        <!-- Licensing information: https://bootstrapmade.com/license/ -->
                        <!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/upconstruction-bootstrap-construction-website-template/ -->
                        Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
                    </div>
                </div>
            </div>

        </footer>
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