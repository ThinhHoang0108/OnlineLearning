<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
        <!-- Custom Stylesheet -->
        <link href="./vendor1/bootstrap-select/dist/css/bootstrap-select.min.css" rel="stylesheet">
        <link href="./css1/style.css" rel="stylesheet">
    </head>
    <body>
        <div class="page-holder bg-light">
            <%@ include file="components/navBarComponent.jsp" %>
            <div class="page-heading bg-light">
                <div class="container">
                    <div class="row align-items-end text-center">
                        <div class="col-lg-7 mx-auto">
                            <h1>Admin Page</h1>  
                            <p class="mb-4"><a href="index.jsp">Home</a> / <strong>Shop</strong></p>        
                        </div>
                    </div>
                </div>
            </div>
            <div class="container">
                <div class="row">
                    <div class="col-lg-20">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Order List</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-responsive-md">
                                        <thead>
                                            <tr>
                                                <th><strong>Order ID</strong></th>
                                                <th><strong>Order Date</strong></th>
                                                <th><strong>Note</strong></th>
                                                <th><strong>Status</strong></th>
                                                <th><strong>Account ID</strong></th>
                                                <th><strong>Shipping ID</strong></th>
                                                <th><strong>Total Price</strong></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listOrder}" var="o" >
                                                <tr>
                                                    <td><strong>${o.orderId}</strong></td>
                                                    <td>${o.orderDate}</td>
                                                    <td>${o.note}</td>
                                                    <td><c:if test="${o.status == 1}">
                                                            <span class="badge light badge-warning">Pending</span>
                                                        </c:if>
                                                        <c:if test="${o.status == 2}">
                                                            <span class="badge light badge-success">Successful</span>
                                                        </c:if><c:if test="${o.status == 3}">
                                                            <span class="badge light badge-danger">Canceled</span>
                                                        </c:if></td>
                                                    <td>${o.accId}</td>
                                                    <td>${o.shippingId}</td>
                                                    <td>£${o.totalPrice}</td>
                                                    <td>
                                                        <div class="dropdown">
                                                            <div class="dropdown">
                                                                <c:if test="${o.status == 1}">
                                                                    <a class="dropdown-item" href="accept-statusOrder?orderId=${o.orderId}">Accept</a>
                                                                    <a class="dropdown-item" href="cancel-statusOrder?orderId=${o.orderId}">Cancel</a>
                                                                </c:if>
                                                            </div>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-20">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Account</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-responsive-md">
                                        <thead>
                                            <tr>
                                                <th><strong>ACCOUNT ID</strong></th>
                                                <th><strong>USERNAME</strong></th>
                                                <th><strong>PASSWORD</strong></th>
                                                <th><strong>FULL NAME</strong></th>
                                                <th><strong>PHONE</strong></th>
                                                <th><strong>STATUS</strong></th>
                                                <th><strong>ROLE</strong></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listAccount}" var="l">
                                                <tr>
                                                    <td><strong>${l.accId}</strong></td>
                                                    <td><span class="w-space-no">${l.username}</span></td>
                                                    <td>${l.password}</td>
                                                    <td><span class="w-space-no">${l.fullName}</span></td>
                                                    <td>${l.phone}</td>
                                                    <td><div class="d-md-inline-block align-items-baseline"><i class="fa fa-circle text-success mr-1"></i> Active</div></td>
                                                    <td><c:choose>
                                                            <c:when test="${l.role == 1}">
                                                                <a>ADMIN</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a>USER</a>
                                                            </c:otherwise>
                                                        </c:choose></td>
                                                    <td>
                                                        <div class="d-flex">
                                                            <a href="deleteAccount?accId=${l.accId}" class="btn btn-danger shadow btn-xs sharp"><i class="fa fa-trash"></i></a>
                                                        </div>
                                                    </td>

                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>

                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-20">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Product</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-responsive-sm">
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Name</th>
                                                <th>Status</th>
                                                <th>Price</th>
                                                <th>Category ID</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listGlasses}" var="g">
                                                <tr>
                                                    <th>${g.id}</th>
                                                    <td>${g.name}</td>
                                                    <td><c:if test="${g.status == 1}">
                                                            <span class="badge badge-primary light">Selling</span>
                                                        </c:if>
                                                    </td>
                                                    <td>£${g.price}</td>
                                                    <td class="color-primary">${g.categoryId}</td>
                                                    <td><div class="d-flex">
                                                            <a href="deleteAccount?accId=${l.accId}" class="btn btn-danger shadow btn-xs sharp"><i class="fa fa-trash"></i></a>
                                                        </div>
                                                    </td>

                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-20">
                        <div class="card">
                            <div class="card-header">
                                <h4 class="card-title">Product</h4>
                            </div>
                            <div class="card-body">
                                <div class="table-responsive">
                                    <table class="table table-responsive-sm">
                                        <thead>
                                            <tr>
                                                <th>Id</th>
                                                <th>Cate Name</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach items="${listCategories}" var="g">
                                                <tr>
                                                    <th>${g.cateId}</th>
                                                    <td>${g.cateName}</td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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
            <script src="./vendor1/global/global.min.js"></script>
            <script src="./vendor1/bootstrap-select/dist/js/bootstrap-select.min.js"></script>
            <script src="./vendor1/chart.js/Chart.bundle.min.js"></script>
            <script src="./js1/custom.min.js"></script>
            <script src="./js1/deznav-init.js"></script>
            <!-- Apex Chart -->
            <script src="./vendor1/apexchart/apexchart.js"></script>


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
            </body>
            </html>