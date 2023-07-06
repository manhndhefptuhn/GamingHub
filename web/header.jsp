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
        <link rel="icon" type="image/png" href="<%= request.getContextPath()%>/img/shop/logo1.png"/>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
              rel="stylesheet">
        <style>
            .toast-container {
                position: fixed;
                top: 20px;
                right: 20px;
                width: 300px;
                background-color: #333;
                color: #fff;
                padding: 15px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.5);
                z-index: 9999;
                opacity: 0;
                transition: opacity 0.3s;
            }

            .toast-progress {
                height: 5px;
                background-color: gray;
                margin-top: 10px;
                border-radius: 3px;
                position: relative;
            }

            .toast-progress-bar {
                height: 100%;
                background-color: blue;
                width: 0;
                border-radius: 3px;
                position: absolute;
                top: 0;
                left: 0;
                transition: width 4s linear;
            }

            .toast-close-button {
                position: absolute;
                top: 10px;
                right: 10px;
                color: #ccc;
                cursor: pointer;
            }
        </style>

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

                <c:if test="${sessionScope.user.getRole_ID() == 1}">
                    <li><a href="wishlist"><span class="icon_heart_alt"></span>
                            <div class="tip">${sessionScope.totalWishlistProduct}</div>
                        </a></li>
                    <li><a href="cart"><span class="icon_bag_alt"></span>
                            <div class="tip">${sessionScope.totalCartProduct}</div>
                        </a></li>
                    </c:if>

            </ul>
            <div class="offcanvas__logo">
                <a href="home"><img src="<%= request.getContextPath()%>/img/shop/logo1.png" alt="logo"></a>
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
                            <a href="home"><img src="<%= request.getContextPath()%>/img/shop/logo1.png" alt=""></a>
                        </div>
                    </div>
                    <div class="col-xl-6 col-lg-7">
                        <nav class="header__menu">
                            <ul>
                                <li><a href="home">Home</a></li>
                                <li><a href="shop">Shop</a></li>
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
                                <li><span class="icon_search search-switch"></span></li>
                                    <c:if test="${sessionScope.user.getRole_ID() == 1}">
                                    <li><a href="wishlist"><span class="icon_heart_alt"></span>
                                            <div class="tip">${sessionScope.totalWishlistProduct}</div>
                                        </a></li>
                                    <li><a href="cart"><span class="icon_bag_alt"></span>
                                            <div class="tip">${sessionScope.totalCartProduct}</div>
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
        <c:set var="notification" value="${sessionScope.notification}" />
        <c:if test="${not empty notification}">
            <div id="toast" class="toast-container">
                <div class="toast-content">
                    ${notification}
                    <span class="toast-close-button" onclick="closeToast()">&#x2715;</span>
                </div>
                <div class="toast-progress">
                    <div id="toast-progress-bar" class="toast-progress-bar"></div>
                </div>
            </div>
            <c:remove var="notification" scope="session" />
        </c:if>

        <c:set var="wrongNotification" value="${sessionScope.wrongNotification}" />
        <c:if test="${not empty wrongNotification}">
            <div id="toast" class="toast-container">
                <div class="toast-content">
                    ${wrongNotification}
                    <span class="toast-close-button" onclick="closeToast()">&#x2715;</span>
                </div>
                <div class="toast-progress">
                    <div style="background-color: #f22c2c;" id="toast-progress-bar" class="toast-progress-bar"></div>
                </div>
            </div>
            <c:remove var="wrongNotification" scope="session" />
        </c:if>
        
        <c:set var="successNoti" value="${sessionScope.successNoti}" />
        <c:if test="${not empty successNoti}">
            <div id="toast" class="toast-container">
                <div class="toast-content">
                    ${successNoti}
                    <span class="toast-close-button" onclick="closeToast()">&#x2715;</span>
                </div>
                <div class="toast-progress">
                    <div style="background-color: #91f051;" id="toast-progress-bar" class="toast-progress-bar"></div>
                </div>
            </div>
            <c:remove var="successNoti" scope="session" />
        </c:if>
        <!-- Header Section End -->
        <script>
            // JavaScript to handle the toast notification display and timeout
            window.onload = function () {
                var toast = document.getElementById('toast');
                toast.style.opacity = '1';

                // Set the notification duration (in milliseconds)
                var duration = 5000;

                // Start the progress bar animation
                var progressBar = document.getElementById('toast-progress-bar');
                progressBar.style.width = '100%';
                progressBar.style.transition = 'width ' + (duration / 1000) + 's linear';

                // Hide the toast after the duration
                setTimeout(function () {
                    hideToast();
                }, duration);
            }

            function hideToast() {
                var toast = document.getElementById('toast');
                toast.style.opacity = '0';

                // After fading out, hide the toast
                setTimeout(function () {
                    toast.style.display = 'none';
                }, 500);
            }

            function closeToast() {
                hideToast();
            }
        </script>
    </body>
</html>
