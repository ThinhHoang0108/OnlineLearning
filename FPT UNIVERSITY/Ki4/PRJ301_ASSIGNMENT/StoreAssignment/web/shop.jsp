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

        <title>Thinglasses</title>
    </head>

    <body>
        <%@ include file="/components/navBarComponent.jsp" %>

        <div class="page-heading bg-light">
            <div class="container">
                <div class="row align-items-end text-center">
                    <div class="col-lg-7 mx-auto">
                        <h1>Shop</h1>  
                        <p class="mb-4"><a href="index.jsp">Home</a> / <strong>Shop</strong></p>        
                    </div>
                </div>
            </div>
        </div>
        <div class="untree_co-section pt-3">
            <div class="container">

                <div class="row align-items-center mb-5">
                    <div class="col-lg-8">
                        <h2 class="mb-3 mb-lg-0">Products</h2>
                    </div>
                    <div class="col-lg-4">

                        <!--                        <div class="d-flex sort align-items-center justify-content-lg-end">
                                                    <strong class="mr-3">Sort by:</strong>
                                                    <form action="category" onchange="this.submit()">
                                                        <select class="" name="sortType" required>
                                                            <option value="ASC">Price: Ascending</option>
                                                            <option value="DESC">Price: Descending</option>
                                                        </select>
                                                    </form>
                                                </div>-->
                    </div>
                </div>

                <div class="row">
                    <a href=""></a>
                    <div class="col-md-3">
                        <ul class="list-unstyled categories">
                            <c:forEach  items="${sessionScope.listCategories}" var="l">
                                <li><a href="filter-category?categoryId=${l.cateId}">${l.cateName}</a></li>
                                </c:forEach>
                        </ul>
                    </div>
                    <div class="col-md-9">
                        <div class="row">
                            <c:forEach items="${listGlasses}" var="g">
                                <div class="col-6 col-sm-6 col-md-6 mb-4 col-lg-4">
                                    <div class="product-item">
                                        <a href="detail?productId=${g.id}" class="product-img">
                                            <img src="${g.imgPath}" alt="Image" class="img-fluid">
                                        </a>
                                        <h3 class="title"><a href="#">${g.name}</a></h3>
                                        <div class="price">
                                            <span>£${g.price}</span>
                                        </div>
                                        <div class="card-footer p-1 pt-0 border-top-0 bg-transparent">
                                            <div class="text-center"><a class="btn btn-outline-dark mt-auto" onclick="addTocartAsync(${g.id})">Add to cart</a></div>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>

                        <div class="row mt-5 pb-5">
                            <div class="col-lg-12">
                                <div class="custom-pagination">
                                    <c:choose>
                                        <c:when test="${listGlasses==null || listGlasses.size()==0}">
                                            Not founds
                                            <ul class="list-unstyled">
                                                <li>
                                                    <a href="category?page=${page-1}">
                                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-left" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                        <path fill-rule="evenodd" d="M5.854 4.646a.5.5 0 0 1 0 .708L3.207 8l2.647 2.646a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 0 1 .708 0z"/>
                                                        <path fill-rule="evenodd" d="M2.5 8a.5.5 0 0 1 .5-.5h10.5a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                                                        </svg>                      
                                                    </a>
                                                </li>
                                            </c:when>
                                            <c:otherwise>
                                                <ul class="list-unstyled">
                                                    <li>
                                                        <a href="category?page=${page-1}">
                                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-left" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                            <path fill-rule="evenodd" d="M5.854 4.646a.5.5 0 0 1 0 .708L3.207 8l2.647 2.646a.5.5 0 0 1-.708.708l-3-3a.5.5 0 0 1 0-.708l3-3a.5.5 0 0 1 .708 0z"/>
                                                            <path fill-rule="evenodd" d="M2.5 8a.5.5 0 0 1 .5-.5h10.5a.5.5 0 0 1 0 1H3a.5.5 0 0 1-.5-.5z"/>
                                                            </svg>                      
                                                        </a>
                                                    </li>
                                                    <c:forEach begin="1" end="${totalPage}" var="i">
                                                        <li><a href="category?page=${i}">${i}</a></li>
                                                        </c:forEach>
                                                    <li>
                                                        <a href="category?page=${page+1}">
                                                            <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-arrow-right" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                                            <path fill-rule="evenodd" d="M10.146 4.646a.5.5 0 0 1 .708 0l3 3a.5.5 0 0 1 0 .708l-3 3a.5.5 0 0 1-.708-.708L12.793 8l-2.647-2.646a.5.5 0 0 1 0-.708z"/>
                                                            <path fill-rule="evenodd" d="M2 8a.5.5 0 0 1 .5-.5H13a.5.5 0 0 1 0 1H2.5A.5.5 0 0 1 2 8z"/>
                                                            </svg>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </c:otherwise>
                                        </c:choose>

                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div> <!-- /.untree_co-section -->


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
            <script src="https://cdn.jsdelivr.net/npm/axios@1.1.2/dist/axios.min.js"></script>
            <script>
                                                function addTocartAsync(productId) {
                                                    axios.get('AddToCart-async', {
                                                        params: {
                                                            productId: productId
                                                        }
                                                    }).then((response) => {
                                                        //lay data thanh cong
                                                        document.getElementById("cart_number").innerHTML = response.data;
                                                        //cap nhat view cart size
                                                    })
                                                }
            </script>


    </body>

</html>
