<!-- /*
* Template Name: UntreeStore
* Template Author: Untree.co
* Author URI: https://untree.co/
* License: https://creativecommons.org/licenses/by/3.0/
*/ -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="author" content="Untree.co">

        <meta name="description" content="" />
        <meta name="keywords" content="" />

        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Mulish:ital,wght@0,300;0,400;0,700;1,700&family=Playfair+Display:ital,wght@0,400;0,700;1,400;1,700&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/jquery.fancybox.min.css">
        <link rel="stylesheet" href="fonts/icomoon/style.css">
        <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/style.css">

        <title>ThinhShop</title>
    </head>
    <body>
        <%@ include file="/components/navBarComponent.jsp" %>
        <div class="owl-carousel owl-single home-slider">
            <div class="item">
                <div class="untree_co-hero" style="background-image: url('images/g5.jpg');">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-lg-6">
                                <h1 class="mb-4 heading" data-aos="fade-up" data-aos-delay="100">Buy glasses the easy way with Thinglasses</h1>
                                <div class="mb-5 text-white desc mx-auto" data-aos="fade-up" data-aos-delay="200"></div>
                                <p class="mb-0" data-aos="fade-up" data-aos-delay="300"><a href="category" class="btn btn-outline-black">Explore now</a></p>
                            </div>
                        </div>
                    </div>
                </div> <!-- /.untree_co-hero -->
            </div>


            <div class="item">
                <div class="untree_co-hero" style="background-image: url('images/g2.jpg');">
                    <div class="container">
                        <div class="row align-items-center">
                            <div class="col-lg-6">

                                <h1 class="mb-4 heading" data-aos="fade-up" data-aos-delay="100"></h1>
                                <div class="mb-5 text-white desc mx-auto" data-aos="fade-up" data-aos-delay="200"></div>
                                <p class="mb-0" data-aos="fade-up" data-aos-delay="300"></p>
                            </div>
                        </div>
                    </div>
                </div> <!-- /.untree_co-hero -->
            </div>

        </div>


        <div class="untree_co-section">
            <div class="container">


                <div class="deal-hero overlay" style="background-image: url('images/g7.jpg')"> 
                    <div class="deal-contents">
                        <span class="subtitle">Limited Offers 20% OFF</span>
                        <h2 class="title mb-4"><a href="#">Summer Promo</a></h2>
                        <a href="#" class="btn btn-black">Shop Now</a>
                    </div>
                </div> <!-- /.deal-hero -->

            </div>
        </div>

        <div class="untree_co-section">
            <div class="container">
                <div class="row">
                    <c:forEach items="${sessionScope.listGlassesTop6}" var="s">
                        <div class="col-6 col-sm-6 col-md-6 mb-4 col-lg-4">
                            <div class="product-item">
                                <a href="detail?productId=${s.id}" class="product-img">
                                    <div class="label new top-right">
                                        <div class='content'>New</div>
                                    </div>
                                    <img src="${s.imgPath}" alt="Image" class="img-fluid">
                                </a>
                                <h3 class="title"><a href="#">${s.name}</a></h3>
                                <div class="price">
                                    <span>£${s.price}</span>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
        </div> <!-- /.untree_co-section -->


        <div class="container">


            <div class="deal-hero overlay" style="background-image: url('images/g6.jpg')"> 
                <div class="deal-contents">
                    <span class="subtitle">Limited Offers 20% OFF</span>
                    <h2 class="title mb-4"><a href="#">Summer Promo</a></h2>
                    <a href="#" class="btn btn-black">Shop Now</a>
                </div>
            </div> <!-- /.deal-hero -->

        </div>
        <%@ include file="/components/footerComponent.jsp" %>
        <script src="js/jquery-3.4.1.min.js"></script>
        <script src="js/popper.min.js"></script>
        <script src="js/bootstrap.min.js"></script>
        <script src="js/owl.carousel.min.js"></script>
        <script src="js/jquery.animateNumber.min.js"></script>
        <script src="js/jquery.waypoints.min.js"></script>
        <script src="js/jquery.fancybox.min.js"></script>
        <script src="js/jquery.sticky.js"></script>
        <script src="js/aos.js"></script>
        <script src="js/custom.js"></script>
    </body>

</html>
