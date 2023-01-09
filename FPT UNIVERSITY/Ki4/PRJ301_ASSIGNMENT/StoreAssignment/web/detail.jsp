<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <title>Thinglasses</title>
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="robots" content="all,follow">
        <!-- gLightbox gallery-->
        <link rel="stylesheet" href="vendor/glightbox/css/glightbox.min.css">
        <!-- Range slider-->
        <link rel="stylesheet" href="vendor/nouislider/nouislider.min.css">
        <!-- Choices CSS-->
        <link rel="stylesheet" href="vendor/choices.js/public/assets/styles/choices.min.css">
        <!-- Swiper slider-->
        <link rel="stylesheet" href="vendor/swiper/swiper-bundle.min.css">
        <!-- Google fonts-->
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Libre+Franklin:wght@300;400;700&amp;display=swap">
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Martel+Sans:wght@300;400;800&amp;display=swap">
        <!-- theme stylesheet-->
        <link rel="stylesheet" href="css/style.default.css" id="theme-stylesheet">
        <!-- Custom stylesheet - for your changes-->
        <link rel="stylesheet" href="css/custom.css">
        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/animate.min.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/jquery.fancybox.min.css">
        <link rel="stylesheet" href="fonts/icomoon/style.css">
        <link rel="stylesheet" href="fonts/flaticon/font/flaticon.css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/style.css">
    </head>
    <body>
        <div class="page-holder bg-light">
            <%@ include file="components/navBarComponent.jsp" %>
            <div class="page-heading bg-light">
                <div class="container">
                    <div class="row align-items-end text-center">
                        <div class="col-lg-7 mx-auto">
                            <h1>Product Detail</h1>  
                            <p class="mb-4"><a href="HomeController">Home</a> / <strong>Shop</strong></p>        
                        </div>
                    </div>
                </div>
            </div>
            <!-- Product image-->
            <section class="py-5">
                <div class="container">
                    <div class="row mb-5">
                        <div class="col-lg-6">
                            <img class="card-img-top" src="${glasses.imgPath}" alt="..." />

                        </div>
                        <!-- PRODUCT DETAILS-->
                        <div class="col-lg-6">
                            <ul class="list-inline mb-2 text-sm">
                                <li class="list-inline-item m-0"><i class="fas fa-star small text-warning"></i></li>
                                <li class="list-inline-item m-0 1"><i class="fas fa-star small text-warning"></i></li>
                                <li class="list-inline-item m-0 2"><i class="fas fa-star small text-warning"></i></li>
                                <li class="list-inline-item m-0 3"><i class="fas fa-star small text-warning"></i></li>
                                <li class="list-inline-item m-0 4"><i class="fas fa-star small text-warning"></i></li>
                            </ul>
                            <h1>${glasses.name}</h1>
                            <p class="text-muted lead">£${glasses.price}</p>

                            <div class="row align-items-stretch mb-4">
                                <div class="col-sm-1 pr-sm-0">

                                </div>
                                <div class="col-sm-3 pl-sm-0"><a class="btn btn-dark btn-sm btn-block h-100 d-flex align-items-center justify-content-center px-0" href="AddToCart?productId=${glasses.id}">Add to cart</a></div>
                            </div>
                            <ul class="list-unstyled small d-inline-block">
                                <li class="px-3 py-2 mb-1 bg-white"><strong class="text-uppercase">Id:</strong><span class="ms-2 text-muted">039</span></li>
                                <li class="px-3 py-2 mb-1 bg-white text-muted"><strong class="text-uppercase text-dark">Category:</strong><a class="reset-anchor ms-2" href="filter-category?categoryId=${category.cateId}">${category.cateName}</a></li>
                            </ul>
                        </div>
                    </div>
                    <!-- DETAILS TABS-->
                    <ul class="nav nav-tabs border-0" id="myTab" role="tablist">
                        <li class="nav-item"><a class="nav-link text-uppercase active" id="description-tab" data-bs-toggle="tab" href="#description" role="tab" aria-controls="description" aria-selected="true">Description</a></li>
                    </ul>
                    <div class="tab-content mb-5" id="myTabContent">
                        <div class="tab-pane fade show active" id="description" role="tabpanel" aria-labelledby="description-tab">
                            <div class="p-4 p-lg-5 bg-white">
                                <h6 class="text-uppercase">Product description </h6>
                                <p class="text-muted text-sm mb-0">${glasses.description}</p>
                            </div>
                        </div>
                        <!--                        <div class="tab-pane fade" id="reviews" role="tabpanel" aria-labelledby="reviews-tab">
                                                    <div class="p-4 p-lg-5 bg-white">
                                                        <div class="row">
                                                            <div class="col-lg-8">
                        <c:forEach items="${listComment}">
                            <div class="d-flex mb-3">
                                <div class="flex-shrink-0"><img class="rounded-circle" src="img/customer-1.png" alt="" width="50"/></div>
                                <div class="ms-3 flex-shrink-1">
                                    <h6 class="mb-0 text-uppercase">Jason Doe</h6>
                                    <p class="small text-muted mb-0 text-uppercase">20 May 2020</p>
                                    <ul class="list-inline mb-1 text-xs">
                                        <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
                                        <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
                                        <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
                                        <li class="list-inline-item m-0"><i class="fas fa-star text-warning"></i></li>
                                        <li class="list-inline-item m-0"><i class="fas fa-star-half-alt text-warning"></i></li>
                                    </ul>
                                    <p class="text-sm mb-0 text-muted">Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>

                                </div>
                            </div>
                        </c:forEach>
                        <form action="comment">
                            <input type="hidden" name="accIdCommnet" value="${sessionScope.account.accId}"/>
                            <input type="hidden" name="pId" value="${glasses.id}"/>
                            <input type="text" name="comment"><input type="submit" value="Comment" />
                        </form>


                    </div>
                </div>
            </div>
        </div>-->
                    </div>
                    <%@ include file="components/footerComponent.jsp" %>
                    <div id="overlayer"></div>
                    <div class="loader">
                        <div class="spinner-border" role="status">
                            <span class="sr-only">Loading...</span>
                        </div>
                    </div>
                    <!-- JavaScript files-->
                    <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
                    <script src="vendor/glightbox/js/glightbox.min.js"></script>
                    <script src="vendor/nouislider/nouislider.min.js"></script>
                    <script src="vendor/swiper/swiper-bundle.min.js"></script>
                    <script src="vendor/choices.js/public/assets/scripts/choices.min.js"></script>
                    <script src="js/front.js"></script><script src="js/jquery-3.4.1.min.js"></script>
                    <script src="js/popper.min.js"></script>
                    <script src="js/bootstrap.min.js"></script>
                    <script src="js/owl.carousel.min.js"></script>
                    <script src="js/jquery.animateNumber.min.js"></script>
                    <script src="js/jquery.waypoints.min.js"></script>
                    <script src="js/jquery.fancybox.min.js"></script>
                    <script src="js/jquery.sticky.js"></script>
                    <script src="js/aos.js"></script>
                    <script src="js/custom.js"></script>


                    <script>
                        // ------------------------------------------------------- //
                        //   Inject SVG Sprite - 
                        //   see more here 
                        //   https://css-tricks.com/ajaxing-svg-sprite/
                        // ------------------------------------------------------ //
                        function injectSvgSprite(path) {

                            var ajax = new XMLHttpRequest();
                            ajax.open("GET", path, true);
                            ajax.send();
                            ajax.onload = function (e) {
                                var div = document.createElement("div");
                                div.className = 'd-none';
                                div.innerHTML = ajax.responseText;
                                document.body.insertBefore(div, document.body.childNodes[0]);
                            }
                        }
                        // this is set to BootstrapTemple website as you cannot 
                        // inject local SVG sprite (using only 'icons/orion-svg-sprite.svg' path)
                        // while using file:// protocol
                        // pls don't forget to change to your domain :)
                        injectSvgSprite('https://bootstraptemple.com/files/icons/orion-svg-sprite.svg');

                    </script>
                    <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
                    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
                </div>
                </body>
                </html>