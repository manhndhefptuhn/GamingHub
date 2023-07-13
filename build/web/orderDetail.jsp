<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%-- 
    Document   : orderDetail
    Created on : 11-07-2023, 08:37:01
    Author     : Zarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Order Detail</title>

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap" rel="stylesheet">

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
                            <a href="myOrder">My Order</a>
                            <span>Order Detail</span>
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
                            <table>
                                <thead>
                                    <tr>
                                        <th>Product</th>
                                        <th>Price</th>
                                        <th>Quantity</th>
                                        <th>Total</th>
                                            <c:if test="${listOrderInfor.getOrderStatus() == 3}">
                                            <th>Feedback</th>
                                            </c:if>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:set var="listCaseID" value="${requestScope.listCaseID}" />
                                    <c:set var="listImage" value="${requestScope.listImage}" />
                                    <c:set var="listProductName" value="${requestScope.listProductName}" />
                                    <c:set var="orderStatus" value="${requestScope.orderStatus}" />
                                    <c:forEach var="listOrderDetail" items="${listOrderDetail}">
                                        <c:set var="productID" value="${listOrderDetail.getProductID()}" />
                                        <c:set var="caseID" value="${listCaseID[productID]}" />
                                        <c:set var="caseObject" value="${listImage[caseID]}" />
                                        <tr>
                                            <td class="cart__product__item">
                                                <a href="productDetail?productID=${productID}">
                                                    <img src="<%= request.getContextPath()%>/${caseObject.getImage()}" style="width: 20%">
                                                    <div class="cart__product__item__title">
                                                        <h6>${listProductName[productID]}</h6>
                                                    </div>
                                                </a>
                                            </td>
                                            <td class="cart__price"><fmt:formatNumber pattern="#,##0" value="${listOrderDetail.getProductPrice()}"/> VNÐ</td>
                                            <td class="cart__quantity" style="padding-left: 2em;">${listOrderDetail.getQuantity()}</td>
                                            <td class="cart__total"><fmt:formatNumber pattern="#,##0" value="${listOrderDetail.getTotalCost()}"/> VNÐ</td>
                                            <c:if test="${listOrderInfor.getOrderStatus() == 3}">
                                                <td><a href="feedback?productID=${productID}&orderID=${listOrderInfor.getOrderID()}" style="padding-left: 2em;"><i class="fa fa-comment"></i></a></td>
                                                    </c:if>
                                        </tr>
                                    </c:forEach>  
                                </tbody>
                            </table>
                            <c:set var="listOrderInfor" value="${requestScope.listOrderInfor}" />
                            <div class="row">
                                <div class="col-lg-8 offset-lg-12">
                                    <div class="checkout__order">
                                        <div class="checkout__order__product">
                                            <ul>
                                                <li>
                                                    <span class="top__text">Receiver Information</span>
                                                </li>
                                                <li>Order ID<span>${listOrderInfor.getOrderID()}</span></li>
                                                <li>Name<span>${listOrderInfor.getFullName()}</span></li>
                                                <li>Address<span>${listOrderInfor.getAddress()}</span></li>
                                                <li>Phone Number<span>${listOrderInfor.getPhoneNumber()}</span></li>
                                                <li>Order Date<span>${listOrderInfor.getOrderDate()}</span></li>
                                                <li>Payment type<span>${listOrderInfor.getPayment()}</span></li>
                                                <li>Order status<span>${orderStatus}</span></li>
                                            </ul>
                                        </div>
                                        <div class="checkout__order__total" style="border-bottom: none;">
                                            <ul>
                                                <li>Total<span><fmt:formatNumber pattern="#,##0" value="${listOrderInfor.getTotalCost()}"/> VNÐ</span></li>
                                            </ul>
                                        </div>
                                    </div>
                                </div>
                                    <div class="col-lg-4 offset-lg-12">
                                        <div class="checkout__order" style="background: #ffffff;">
                                            <div class="checkout__order__product">
                                                <ul>
                                                    <li>
                                                        <span class="top__text">Note about order</span>
                                                    </li>
                                                </ul>
                                            </div>
                                            <div class="checkout__order__total" style="border-bottom: none;">
                                                <form action="editOrder" method="POST">
                                                    <input type="hidden" name="orderID" value="${listOrderInfor.getOrderID()}">
                                                    <c:choose>
                                                        <c:when test="${listOrderInfor.getOrderStatus() == 1}">
                                                            <input placeholder="Enter your note" value="${listOrderInfor.getNote()}" name="note" style="width: 100%; margin-bottom: 2em;"/>
                                                            <button name="save" type="submit" class="site-btn">Save</button>
                                                            <button name="cancel" type="submit" class="site-btn" style="margin-top: 1em; background-color: #111111;" onclick="return confirmCancellation()">Cancel Order</button>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input placeholder="Enter your note" value="${listOrderInfor.getNote()}" name="note" style="width: 100%; margin-bottom: 2em;" readonly/>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shop Cart Section End -->

        <%@include file="footer.jsp" %>

        <!-- Js Plugins -->
        <script>
            function confirmCancellation() {
                return confirm("Are you sure you want to cancel this order?");
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
