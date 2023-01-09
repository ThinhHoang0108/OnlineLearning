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
        <link rel="shortcut icon" href="favicon.png">

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
                        <h1>Cart</h1>  
                        <p class="mb-4"><a href="index.html">Home</a> / <strong>Cart</strong></p>        
                    </div>
                </div>
            </div>
        </div>



        <div class="untree_co-section">
            <div class="container">
                <div class="row mb-5">
                    <div class="site-blocks-table">
                        <c:choose>
                            <c:when test="${sessionScope.carts == null || sessionScope.carts.size() == 0}">
                                <h1>Cart is empty!</h1>
                                <div class="col-md-auto">
                                    <div class="row mb-xxl-1">
                                        <div class="col-md-10">
                                            <button class="btn btn-outline-black btn-sm btn-block" onclick="window.location = 'category'" >Continue Shopping</button>
                                        </div>
                                    </div>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th class="product-thumbnail">ID</th>
                                            <th class="product-thumbnail">Image</th>
                                            <th class="product-name">Product</th>
                                            <th class="product-price">Price</th>
                                            <th class="product-quantity">Quantity</th>
                                            <th class="product-total">Total</th>
                                            <th class="product-remove">Remove</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${carts}" var="c">
                                        <form action="update-quantity">
                                            <tr>
                                                <td>${c.value.glasses.id}</td>
                                            <input type="hidden" name="productId" value="${c.value.glasses.id}"/>
                                            <td class="product-thumbnail"><img src="${c.value.glasses.imgPath}" alt="Image" class="img-fluid" ></td>
                                            <td class="product-name"><h2 class="h5 text-black">${c.value.glasses.name}</h2></td>
                                            <td>£${c.value.glasses.price}</td>
                                            <td>
                                                <div class="input-group mb-3" style="max-width: 100px;">
                                                    <input type="number" class="form-control text-center" onchange="this.form.submit()" value="${c.value.quantity}" placeholder="" aria-label="Example text with button addon" aria-describedby="button-addon1" name="quantity">
                                                </div>
                                            </td>
                                            <td>£${c.value.glasses.price*c.value.quantity}</td>
                                            <td><a href="delete-cart?productId=${c.value.glasses.id}" class="btn btn-black btn-sm">X</a></td>
                                            </tr>
                                        </form>
                                    </c:forEach>
                                    </tbody>
                                </table>
                                <div class="col-md-auto pl-lg-5">
                                    <div class="row justify-content-end">
                                        <div class="col-md-4">
                                            <div class="row">
                                                <div class="col-md-12 text-right border-bottom mb-5">
                                                    <h3 class="text-black h4 text-uppercase">Cart Totals</h3>
                                                </div>
                                            </div>
                                            <div class="row mb-5">
                                                <div class="col-md-6">
                                                    <span class="text-black">Total</span>
                                                </div>
                                                <div class="col-md-6 text-right">
                                                    <strong class="text-black">£${totalMoney}</strong>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-md-12">
                                                    <button class="btn btn-black btn-lg py-3 btn-block" onclick="window.location = 'checkout'">Proceed To Checkout</button>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                    </form>
                </div>

            </div>
        </div>
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
