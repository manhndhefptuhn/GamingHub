<%-- 
    Document   : cart
    Created on : 26-06-2023, 17:52:00
    Author     : Zarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Cart</title>

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
                            <span>Shopping cart</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Shop Cart Section Begin -->
        <section class="shop-cart spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shop__cart__table">
                            <c:choose>
                                <c:when test="${empty listCart}">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th style="text-align: center;">Your Cart is empty</th>
                                            </tr>
                                        </thead>
                                    </table>
                                    <div class="row">
                                        <div class="col-lg-12 col-md-12 col-sm-12">
                                            <div class="cart__btn" style="display: flex; justify-content: center; margin-top:2em;">
                                                <a href="shop">Continue Shopping</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <form action="updateCart" method="POST">
                                        <table>
                                            <thead>
                                                <tr>
                                                    <th>Product</th>
                                                    <th>Price</th>
                                                    <th>Quantity</th>
                                                    <th>Total</th>
                                                    <th></th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:set var="listCaseID" value="${requestScope.listCaseID}" />
                                                <c:set var="listImage" value="${requestScope.listImage}" />
                                                <c:set var="listCartProductName" value="${requestScope.listCartProductName}" />
                                                <c:set var="listProductQuantity" value="${requestScope.listProductQuantity}" />
                                                <c:forEach var="listCart" items="${listCart}">
                                                    <c:set var="productID" value="${listCart.getProductID()}" />
                                                    <c:set var="caseID" value="${listCaseID[productID]}" />
                                                    <c:set var="caseObject" value="${listImage[caseID]}" />
                                                    <tr>
                                                        <td class="cart__product__item">
                                                            <a href="productDetail?productID=${listCart.getProductID()}">
                                                                <img src="<%= request.getContextPath()%>/${caseObject.getImage()}" style="width: 20%">
                                                                <div class="cart__product__item__title">
                                                                    <h6>${listCartProductName[productID]}</h6>
                                                                </div>
                                                            </a>
                                                        </td>
                                                        <td class="cart__price">$ ${listCart.getProductPrice()}</td>
                                                        <td class="cart__quantity">
                                                            <input type="hidden" id="max-quantity-${productID}" value="${listProductQuantity[productID]}">
                                                            <input type="hidden" name="productPrice" value="${listCart.getProductPrice()}">
                                                            <input type="hidden" name="productID" value="${listCart.getProductID()}">
                                                            <div class="pro-qty">
                                                                <input type="number" name="quantity" value="${listCart.getQuantity()}" min="1" max="${listProductQuantity[productID]}" data-product-id="${productID}">
                                                            </div>
                                                        </td>
                                                        <td class="cart__total">$ ${listCart.getTotalCost()}</td>
                                                        <td class="cart__close"><a href="removeCart?productID=${productID}"><span class="icon_close"></span></a></td>
                                                    </tr>
                                                </c:forEach>  
                                            </tbody>
                                        </table>
                                        <div class="row">
                                            <div class="col-lg-6 col-md-6 col-sm-6">
                                                <div class="cart__btn">
                                                    <a href="shop">Continue Shopping</a>
                                                </div>
                                            </div>
                                            <div class="col-lg-6 col-md-6 col-sm-6">
                                                <div class="cart__btn update__btn">
                                                    <button type="submit" style="font-size: 14px;
                                                            color: #111111;
                                                            font-weight: 600;
                                                            text-transform: uppercase;
                                                            display: inline-block;
                                                            padding: 14px 30px 12px;
                                                            background: #f5f5f5;
                                                            border: none;">
                                                        <span class="icon_loading" style="color: #ca1515;"></span> Update cart
                                                    </button>
                                                </div>
                                            </div>
                                        </div>
                                    </form>

                                    <div class="row">
                                        <div class="col-lg-12 offset-lg-12">
                                            <div class="cart__total__procced">
                                                <h6>Cart total</h6>
                                                <ul>
                                                    <li>Total <span>$ ${totalCost}</span></li>
                                                </ul>
                                                <a href="cartContact" class="primary-btn">Proceed to checkout</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shop Cart Section End -->

        <%@include file="footer.jsp" %>

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
