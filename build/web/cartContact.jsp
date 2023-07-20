<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%-- 
    Document   : cartContact
    Created on : 01-07-2023, 08:23:33
    Author     : Zarius
--%>

<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Checkout</title>

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
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/slicknav.min.css" type="text/css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css" type="text/css">
    </head>

    <body>
        <%@include file="header.jsp" %>

        <!-- Breadcrumb Begin -->
        <div class="breadcrumb-option">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="breadcrumb__links">
                            <a href="home"><i class="fa fa-home"></i> Home</a>
                            <a href="cart"><i class="fa fa-shopping-cart"></i> Cart</a>
                            <span>Checkout</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Checkout Section Begin -->
        <section class="checkout spad">
            <div class="container">
                <form action="addOrder" class="checkout__form"  method="POST">
                    <div class="row">
                        <div class="col-lg-8">
                            <h5>Contact detail</h5>
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="checkout__form__input">
                                        <p>Full Name <span>*</span></p>
                                        <input type="text" name="fullName" placeholder="Enter your full name" value="${sessionScope.user.getFullName()}" required>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="checkout__form__input">
                                        <p>Phone <span>*</span></p>
                                        <input type="text" name="phone" placeholder="Enter your phone number" value="${sessionScope.user.getPhone_Number()}" required>
                                    </div>
                                </div>
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <div class="checkout__form__input">
                                        <p>Address <span>*</span></p>
                                        <input type="text" name="address" placeholder="Enter your address" value="${sessionScope.user.getAddress()}" required>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="checkout__form__input">
                                        <p>Order notes <span>*</span></p>
                                        <input type="text" name="note" placeholder="Note about your order">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-4">
                            <div class="checkout__order">
                                <h5>Your order</h5>
                                <div class="checkout__order__product">
                                    <ul>
                                        <li>
                                            <span class="top__text">Product</span>
                                            <span class="top__text__right">Total</span>
                                        </li>
                                        <c:set var="listCartProductName" value="${requestScope.listCartProductName}" />
                                        <c:forEach var="listCart" items="${listCart}" varStatus="loop">
                                            <li>${loop.index + 1}. 
                                                <a href="productDetail?productID=${listCart.getProductID()}" style="color: #444444;">${listCartProductName[listCart.getProductID()]} x ${listCart.getQuantity()} </a>
                                                <span><fmt:formatNumber pattern="#,##0" value="${listCart.getTotalCost()}"/> VNÐ</span></li>
                                            </c:forEach>
                                    </ul>
                                </div>
                                <div class="checkout__order__total">
                                    <ul>
                                        <li>Total <span><fmt:formatNumber pattern="#,##0" value="${totalCost}"/> VNÐ</span></li>
                                        <input type="hidden" name="totalCost" value="${totalCost}">
                                    </ul>
                                </div>
                                <div class="checkout__order__widget">
                                    <label for="check-payment">
                                        COD (Cash on Delivery)
                                        <input type="checkbox" id="check-payment" name="paymentMethod" onclick="selectOnlyOne(this)" value="COD">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label for="paypal">
                                        VNPay
                                        <input type="checkbox" id="paypal" name="paymentMethod" onclick="selectOnlyOne(this)" value="VNPay">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <strong id="notification" style="display: none; color: red;"></strong>
                                <button type="submit" class="site-btn" value="order">Place order</button>
                                <a href="cart" style="color:#ffffff;"><button type="button" class="site-btn" style="margin-top: 1em; background-color: #111111;">Back to Cart</button></a>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- Checkout Section End -->

        <%@include file="footer.jsp" %>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
                                            $(document).ready(function () {
                                                $('form').submit(function (event) {
                                                    var checkedPaymentMethods = $('input[name="paymentMethod"]:checked');

                                                    if (checkedPaymentMethods.length !== 1) {
                                                        event.preventDefault();
                                                        $('#notification').text('Please choose one payment method').show();
                                                    } else {
                                                        $('#notification').hide();
                                                    }
                                                });
                                            });
                                            function selectOnlyOne(checkbox) {
                                                var checkboxes = document.getElementsByName('paymentMethod');

                                                for (var i = 0; i < checkboxes.length; i++) {
                                                    if (checkboxes[i] !== checkbox) {
                                                        checkboxes[i].checked = false;
                                                    }
                                                }
                                            }
        </script>
        <!-- Js Plugins -->
        <script src="<%= request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/bootstrap.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/jquery.magnific-popup.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/jquery-ui.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/mixitup.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/jquery.countdown.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/jquery.slicknav.js"></script>
        <script src="<%= request.getContextPath()%>/js/owl.carousel.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/jquery.nicescroll.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/main.js"></script>

    </body>

</html>
