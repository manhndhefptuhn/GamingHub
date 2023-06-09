<%@page import="Model.User"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : header
    Created on : 30-05-2023, 08:31:56
    Author     : Zarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Gaming Hub</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
              rel="stylesheet">

        <!-- Css Styles -->
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/bootstrap.min.css" type="text/css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/font-awesome.min.css" type="text/css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/elegant-icons.css" type="text/css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/jquery-ui.min.css" type="text/css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/magnific-popup.css" type="text/css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/owl.carousel.min.css" type="text/css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css" type="text/css">
    </head>
    <body>
        <!-- Page Preloder -->
        <div id="preloder">
            <div class="loader"></div>
        </div>

        <!-- Offcanvas Menu Begin -->
        <div class="offcanvas-menu-overlay"></div>
        <div class="offcanvas-menu-wrapper">
            <div class="offcanvas__close">+</div>
            <ul class="offcanvas__widget">
                <li><span class="icon_search search-switch"></span></li>
                    <c:if test="${sessionScope.user.getRole_ID() == 1 || sessionScope.user == null}">
                    <li><a href="#"><span class="icon_heart_alt"></span>
                            <div class="tip">2</div>
                        </a></li>
                    <li><a href="#"><span class="icon_bag_alt"></span>
                            <div class="tip">2</div>
                        </a></li>
                    </c:if>
            </ul>
            <div class="offcanvas__logo">
                <a href="<%= request.getContextPath()%>/Home.jsp"><img src="<%= request.getContextPath()%>/img/shop/logo1.png" alt="logo"></a>
            </div>
            <div id="mobile-menu-wrap"></div>
            <c:if test="${sessionScope.user == null}">
                <div class="offcanvas__auth">
                    <a href="Login.jsp">Login</a>
                </div>
            </c:if>
        </div>
        <!-- Offcanvas Menu End -->

        <!-- Header Section Begin -->
        <header class="header">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-3 col-lg-2">
                        <div class="header__logo">
                            <a href="<%= request.getContextPath()%>/Home.jsp"><img src="<%= request.getContextPath()%>/img/shop/logo1.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-7">
                        <nav class="header__menu">
                            <ul>
                                <li><a href="Home.jsp">Home</a></li>
                                <li><a href="shop.jsp">Shop</a></li>
                                <li><a href="#">Pages</a>
                                    <ul class="dropdown">
                                        <li><a href="./product-details.html">Product Details</a></li>
                                        <li><a href="./shop-cart.html">Shop Cart</a></li>
                                        <li><a href="./checkout.html">Checkout</a></li>
                                    </ul>
                                </li>
                                <li><a href="contact.jsp">Contact</a></li>
                            </ul>
                        </nav>
                    </div>
                    <div class="col-lg-3">
                        <c:if test="${sessionScope.user == null}">
                            <div class="header__right" style="padding: 30px 0 27px;">
                            </c:if>
                            <div class="header__right__auth">
                                <c:if test="${sessionScope.user == null}">
                                    <a style="text-transform: uppercase; color: #111111; font-weight: 500;font-size: 15px;"href="Login.jsp">Login</a>
                                </c:if>
                                <c:if test="${sessionScope.user != null}">
                                    <nav class="header__menu">
                                        <ul>
                                            <li>${sessionScope.user.getFullName()}
                                                <ul class="dropdown">
                                                    <li><a href="userProfile">My Profile</a></li>
                                                        <c:if test="${sessionScope.user.getRole_ID() == 1}">
                                                        <li><a href="#">Order History</a></li>
                                                        </c:if>
                                                        <c:if test="${sessionScope.user.getRole_ID() == 2}">
                                                        <li><a href="#">Sale Dashboard</a></li>
                                                        </c:if>
                                                        <c:if test="${sessionScope.user.getRole_ID() == 3}">
                                                        <li><a href="#">Support Dashboard</a></li>
                                                        </c:if>
                                                        <c:if test="${sessionScope.user.getRole_ID() == 4}">
                                                        <li><a href="#">Admin Dashboard</a></li>
                                                        </c:if>
                                                    <li><a href="logout">Log out</a></li>
                                                </ul>
                                        </ul>
                                    </nav>
                                    </li>
                                </c:if>        
                            </div>

                            <ul class="header__right__widget">
                                <c:if test="${sessionScope.user.getRole_ID() == 1 || sessionScope.user == null}">
                                    <li><span class="icon_search search-switch"></span></li>
                                    <li><a href="#"><span class="icon_heart_alt"></span>
                                            <div class="tip">2</div>
                                        </a></li>
                                    <li><a href="#"><span class="icon_bag_alt"></span>
                                            <div class="tip">2</div>
                                        </a></li>
                                    </c:if>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="canvas__open">
                    <i class="fa fa-bars"></i>
                </div>
            </div>
        </header>
        <!-- Header Section End -->

        <script src="<%= request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/bootstrap.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/jquery.magnific-popup.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/jquery-ui.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/mixitup.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/jquery.countdown.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/owl.carousel.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/jquery.nicescroll.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/main.js"></script>
    </body>
</html>
