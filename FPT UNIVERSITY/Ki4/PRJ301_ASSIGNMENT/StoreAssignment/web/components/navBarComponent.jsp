<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="search-form" id="search-form">
            <form action="search">
                <input type="search" class="form-control" placeholder="Enter keyword to search..." name="keyword">
                <button class="button">
                    <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                    <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
                    <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
                    </svg>
                </button>
                <button class="button">
                    <div class="close-search">
                        <span class="icofont-close js-close-search"></span>
                    </div>
                </button>
            </form>
        </div>

        <div class="site-mobile-menu">
            <div class="site-mobile-menu-header">
                <div class="site-mobile-menu-close">
                    <span class="icofont-close js-menu-toggle"></span>
                </div>
            </div>
            <div class="site-mobile-menu-body"></div>
        </div>
        <nav class="site-nav mb-5">

            <div class="sticky-nav js-sticky-header">
                <div class="container position-relative">
                    <div class="site-navigation text-center dark">
                        <a href="HomeController" class="logo menu-absolute m-0">Thinglasses<span class="text-primary">.</span></a>
                        <ul class="js-clone-nav pl-0 d-none d-lg-inline-block site-menu">
                            <li><a href="HomeController">Home</a></li>
                            <li class="has-children">
                                <a href="category">Shop</a>
                                <ul class="dropdown">
                                    <c:forEach  items="${sessionScope.listCategories}" var="l">
                                        <li><a href="filter-category?categoryId=${l.cateId}">${l.cateName}</a></li>
                                        </c:forEach>
                                </ul>
                            </li>
                            <li>
                                <a href="about.jsp">Pages</a>
                            </li>
                            <li><a href="filter-category?categoryId=4">Jewelries</a></li>
                            <li><a href="filter-category?categoryId=5">Accessories</a></li>
                        </ul>
                        <div class="menu-icons">
                            <a href="#" class="btn-custom-search" id="btn-search">
                                <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-search" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                <path fill-rule="evenodd" d="M10.442 10.442a1 1 0 0 1 1.415 0l3.85 3.85a1 1 0 0 1-1.414 1.415l-3.85-3.85a1 1 0 0 1 0-1.415z"/>
                                <path fill-rule="evenodd" d="M6.5 12a5.5 5.5 0 1 0 0-11 5.5 5.5 0 0 0 0 11zM13 6.5a6.5 6.5 0 1 1-13 0 6.5 6.5 0 0 1 13 0z"/>
                                </svg>
                            </a>


                            <c:choose>
                                <c:when test="${sessionScope.account != null}">
                                    <c:choose>
                                        <c:when test="${sessionScope.account.role == 1}">
                                            <a href="admin" class="btn-custom-search">Admin</a>
                                        </c:when>
                                        <c:otherwise>
                                            <a href="UserInfoController" class="btn-custom-search">Profile</a>
                                        </c:otherwise>
                                    </c:choose>
                                    <a href="logout" class="btn-custom-search">Logout</a>
                                </c:when>
                                <c:otherwise>
                                    <a href="login" class="btn-custom-search">Login</a>
                                </c:otherwise>
                            </c:choose>



                            <a href="carts" class="cart">
                                <c:choose>
                                    <c:when test="${sessionScope.carts == null}">
                                        <span id="cart_number" class="item-in-cart">0</span>
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-cart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                                        </svg>
                                    </c:when>
                                    <c:otherwise>
                                        <span id="cart_number"  class="item-in-cart">${sessionScope.carts.size()}</span>
                                        <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-cart" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
                                        <path fill-rule="evenodd" d="M0 1.5A.5.5 0 0 1 .5 1H2a.5.5 0 0 1 .485.379L2.89 3H14.5a.5.5 0 0 1 .491.592l-1.5 8A.5.5 0 0 1 13 12H4a.5.5 0 0 1-.491-.408L2.01 3.607 1.61 2H.5a.5.5 0 0 1-.5-.5zM3.102 4l1.313 7h8.17l1.313-7H3.102zM5 12a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm7 0a2 2 0 1 0 0 4 2 2 0 0 0 0-4zm-7 1a1 1 0 1 0 0 2 1 1 0 0 0 0-2zm7 0a1 1 0 1 0 0 2 1 1 0 0 0 0-2z"/>
                                        </svg>
                                    </c:otherwise>
                                </c:choose>

                            </a>

                        </div>

                    </div>
                </div>
        </nav>
    </body>
</html>