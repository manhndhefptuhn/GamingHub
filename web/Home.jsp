<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%-- 
    Document   : home
    Created on : 26-05-2023, 12:00:19
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

        <!-- Banner Section Begin -->
        <section class="banner">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-xl-7 col-lg-8 m-auto">
                        <div class="banner__slider owl-carousel">
                            <c:forEach var="listSlider" items="${listSlider}">
                                <div class="banner__item">
                                    <a href="${listSlider.getBacklink()}"><img src="<%= request.getContextPath()%>/${listSlider.getSliderImage()}" alt="${listSlider.getSliderTitle()}" /></a>
                                </div>
                            </c:forEach> 
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Banner Section End -->

        <!-- Product Section Begin -->
        <section class="product spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12 col-md-12">
                        <div class="section-title">
                            <h4>Gaming PC</h4>
                        </div>
                    </div>
                </div>
                <div class="row property__gallery">
                    <c:set var="listCaseID" value="${requestScope.listCaseID}" />
                    <c:set var="listImage" value="${requestScope.listImage}" />
                    <c:set var="listGamingProductPrice" value="${requestScope.listGamingProductPrice}" />
                    <c:set var="listGamingProductSalePrice" value="${requestScope.listGamingProductSalePrice}" />
                    <c:set var="listGamingFeedback" value="${requestScope.listGamingFeedback}" />
                    <c:forEach var="listFourGamingPC" items="${listFourGamingPC}">
                        <c:set var="productID" value="${listFourGamingPC.getProductID()}" />
                        <c:set var="caseID" value="${listCaseID[productID]}" />
                        <c:set var="caseObject" value="${listImage[caseID]}" />
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <c:if test="${listFourGamingPC.getProductStatusID() == 0 || listFourGamingPC.getProductStatusID() == 1}">
                                <div class="product__item">
                                </c:if>
                                <c:if test="${listFourGamingPC.getProductStatusID() == 2}">
                                    <div class="product__item sale">
                                    </c:if>
                                    <div class="product__item__pic set-bg" data-setbg="<%= request.getContextPath()%>/${caseObject.getImage()}">
                                        <c:choose>
                                            <c:when test="${listFourGamingPC.getQuantity() == 0}">
                                                <div class="label stockout">out of stock</div>
                                            </c:when>
                                            <c:otherwise>
                                                <c:if test="${listFourGamingPC.getProductStatusID() == 1}">
                                                    <div class="label new">New</div>
                                                </c:if>
                                                <c:if test="${listFourGamingPC.getProductStatusID() == 2}">
                                                    <div class="label sale">Sale</div>
                                                </c:if>
                                            </c:otherwise>
                                        </c:choose>
                                        <ul class="product__hover">
                                            <li><a href="productDetail?productID=${listFourGamingPC.getProductID()}"><span class="arrow_expand"></span></a></li>
                                                    <c:if test="${sessionScope.user.getRole_ID() == 1}">
                                                <li><a href="addToWishlist?productID=${listFourGamingPC.getProductID()}"><span class="icon_heart_alt"></span></a></li>
                                                        <c:if test="${listFourGamingPC.getQuantity() != 0}">
                                                    <li><a href="addToCart?productID=${listFourGamingPC.getProductID()}"><span class="icon_bag_alt"></span></a></li>
                                                        </c:if> 
                                                    </c:if> 
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h6>${listFourGamingPC.getProductName()}</h6>
                                        <div class="rating">
                                            <c:set var="rating" value="${listGamingFeedback[productID]}" />
                                            <c:forEach var="counter" begin="1" end="5">
                                                <c:choose>
                                                    <c:when test="${counter <= rating}">
                                                        <i class="fa fa-star"></i>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <i class="fa fa-star-o"></i>
                                                    </c:otherwise>
                                                </c:choose>
                                            </c:forEach>
                                        </div>
                                        <c:if test="${listFourGamingPC.getProductStatusID() == 0 || listFourGamingPC.getProductStatusID() == 1}">
                                            <div class="product__price">
                                                <fmt:formatNumber pattern="#,##0" value="${listGamingProductPrice[productID]}"/> VNÐ</div>
                                            </c:if>
                                            <c:if test="${listFourGamingPC.getProductStatusID() == 2}">
                                            <div class="product__price"><fmt:formatNumber pattern="#,##0" value="${listGamingProductSalePrice[productID]}"/> VNÐ  <span><fmt:formatNumber pattern="#,##0" value="${listGamingProductPrice[productID]}"/> VNÐ</span></div>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <div class="row">
                        <div class="col-lg-12 col-md-12">
                            <div class="section-title">
                                <h4>Workstation PC</h4>
                            </div>
                        </div>
                    </div>
                    <div class="row property__gallery">
                        <c:set var="listWorkProductPrice" value="${requestScope.listWorkProductPrice}" />
                        <c:set var="listWorkProductSalePrice" value="${requestScope.listWorkProductSalePrice}" />
                        <c:set var="listWorkFeedback" value="${requestScope.listWorkFeedback}" />
                        <c:forEach var="listFourWorkPC" items="${listFourWorkPC}">
                            <c:set var="productID" value="${listFourWorkPC.getProductID()}" />
                            <c:set var="caseID" value="${listCaseID[productID]}" />
                            <c:set var="caseObject" value="${listImage[caseID]}" />
                            <div class="col-lg-3 col-md-4 col-sm-6">
                                <c:if test="${listFourWorkPC.getProductStatusID() == 0 || listFourWorkPC.getProductStatusID() == 1}">
                                    <div class="product__item">
                                    </c:if>
                                    <c:if test="${listFourWorkPC.getProductStatusID() == 2}">
                                        <div class="product__item sale">
                                        </c:if>
                                        <div class="product__item__pic set-bg" data-setbg="<%= request.getContextPath()%>/${caseObject.getImage()}">
                                            <c:choose>
                                                <c:when test="${listFourWorkPC.getQuantity() == 0}">
                                                    <div class="label stockout" style="background: #111111;">out of stock</div>
                                                </c:when>
                                                <c:otherwise>
                                                    <c:if test="${listFourWorkPC.getProductStatusID() == 1}">
                                                        <div class="label new">New</div>
                                                    </c:if>
                                                    <c:if test="${listFourWorkPC.getProductStatusID() == 2}">
                                                        <div class="label sale">Sale</div>
                                                    </c:if>
                                                </c:otherwise>
                                            </c:choose>
                                            <ul class="product__hover">
                                                <li><a href="productDetail?productID=${listFourWorkPC.getProductID()}"><span class="arrow_expand"></span></a></li>
                                                        <c:if test="${sessionScope.user.getRole_ID() == 1}">
                                                    <li><a href="addToWishlist?productID=${listFourWorkPC.getProductID()}"><span class="icon_heart_alt"></span></a></li>
                                                            <c:if test="${listFourWorkPC.getQuantity() != 0}">
                                                        <li><a href="addToCart?productID=${listFourWorkPC.getProductID()}"><span class="icon_bag_alt"></span></a></li>
                                                            </c:if>
                                                        </c:if>
                                            </ul>
                                        </div>
                                        <div class="product__item__text">
                                            <h6>${listFourWorkPC.getProductName()}</h6>
                                            <div class="rating">
                                                <c:set var="rating" value="${listWorkFeedback[productID]}" />
                                                <c:forEach var="counter" begin="1" end="5">
                                                    <c:choose>
                                                        <c:when test="${counter <= rating}">
                                                            <i class="fa fa-star"></i>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <i class="fa fa-star-o"></i>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </div>
                                            <c:if test="${listFourWorkPC.getProductStatusID() == 0 || listFourWorkPC.getProductStatusID() == 1}">
                                                <div class="product__price"><fmt:formatNumber pattern="#,##0" value="${listWorkProductPrice[productID]}"/> VNÐ</div>
                                            </c:if>
                                            <c:if test="${listFourWorkPC.getProductStatusID() == 2}">
                                                <div class="product__price"><fmt:formatNumber pattern="#,##0" value="${listWorkProductSalePrice[productID]}"/> VNÐ <span><fmt:formatNumber pattern="#,##0" value="${listWorkProductPrice[productID]}"/> VNÐ</span></div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                        <div class="row">
                            <div class="col-lg-12 col-md-12">
                                <div class="section-title">
                                    <h4>Mini PC</h4>
                                </div>
                            </div>
                        </div>
                        <div class="row property__gallery">
                            <c:set var="listMiniProductPrice" value="${requestScope.listMiniProductPrice}" />
                            <c:set var="listMiniProductSalePrice" value="${requestScope.listMiniProductSalePrice}" />
                            <c:set var="listMiniFeedback" value="${requestScope.listMiniFeedback}" />
                            <c:forEach var="listFourMiniPC" items="${listFourMiniPC}">
                                <c:set var="productID" value="${listFourMiniPC.getProductID()}" />
                                <c:set var="caseID" value="${listCaseID[productID]}" />
                                <c:set var="caseObject" value="${listImage[caseID]}" />
                                <div class="col-lg-3 col-md-4 col-sm-6">
                                    <div class="product__item">
                                        <c:if test="${listFourMiniPC.getProductStatusID() == 0 || listFourMiniPC.getProductStatusID() == 1}">
                                            <div class="product__item">
                                            </c:if>
                                            <c:if test="${listFourMiniPC.getProductStatusID() == 2}">
                                                <div class="product__item sale">
                                                </c:if>
                                                <div class="product__item__pic set-bg" data-setbg="<%= request.getContextPath()%>/${caseObject.getImage()}">
                                                    <c:choose>
                                                        <c:when test="${listFourMiniPC.getQuantity() == 0}">
                                                            <div class="label stockout" style="background: #111111;">out of stock</div>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:if test="${listFourMiniPC.getProductStatusID() == 1}">
                                                                <div class="label new">New</div>
                                                            </c:if>
                                                            <c:if test="${listFourMiniPC.getProductStatusID() == 2}">
                                                                <div class="label sale">Sale</div>
                                                            </c:if>
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <ul class="product__hover">
                                                        <li><a href="productDetail?productID=${listFourMiniPC.getProductID()}"><span class="arrow_expand"></span></a></li>
                                                                <c:if test="${sessionScope.user.getRole_ID() == 1}">
                                                            <li><a href="addToWishlist?productID=${listFourMiniPC.getProductID()}"><span class="icon_heart_alt"></span></a></li>
                                                                    <c:if test="${listFourMiniPC.getQuantity() != 0}">
                                                                <li><a href="addToCart?productID=${listFourMiniPC.getProductID()}"><span class="icon_bag_alt"></span></a></li>
                                                                    </c:if>
                                                                </c:if>
                                                    </ul>
                                                </div>
                                                <div class="product__item__text">
                                                    <h6>${listFourMiniPC.getProductName()}</h6>
                                                    <div class="rating">
                                                        <c:set var="rating" value="${listMiniFeedback[productID]}" />
                                                        <c:forEach var="counter" begin="1" end="5">
                                                            <c:choose>
                                                                <c:when test="${counter <= rating}">
                                                                    <i class="fa fa-star"></i>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <i class="fa fa-star-o"></i>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:forEach>
                                                    </div>
                                                    <c:if test="${listFourMiniPC.getProductStatusID() == 0 || listFourMiniPC.getProductStatusID() == 1}">
                                                        <div class="product__price"><fmt:formatNumber pattern="#,##0" value="${listMiniProductPrice[productID]}"/> VNÐ</div>
                                                    </c:if>
                                                    <c:if test="${listFourMiniPC.getProductStatusID() == 2}">
                                                        <div class="product__price"><fmt:formatNumber pattern="#,##0" value="${listMiniProductSalePrice[productID]}"/> VNÐ <span><fmt:formatNumber pattern="#,##0" value="${listMiniProductPrice[productID]}"/> VNÐ</span></div>
                                                    </c:if>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                    </section>
                    <!-- Product Section End -->


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
