<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%-- 
    Document   : wishlist
    Created on : 22-06-2023, 16:19:17
    Author     : Zarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>WishList</title>

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
                            <span>Wishlist</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Wish List Section Begin -->
        <section class="shop-cart spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="shop__cart__table">
                            <c:choose>
                                <c:when test="${empty listWishList}">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th style="text-align: center;">Your wishlist is empty</th>
                                            </tr>
                                        </thead>
                                    </table>
                                </c:when>
                                <c:otherwise>
                                    <table>
                                        <thead>
                                            <tr>
                                                <th>Product</th>
                                                <th></th>
                                                <th>Price</th>
                                                <th></th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="listCaseID" value="${requestScope.listCaseID}" />
                                            <c:set var="listImage" value="${requestScope.listImage}" />
                                            <c:set var="listWishlistProductName" value="${requestScope.listWishlistProductName}" />
                                            <c:set var="listWishlistProductStatus" value="${requestScope.listWishlistProductStatus}" />
                                            <c:set var="listWishlistProductPrice" value="${requestScope.listWishlistProductPrice}" />
                                            <c:set var="listWishlistSalePrice" value="${requestScope.listWishlistSalePrice}" />
                                            <c:forEach var="listWishList" items="${listWishList}">
                                                <c:set var="productID" value="${listWishList.getProductID()}" />
                                                <c:set var="caseID" value="${listCaseID[productID]}" />
                                                <c:set var="caseObject" value="${listImage[caseID]}" />
                                                <tr>
                                                    <td class="cart__product__item">
                                                        <a href="productDetail?productID=${listWishList.getProductID()}">
                                                        <img src="<%= request.getContextPath()%>/${caseObject.getImage()}" style="width: 20%">
                                                        <div class="cart__product__item__title">
                                                            <h6>${listWishlistProductName[productID]}</h6>
                                                        </div>
                                                        </a>
                                                    </td>
                                                    <td></td>
                                                    <c:if test="${listWishlistProductStatus[productID] == 0 || listWishlistProductStatus[productID] == 1}">
                                                        <td class="cart__total"><fmt:formatNumber pattern="#,##0" value="${listWishlistProductPrice[productID]}"/> VNÐ</td>
                                                    </c:if>
                                                    <c:if test="${listWishlistProductStatus[productID] == 2 }">
                                                        <td class="cart__total"><fmt:formatNumber pattern="#,##0" value="${listWishlistSalePrice[productID]}"/> VNÐ</td>
                                                    </c:if>
                                                    <td class="cart__close"><a href="removeWishlist?productID=${productID}"><span class="icon_close"></span></a></td>
                                                    <td class="cart__close"><a href="addToCart?productID=${productID}"><span class="icon_bag_alt"></span></a></td>
                                                </tr>
                                            </c:forEach>    
                                        </tbody>
                                    </table>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="cart__btn">
                            <a href="shop">Continue Shopping</a>
                        </div>
                    </div>
                    <div class="col-lg-6 col-md-6 col-sm-6">
                        <div class="cart__btn update__btn">
                            <a href="cart"><span class="icon_bag_alt"></span>Go to cart</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Wish List Section End -->

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
