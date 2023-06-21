<%-- 
    Document   : productDetail
    Created on : 15-06-2023, 18:00:06
    Author     : Zarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Product Detail</title>
        <link rel="icon" type="image/png" href="path-to-your-favicon"/>

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
        <style>
            table {
                font-family: "Montserrat", sans-serif;
                border-collapse: collapse;
                width: 100%;
            }
            th{
                border: 1px solid #000000;
                text-align: left;
                padding: 8px;
            }
            td{
                border: 1px solid #000000;
                text-align: left;
                padding: 8px;
                background-color: #dddddd;
            }
            td:nth-child(1){
                width: 30%;
            }
            td:nth-child(2){
                background-color: #ffffff;
                width: 70%
            }
        </style>
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
                            <a href="#">Shop</a>
                            <span>${product.getProductName()}</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Breadcrumb End -->

        <!-- Product Details Section Begin -->
        <section class="product-details spad">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6">
                        <div class="product__details__pic">
                            <div class="product__details__pic__left product__thumb nice-scroll">
                                <c:forEach var="image" items="${listImageOfProduct}" varStatus="loop">
                                    <c:set var="index" value="${loop.index + 1}" /> 
                                    <a class="pt ${loop.first ? 'active' : ''}" href="#product-${index}">
                                        <img src="<%= request.getContextPath()%>/${image.getImages()}" alt="">
                                    </a>
                                </c:forEach>
                            </div>
                            <div class="product__details__slider__content">
                                <div class="product__details__pic__slider owl-carousel">
                                    <c:forEach var="image" items="${listImageOfProduct}" varStatus="loop">
                                        <img data-hash="product-${loop.index + 1}" class="product__big__img" src="<%= request.getContextPath()%>/${image.getImages()}" alt="">
                                    </c:forEach>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="col-lg-6">
                        <div class="product__details__text">
                            <h3>${product.getProductName()}</h3>
                            <div class="rating">
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <i class="fa fa-star"></i>
                                <span>( 138 reviews )</span>
                            </div>
                            <c:if test="${product.getProductStatusID() == 0}">
                                <div class="product__details__price">$ ${originalPrice}</div>
                            </c:if>
                            <c:if test="${product.getProductStatusID() == 1}">
                                <div class="product__details__price">$ ${originalPrice}</div>
                            </c:if>
                            <c:if test="${product.getProductStatusID() == 2}">
                                <div class="product__details__price">$ ${salePrice} <span>$ ${originalPrice}</span></div>
                            </c:if>
                            <p>${product.getDescription()}</p>
                            <div class="product__details__button">
                                <c:choose>
                                    <c:when test="${product.getQuantity() == 0}">
                                        <a class="cart-btn" style="background: #111111">Out of stock</a>
                                    </c:when>
                                    <c:otherwise>
                                        <a href="#?productID=${product.getProductID()}" class="cart-btn">
                                            <span class="icon_bag_alt"></span> Add to cart</a>
                                    </c:otherwise>
                                </c:choose>
                                <ul>
                                    <c:if test="${sessionScope.user.getRole_ID() == 1}">
                                        <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                            </c:if>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-1" role="tab">Specification</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#tabs-2" role="tab">Reviews ( 2 )</a>
                                </li>
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-1" role="tabpanel">
                                    <table>
                                        <tr>
                                            <th>Component Type</th>
                                            <th>Component Name</th>
                                        </tr>
                                        <tr>
                                            <td>Mainboard</td><td>${mainboard.getMainboardName()}</td>
                                        </tr>
                                        <tr>
                                            <td>CPU</td><td>${cpu.getCpuName()}</td>
                                        </tr>
                                        <tr>
                                            <td>RAM</td><td>${ram.getRamName()}</td>
                                        </tr>
                                        <tr>
                                            <td>VGA</td><td>${vga.getVgaName()}</td>
                                        </tr>
                                        <tr>
                                            <td>Storage</td><td>${storage.getStorageName()}</td>
                                        </tr>
                                        <tr>
                                            <td>PSU</td><td>${psu.getPsuName()}</td>
                                        </tr>
                                        <tr>
                                            <td>Case</td><td>${casePC.getCaseName()}</td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="tab-pane" id="tabs-2" role="tabpanel">
                                    <div class="blog__details__comment">
                                        <h5>3 Comment</h5>
                                        <c:if test="${sessionScope.user.getRole_ID() == 1}">
                                            <a href="#" class="leave-btn">Leave a comment</a>
                                        </c:if>
                                        <div class="blog__comment__item">
                                            <div class="blog__comment__item__pic">
                                                <img src="<%= request.getContextPath()%>/img/default-avatar.png" alt="">
                                            </div>
                                            <div class="blog__comment__item__text">
                                                <h6>Brandon Kelley</h6>
                                                <p>This is comment.</p>
                                                    <a class="image-popup" href="<%= request.getContextPath()%>/img/case/1st_Player_XF_Black.jpg">
                                                    <img src="<%= request.getContextPath()%>/img/case/1st_Player_XF_Black.jpg" alt="" style="width:10%; "></a>
                                                <ul>
                                                    <li><i class="fa fa-clock-o"></i> Seb 17, 2019</li>
                                                </ul>
                                            </div>
                                        </div>
                                        <div class="blog__comment__item blog__comment__item--reply">
                                            <div class="blog__comment__item__pic">
                                                <img src="<%= request.getContextPath()%>/img/default-avatar.png" alt="">
                                            </div>
                                            <div class="blog__comment__item__text">
                                                <h6>Brandon Kelley</h6>
                                                <p>This is reply</p>
                                                <ul>
                                                    <li><i class="fa fa-clock-o"></i> Seb 17, 2019</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12 text-center">
                        <div class="related__title">
                            <h5>RELATED PRODUCTS</h5>
                        </div>
                    </div>
                    <c:set var="listCaseID" value="${requestScope.listCaseID}" />
                    <c:set var="listImage" value="${requestScope.listImage}" />
                    <c:set var="listRelatedPCPrice" value="${requestScope.listRelatedPCPrice}" />
                    <c:set var="listSalePrice" value="${requestScope.listSalePrice}" />
                    <c:forEach var="listRelated" items="${listRelated}">
                        <c:set var="productID" value="${listRelated.getProductID()}" />
                        <c:set var="caseID" value="${listCaseID[productID]}" />
                        <c:set var="caseObject" value="${listImage[caseID]}" />
                        <div class="col-lg-3 col-md-4 col-sm-6">
                            <c:if test="${listRelated.getProductStatusID() == 0}">
                                <div class="product__item">
                                </c:if>
                                <c:if test="${listRelated.getProductStatusID() == 1}">
                                    <div class="product__item">
                                    </c:if>
                                    <c:if test="${listRelated.getProductStatusID() == 2}">
                                        <div class="product__item sale">
                                        </c:if>
                                        <div class="product__item__pic set-bg" data-setbg="<%= request.getContextPath()%>/${caseObject.getImage()}">
                                            <c:if test="${listRelated.getQuantity() == 0}">
                                                <div class="label stockout">out of stock</div>
                                            </c:if>
                                            <c:if test="${listRelated.getProductStatusID() == 1}">
                                                <div class="label new">New</div>
                                            </c:if>
                                            <c:if test="${listRelated.getProductStatusID() == 2}">
                                                <div class="label sale">Sale</div>
                                            </c:if>
                                            <ul class="product__hover">
                                                <li><a href="productDetail?productID=${listRelated.getProductID()}"><span class="arrow_expand"></span></a></li>
                                                <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                                <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                            </ul>
                                        </div>
                                        <div class="product__item__text">
                                            <h6><a href="#">${listRelated.getProductName()}</a></h6>
                                            <div class="rating">
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <c:if test="${listRelated.getProductStatusID() == 0}">
                                                <div class="product__price">$ ${listRelatedPCPrice[productID]}</div>
                                            </c:if>
                                            <c:if test="${listRelated.getProductStatusID() == 1}">
                                                <div class="product__price">$ ${listRelatedPCPrice[productID]}</div>
                                            </c:if>
                                            <c:if test="${listRelated.getProductStatusID() == 2}">
                                                <div class="product__price">$ ${listSalePrice[productID]} <span>$ ${listRelatedPCPrice[productID]}</span></div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                    </section>
                    <!-- Product Details Section End -->

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
