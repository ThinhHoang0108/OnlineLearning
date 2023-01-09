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
    </head>
    <body>
        <div class="page-holder bg-light">
            <%@ include file="components/navBarComponent.jsp" %>
            <div class="page-heading bg-light">
                <div class="container">
                    <div class="row align-items-end text-center">
                        <div class="col-lg-7 mx-auto">
                            <h1>User Infomation</h1>  
                            <p class="mb-4"><a href="HomeController">Home</a> / <strong>Shop</strong></p>        
                        </div>
                    </div>
                </div>
            </div>
            <!-- RELATED PRODUCTS-->
            <div class="untree_co-section">
                <div class="container">
                    <h1>Welcome, ${sessionScope.account.fullName}!</h5>
                        <h5>Your infomation:</h1>
                    <h5>Full Name: ${sessionScope.account.fullName}!</h5>
                    <h5>User Name: ${sessionScope.account.username}!</h5>
                    <h5>Phone: ${sessionScope.account.phone}!</h5>
                    <span>
                        <button type="button" class="btn btn-outline-info" data-bs-toggle="modal" data-bs-target="#changeProfileBtn">
                            Update profile
                        </button>
                        <div class="modal fade" id="changeProfileBtn" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="exampleModalLabel">Update profile information</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div id="update-profile-error" class="form-outline mt-3 fst-italic text-center"
                                         style="color: red; font-size: 18px;"></div>
                                    <form action="UpdateUserController" id="update-form">
                                        <div class="modal-body">
                                            <!-- Email -->
                                            <div class="form-outline mb-3">
                                                <label class="form-label" for="register-mail-input">Your Username</label>
                                                <input id="update-profile-mail-input" type="text"
                                                       class="form-control form-control-lg" name="username" value="${sessionScope.account.username}" readonly/>
                                            </div>
                                            <!-- Name -->
                                            <div class="form-outline mb-3">
                                                <label class="form-label" for="form3Example1cg">Your Name <span
                                                        style="color: red; font-weight: bold">*</span></label>
                                                <input type="text" id="form3Example1cg" class="form-control form-control-lg"
                                                       required placeholder="Nguyen Van A"
                                                       name="name" value="${sessionScope.account.fullName}"/>
                                            </div>
                                            <!-- Phone -->
                                            <div class="form-outline mb-5">
                                                <label class="form-label" for="update-profile-input-phone">Phone number <span
                                                        style="color: red; font-weight: bold">*</span></label>
                                                <input type="text" id="update-profile-input-phone" class="form-control form-control-lg"
                                                       required placeholder="0791234xx"
                                                       name="phone" value="${sessionScope.account.phone}"/>
                                            </div>
                                            <div id="update-profile-input-phone-error" class="form-outline mb-2 fst-italic"
                                                 style="margin-top: -35px; color: red; font-size: 14px;">
                                            </div>
                                        </div>
                                        <div class="modal-footer">
                                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                            <button id="update-profile-btn" type="submit" class="btn btn-primary" name="action" value="updateInfo">Save changes</button>
                                        </div>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </span>
                    <!-- Change password btn -->
                    <!-- Alert -->
                    <c:choose>
                        <c:when test="${not empty requestScope.MSG_SUCCESS}">
                            <div class="alert alert-success mt-4" role="alert">
                                ${requestScope.MSG_SUCCESS}
                            </div>
                        </c:when>
                        <c:when test="${not empty requestScope.MSG_ERROR}">
                            <div class="alert alert-danger mt-4" role="alert">
                                ${requestScope.MSG_ERROR}
                            </div>
                        </c:when>
                    </c:choose>
                    <h1>Your Order</h1>
                    <!-- Search order by date -->
                    <table class="table table-responsive-md">
                        <thead>
                            <tr>
                                <th><strong>Account ID</strong></th>
                                <th><strong>Order Date</strong></th>
                                <th><strong>Status</strong></th>
                                <th><strong>Total Price</strong></th>
                                <th><strong>Action</strong></th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${sessionScope.listOrderUser}" var="o" >
                                <tr>
                                    <td>${o.accId}</td>
                                    <td>${o.orderDate}</td>
                                    <td><c:if test="${o.status == 1}">
                                            <span class="badge light badge-warning">Pending</span>
                                        </c:if>
                                        <c:if test="${o.status == 2}">
                                            <span class="badge light badge-success">Successful</span>
                                        </c:if><c:if test="${o.status == 3}">
                                            <span class="badge light badge-danger">Canceled</span>
                                        </c:if>
                                    </td>
                                    <td>£${o.totalPrice}</td>
                                    <td><c:choose>
                                            <c:when test="${o.status == 1}">
                                                <a href="userCancle?orderId=${o.orderId}">Cancel</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a href="category">Order Again</a>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div> <!-- /.untree_co-section -->  
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

            <!-- FontAwesome CSS - loading as last, so it doesn't block rendering-->
            <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.1/css/all.css" integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
        </div>
    </body>
</html>