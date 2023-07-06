<%-- 
    Document   : cartContact
    Created on : 01-07-2023, 08:23:33
    Author     : Zarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Cart Contact</title>

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
                            <span>Cart Contact</span>
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
                                                <span>$ ${listCart.getTotalCost()}</span></li>
                                            </c:forEach>
                                    </ul>
                                </div>
                                <div class="checkout__order__total">
                                    <ul>
                                        <li>Total <span>$ ${totalCost}</span></li>
                                        <input type="hidden" name="totalCost" value="${totalCost}">
                                    </ul>
                                </div>
                                <div class="checkout__order__widget">
                                    <label for="COD">
                                        COD (Cash on Delivery)
                                        <input type="checkbox" id="COD" name="paymentMethod" value="COD" onclick="selectOnlyOne(this)">
                                        <span class="checkmark"></span>
                                    </label>
                                    <label for="VNPay">
                                        VNPay
                                        <input type="checkbox" id="VNPay" name="paymentMethod" value="VNPay" onclick="selectOnlyOne(this)">
                                        <span class="checkmark"></span>
                                    </label>
                                </div>
                                <button type="submit" class="site-btn">Place order</button>
                                <button class="site-btn" style="margin-top: 1em; background-color: #111111;"><a href="cart" style="color:#ffffff;">Back to Cart</a></button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </section>
        <!-- Checkout Section End -->

        <%@include file="footer.jsp" %>

        <!-- Js Plugins -->
        <script>
            function selectOnlyOne(checkbox) {
                var checkboxes = document.getElementsByName('paymentMethod');
    
                for (var i = 0; i < checkboxes.length; i++) {
                    if (checkboxes[i] !== checkbox) {
                        checkboxes[i].checked = false;
                    }
                }
            }
        </script>
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
