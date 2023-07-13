<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%-- 
    Document   : shop
    Created on : 06-06-2023, 05:08:42
    Author     : Zarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Shop</title>

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
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Shop Section Begin -->
        <section class="shop spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                        <div class="shop__sidebar">
                            <div class="sidebar__categories">
                                <div class="section-title">
                                    <h4>Categories</h4>
                                </div>
                                <div class="categories__accordion">
                                    <div class="accordion" id="accordionExample">
                                        <div style="padding-bottom: 12px; margin-bottom: 12px;border-bottom: 1px solid #f2f2f2 !important;">
                                            <div>
                                                <a href="shop" style="font-size: 14px; font-weight: 500;color: #111111;display: block;">All PC</a>
                                            </div>
                                        </div>
                                        <c:forEach var="listCategory" items="${listCategory}" varStatus="loop">
                                            <c:set var="index" value="${loop.index + 1}" /> 
                                            <div class="card">
                                                <div class="card-heading">
                                                    <a data-toggle="collapse" data-target="#collapse-${index}">${listCategory.getCategoryName()}</a>
                                                </div>
                                                <div id="collapse-${index}" class="collapse" data-parent="#accordionExample">
                                                    <div class="card-body">
                                                        <ul>
                                                            <li><a href="shop?categoryID=${listCategory.getCategoryID()}">All ${listCategory.getCategoryName()} PC</a></li>
                                                            <li><a href="shop?categoryID=${listCategory.getCategoryID()}&cpuName=intel">Intel CPU</a></li>
                                                            <li><a href="shop?categoryID=${listCategory.getCategoryID()}&cpuName=amd">AMD CPU</a></li>
                                                            <li><a href="shop?categoryID=${listCategory.getCategoryID()}&productStatus=1">New ${listCategory.getCategoryName()} PC</a></li>
                                                            <li><a href="shop?categoryID=${listCategory.getCategoryID()}&productStatus=2">Sale ${listCategory.getCategoryName()} PC</a></li>
                                                        </ul>
                                                    </div>
                                                </div>
                                            </div>
                                        </c:forEach>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-9">
                        <div class="row">
                            <c:set var="listCaseID" value="${requestScope.listCaseID}" />
                            <c:set var="listImage" value="${requestScope.listImage}" />
                            <c:set var="listOriginalPrice" value="${requestScope.listOriginalPrice}" />
                            <c:set var="listSalePrice" value="${requestScope.listSalePrice}" />
                            <c:set var="listFeedback" value="${requestScope.listFeedback}" />
                            <c:forEach var="listProduct" items="${listProduct}">
                                <c:set var="productID" value="${listProduct.getProductID()}" />
                                <c:set var="caseID" value="${listCaseID[productID]}" />
                                <c:set var="caseObject" value="${listImage[caseID]}" />
                                <div class="col-lg-4 col-md-6">
                                    <c:if test="${listProduct.getProductStatusID() == 0 || listProduct.getProductStatusID() == 1}">
                                        <div class="product__item">
                                        </c:if>
                                        <c:if test="${listProduct.getProductStatusID() == 2}">
                                            <div class="product__item sale">
                                            </c:if>
                                            <div class="product__item__pic set-bg" data-setbg="<%= request.getContextPath()%>/${caseObject.getImage()}">
                                                <c:choose>
                                                    <c:when test="${listProduct.getQuantity() == 0}">
                                                        <div class="label stockout stockblue">Out Of Stock</div>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <c:if test="${listProduct.getProductStatusID() == 1}">
                                                            <div class="label new">New</div>
                                                        </c:if>
                                                        <c:if test="${listProduct.getProductStatusID() == 2}">
                                                            <div class="label sale">Sale</div>
                                                        </c:if>
                                                    </c:otherwise>
                                                </c:choose>
                                                <ul class="product__hover">
                                                    <li><a href="productDetail?productID=${listProduct.getProductID()}"><span class="arrow_expand"></span></a></li>
                                                            <c:if test="${sessionScope.user.getRole_ID() == 1}">
                                                        <li><a href="addToWishlist?productID=${listProduct.getProductID()}"><span class="icon_heart_alt"></span></a></li>
                                                                <c:if test="${listProduct.getQuantity() != 0}">
                                                            <li><a href="addToCart?productID=${listProduct.getProductID()}"><span class="icon_bag_alt"></span></a></li>
                                                                </c:if>
                                                            </c:if>
                                                </ul>
                                            </div>
                                            <div class="product__item__text">
                                                <h6>${listProduct.getProductName()}</h6>
                                                <div class="rating">
                                                    <c:set var="rating" value="${listFeedback[productID]}" />
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
                                                <c:if test="${listProduct.getProductStatusID() == 0 || listProduct.getProductStatusID() == 1}">
                                                    <div class="product__price"><fmt:formatNumber pattern="#,##0" value="${listOriginalPrice[productID]}"/> VNÐ</div>
                                                </c:if>
                                                <c:if test="${listProduct.getProductStatusID() == 2}">
                                                    <div class="product__price"><fmt:formatNumber pattern="#,##0" value="${listSalePrice[productID]}"/> VNÐ <span><fmt:formatNumber pattern="#,##0" value="${listOriginalPrice[productID]}"/> VNÐ</span></div>
                                                </c:if>
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                                <div class="col-lg-12 text-center">
                                    <div class="pagination__option">
                                        <c:set var="startPage" value="${currentPage - 1 > 0 ? currentPage - 1 : 1}" />
                                        <c:set var="endPage" value="${currentPage + 2 <= totalPages ? currentPage + 2 : totalPages}" />

                                        <c:if test="${totalPages > 3}">
                                            <c:if test="${currentPage > 1}">
                                                <a href="?page=${currentPage - 1}&categoryID=${param.categoryID}&cpuName=${param.cpuName}&productStatus=${param.productStatus}"><i class="fa fa-angle-left"></i></a>
                                                </c:if>
                                            </c:if>
                                            <c:forEach var="page" begin="${startPage}" end="${endPage}">
                                                <c:choose>
                                                    <c:when test="${page == currentPage}">
                                                    <a class="active" href="?page=${page}&categoryID=${param.categoryID}&cpuName=${param.cpuName}&productStatus=${param.productStatus}">${page}</a>
                                                </c:when>
                                                <c:otherwise>
                                                    <a href="?page=${page}&categoryID=${param.categoryID}&cpuName=${param.cpuName}&productStatus=${param.productStatus}">${page}</a>
                                                </c:otherwise>
                                            </c:choose>
                                        </c:forEach>
                                        <c:if test="${totalPages > 3}">
                                            <c:if test="${currentPage < totalPages}">
                                                <a href="?page=${currentPage + 1}&categoryID=${param.categoryID}&cpuName=${param.cpuName}&productStatus=${param.productStatus}"><i class="fa fa-angle-right"></i></a>
                                                </c:if>
                                            </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
        </section>
        <!-- Shop Section End -->

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
