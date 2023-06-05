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
                            <a href="home.jsp"><i class="fa fa-home"></i> Home</a>
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
                                        <div class="card">
                                            <div class="card-heading active">
                                                <a data-toggle="collapse" data-target="#collapseOne">Intel Core Gaming PC</a>
                                            </div>
                                            <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                                <!--                                            <div class="card-body">-->
                                                <!--                                                <ul>-->
                                                <!--                                                    <li><a href="#">Price range</a></li>-->
                                                <!--                                                    <li><a href="#">Processor</a></li>-->
                                                <!--                                                    <li><a href="#">Process Generation</a></li>-->
                                                <!--                                                    <li><a href="#">Graphics</a></li>-->
                                                <!--                                                    <li><a href="#">Memory</a></li>-->
                                                <!--                                                    -->
                                                <!--                                                </ul>-->
                                                <!--                                            </div>-->
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-heading">
                                                <a data-toggle="collapse" data-target="#collapseTwo">AMD Ryzen Gaming PC</a>
                                            </div>
                                            <div id="collapseTwo" class="collapse" data-parent="#accordionExample">
                                                <!--                                            <div class="card-body">-->
                                                <!--                                                <ul>-->
                                                <!--                                                    <li><a href="#">Coats</a></li>-->
                                                <!--                                                    <li><a href="#">Jackets</a></li>-->
                                                <!--                                                    <li><a href="#">Dresses</a></li>-->
                                                <!--                                                    <li><a href="#">Shirts</a></li>-->
                                                <!--                                                    <li><a href="#">T-shirts</a></li>-->
                                                <!--                                                    <li><a href="#">Jeans</a></li>-->
                                                <!--                                                </ul>-->
                                                <!--                                            </div>-->
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-heading">
                                                <a data-toggle="collapse" data-target="#collapseThree">Workstation PC</a>
                                            </div>
                                            <div id="collapseThree" class="collapse" data-parent="#accordionExample">
                                                <!--                                            <div class="card-body">-->
                                                <!--                                                <ul>-->
                                                <!--                                                    <li><a href="#">Coats</a></li>-->
                                                <!--                                                    <li><a href="#">Jackets</a></li>-->
                                                <!--                                                    <li><a href="#">Dresses</a></li>-->
                                                <!--                                                    <li><a href="#">Shirts</a></li>-->
                                                <!--                                                    <li><a href="#">T-shirts</a></li>-->
                                                <!--                                                    <li><a href="#">Jeans</a></li>-->
                                                <!--                                                </ul>-->
                                                <!--                                            </div>-->
                                            </div>
                                        </div>
                                        <div class="card">
                                            <div class="card-heading">
                                                <a data-toggle="collapse" data-target="#collapseFour">Laptop</a>
                                            </div>
                                            <div id="collapseFour" class="collapse" data-parent="#accordionExample">
                                                <div class="card-body">
                                                    <ul>
                                                        <li><a href="#">Coats</a></li>
                                                        <li><a href="#">Jackets</a></li>
                                                        <li><a href="#">Dresses</a></li>
                                                        <li><a href="#">Shirts</a></li>
                                                        <li><a href="#">T-shirts</a></li>
                                                        <li><a href="#">Jeans</a></li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                        <!--                                    <div class="card">-->
                                        <!--                                        <div class="card-heading">-->
                                        <!--                                            <a data-toggle="collapse" data-target="#collapseFive">Cosmetic</a>-->
                                        <!--                                        </div>-->
                                        <!--                                        <div id="collapseFive" class="collapse" data-parent="#accordionExample">-->
                                        <!--                                            <div class="card-body">-->
                                        <!--                                                <ul>-->
                                        <!--                                                    <li><a href="#">Coats</a></li>-->
                                        <!--                                                    <li><a href="#">Jackets</a></li>-->
                                        <!--                                                    <li><a href="#">Dresses</a></li>-->
                                        <!--                                                    <li><a href="#">Shirts</a></li>-->
                                        <!--                                                    <li><a href="#">T-shirts</a></li>-->
                                        <!--                                                    <li><a href="#">Jeans</a></li>-->
                                        <!--                                                </ul>-->
                                        <!--                                            </div>-->
                                        <!--                                        </div>-->
                                        <!--                                    </div>-->
                                    </div>
                                </div>
                            </div>
                            <!--                        <div class="sidebar__filter">-->
                            <!--                            <div class="section-title">-->
                            <!--                                <h4>Shop by price</h4>-->
                            <!--                            </div>-->
                            <!--                            <div class="filter-range-wrap">-->
                            <!--                                <div class="price-range ui-slider ui-corner-all ui-slider-horizontal ui-widget ui-widget-content"-->
                            <!--                                data-min="33" data-max="99"></div>-->
                            <!--                                <div class="range-slider">-->
                            <!--                                    <div class="price-input">-->
                            <!--                                        <p>Price:</p>-->
                            <!--                                        <input type="text" id="minamount">-->
                            <!--                                        <input type="text" id="maxamount">-->
                            <!--                                    </div>-->
                            <!--                                </div>-->
                            <!--                            </div>-->
                            <!--                            <a href="#">Filter</a>-->
                            <!--                        </div>-->
                            <!--                        <div class="sidebar__sizes">-->
                            <!--                            <div class="section-title">-->
                            <!--                                <h4>Shop by size</h4>-->
                            <!--                            </div>-->
                            <!--                            <div class="size__list">-->
                            <!--                                <label for="xxs">-->
                            <!--                                    xxs-->
                            <!--                                    <input type="checkbox" id="xxs">-->
                            <!--                                    <span class="checkmark"></span>-->
                            <!--                                </label>-->
                            <!--                                <label for="xs">-->
                            <!--                                    xs-->
                            <!--                                    <input type="checkbox" id="xs">-->
                            <!--                                    <span class="checkmark"></span>-->
                            <!--                                </label>-->
                            <!--                                <label for="xss">-->
                            <!--                                    xs-s-->
                            <!--                                    <input type="checkbox" id="xss">-->
                            <!--                                    <span class="checkmark"></span>-->
                            <!--                                </label>-->
                            <!--                                <label for="s">-->
                            <!--                                    s-->
                            <!--                                    <input type="checkbox" id="s">-->
                            <!--                                    <span class="checkmark"></span>-->
                            <!--                                </label>-->
                            <!--                                <label for="m">-->
                            <!--                                    m-->
                            <!--                                    <input type="checkbox" id="m">-->
                            <!--                                    <span class="checkmark"></span>-->
                            <!--                                </label>-->
                            <!--                                <label for="ml">-->
                            <!--                                    m-l-->
                            <!--                                    <input type="checkbox" id="ml">-->
                            <!--                                    <span class="checkmark"></span>-->
                            <!--                                </label>-->
                            <!--                                <label for="l">-->
                            <!--                                    l-->
                            <!--                                    <input type="checkbox" id="l">-->
                            <!--                                    <span class="checkmark"></span>-->
                            <!--                                </label>-->
                            <!--                                <label for="xl">-->
                            <!--                                    xl-->
                            <!--                                    <input type="checkbox" id="xl">-->
                            <!--                                    <span class="checkmark"></span>-->
                            <!--                                </label>-->
                            <!--                            </div>-->
                            <!--                        </div>-->
                            <!--                        <div class="sidebar__color">-->
                            <!--                            <div class="section-title">-->
                            <!--                                <h4>Shop by size</h4>-->
                            <!--                            </div>-->
                            <!--                            <div class="size__list color__list">-->
                            <!--                                <label for="black">-->
                            <!--                                    Blacks-->
                            <!--                                    <input type="checkbox" id="black">-->
                            <!--                                    <span class="checkmark"></span>-->
                            <!--                                </label>-->
                            <!--                                <label for="whites">-->
                            <!--                                    Whites-->
                            <!--                                    <input type="checkbox" id="whites">-->
                            <!--                                    <span class="checkmark"></span>-->
                            <!--                                </label>-->
                            <!--                                <label for="reds">-->
                            <!--                                    Reds-->
                            <!--                                    <input type="checkbox" id="reds">-->
                            <!--                                    <span class="checkmark"></span>-->
                            <!--                                </label>-->
                            <!--                                <label for="greys">-->
                            <!--                                    Greys-->
                            <!--                                    <input type="checkbox" id="greys">-->
                            <!--                                    <span class="checkmark"></span>-->
                            <!--                                </label>-->
                            <!--                                <label for="blues">-->
                            <!--                                    Blues-->
                            <!--                                    <input type="checkbox" id="blues">-->
                            <!--                                    <span class="checkmark"></span>-->
                            <!--                                </label>-->
                            <!--                                <label for="beige">-->
                            <!--                                    Beige Tones-->
                            <!--                                    <input type="checkbox" id="beige">-->
                            <!--                                    <span class="checkmark"></span>-->
                            <!--                                </label>-->
                            <!--                                <label for="greens">-->
                            <!--                                    Greens-->
                            <!--                                    <input type="checkbox" id="greens">-->
                            <!--                                    <span class="checkmark"></span>-->
                            <!--                                </label>-->
                            <!--                                <label for="yellows">-->
                            <!--                                    Yellows-->
                            <!--                                    <input type="checkbox" id="yellows">-->
                            <!--                                    <span class="checkmark"></span>-->
                            <!--                                </label>-->
                            <!--                            </div>-->
                            <!--                        </div>-->
                        </div>
                    </div>
                    <div class="col-lg-9 col-md-9">
                        <div class="row">
                            <div class="col-lg-4 col-md-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="<%= request.getContextPath()%>/img/shop/10001.png">
                                        <div class="label new">New</div>
                                        <ul class="product__hover">
                                            <li><a href="<%= request.getContextPath()%>/img/shop/10001.png" class="image-popup"><span
                                                        class="arrow_expand"></span></a></li>
                                            <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                            <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h6><a href="#">PC 1</a></h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product__price">$ 5900.0</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="<%= request.getContextPath()%>/img/shop/10002.png">
                                        <ul class="product__hover">
                                            <li><a href="<%= request.getContextPath()%>/img/shop/10002.png" class="image-popup"><span
                                                        class="arrow_expand"></span></a></li>
                                            <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                            <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h6><a href="#">PC 2</a></h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product__price">$ 4900.0</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="<%= request.getContextPath()%>/img/shop/10003.png">
                                        <ul class="product__hover">
                                            <li><a href="<%= request.getContextPath()%>/img/shop/10003.png" class="image-popup"><span
                                                        class="arrow_expand"></span></a></li>
                                            <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                            <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h6><a href="#">PC 3</a></h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product__price">$ 5000.0</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="<%= request.getContextPath()%>/img/shop/10004.png">
                                        <ul class="product__hover">
                                            <li><a href="<%= request.getContextPath()%>/img/shop/10004.png" class="image-popup"><span
                                                        class="arrow_expand"></span></a></li>
                                            <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                            <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h6><a href="#">PC 4</a></h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product__price">$ 5900.0</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="product__item sale">
                                    <div class="product__item__pic set-bg" data-setbg="<%= request.getContextPath()%>/img/shop/10005.png">
                                        <div class="label">Sale</div>
                                        <ul class="product__hover">
                                            <li><a href="<%= request.getContextPath()%>/img/shop/10005.png" class="image-popup"><span
                                                        class="arrow_expand"></span></a></li>
                                            <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                            <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h6><a href="#">PC 5</a></h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product__price">$ 4900.0 <span>$ 5900.0</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="<%= request.getContextPath()%>/img/shop/10006.png">
                                        <ul class="product__hover">
                                            <li><a href="<%= request.getContextPath()%>/img/shop/10006.png" class="image-popup"><span
                                                        class="arrow_expand"></span></a></li>
                                            <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                            <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h6><a href="#">PC 6</a></h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product__price">$ 5000.0</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="<%= request.getContextPath()%>/img/shop/10007.png">
                                        <ul class="product__hover">
                                            <li><a href="<%= request.getContextPath()%>/img/shop/10007.png" class="image-popup"><span
                                                        class="arrow_expand"></span></a></li>
                                            <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                            <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h6><a href="#">PC 7</a></h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product__price">$ 5000.0</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="product__item">
                                    <div class="product__item__pic set-bg" data-setbg="<%= request.getContextPath()%>/img/shop/10008.png">
                                        <div class="label stockout stockblue">Out Of Stock</div>
                                        <ul class="product__hover">
                                            <li><a href="<%= request.getContextPath()%>/img/shop/10008.png" class="image-popup"><span
                                                        class="arrow_expand"></span></a></li>
                                            <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                            <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h6><a href="#">PC 8</a></h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product__price">$ 5900.0</div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-4 col-md-6">
                                <div class="product__item sale">
                                    <div class="product__item__pic set-bg" data-setbg="<%= request.getContextPath()%>/img/shop/10009.png">
                                        <div class="label">Sale</div>
                                        <ul class="product__hover">
                                            <li><a href="<%= request.getContextPath()%>/img/shop/10009.png" class="image-popup"><span
                                                        class="arrow_expand"></span></a></li>
                                            <li><a href="#"><span class="icon_heart_alt"></span></a></li>
                                            <li><a href="#"><span class="icon_bag_alt"></span></a></li>
                                        </ul>
                                    </div>
                                    <div class="product__item__text">
                                        <h6><a href="#">PC 9</a></h6>
                                        <div class="rating">
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                            <i class="fa fa-star"></i>
                                        </div>
                                        <div class="product__price">$ 4900.0 <span>$ 5900.0</span></div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 text-center">
                                <div class="pagination__option">
                                    <a href="#">1</a>
                                    <a href="#">2</a>
                                    <a href="#">3</a>
                                    <a href="#"><i class="fa fa-angle-right"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- Shop Section End -->

        <!--    &lt;!&ndash; Instagram Begin &ndash;&gt;-->
        <!--    <div class="instagram">-->
        <!--        <div class="container-fluid">-->
        <!--            <div class="row">-->
        <!--                <div class="col-lg-2 col-md-4 col-sm-4 p-0">-->
        <!--                    <div class="instagram__item set-bg" data-setbg="img/instagram/insta-1.jpg">-->
        <!--                        <div class="instagram__text">-->
        <!--                            <i class="fa fa-instagram"></i>-->
        <!--                            <a href="#">@ ashion_shop</a>-->
        <!--                        </div>-->
        <!--                    </div>-->
        <!--                </div>-->
        <!--                <div class="col-lg-2 col-md-4 col-sm-4 p-0">-->
        <!--                    <div class="instagram__item set-bg" data-setbg="img/instagram/insta-2.jpg">-->
        <!--                        <div class="instagram__text">-->
        <!--                            <i class="fa fa-instagram"></i>-->
        <!--                            <a href="#">@ ashion_shop</a>-->
        <!--                        </div>-->
        <!--                    </div>-->
        <!--                </div>-->
        <!--                <div class="col-lg-2 col-md-4 col-sm-4 p-0">-->
        <!--                    <div class="instagram__item set-bg" data-setbg="img/instagram/insta-3.jpg">-->
        <!--                        <div class="instagram__text">-->
        <!--                            <i class="fa fa-instagram"></i>-->
        <!--                            <a href="#">@ ashion_shop</a>-->
        <!--                        </div>-->
        <!--                    </div>-->
        <!--                </div>-->
        <!--                <div class="col-lg-2 col-md-4 col-sm-4 p-0">-->
        <!--                    <div class="instagram__item set-bg" data-setbg="img/instagram/insta-4.jpg">-->
        <!--                        <div class="instagram__text">-->
        <!--                            <i class="fa fa-instagram"></i>-->
        <!--                            <a href="#">@ ashion_shop</a>-->
        <!--                        </div>-->
        <!--                    </div>-->
        <!--                </div>-->
        <!--                <div class="col-lg-2 col-md-4 col-sm-4 p-0">-->
        <!--                    <div class="instagram__item set-bg" data-setbg="img/instagram/insta-5.jpg">-->
        <!--                        <div class="instagram__text">-->
        <!--                            <i class="fa fa-instagram"></i>-->
        <!--                            <a href="#">@ ashion_shop</a>-->
        <!--                        </div>-->
        <!--                    </div>-->
        <!--                </div>-->
        <!--                <div class="col-lg-2 col-md-4 col-sm-4 p-0">-->
        <!--                    <div class="instagram__item set-bg" data-setbg="img/instagram/insta-6.jpg">-->
        <!--                        <div class="instagram__text">-->
        <!--                            <i class="fa fa-instagram"></i>-->
        <!--                            <a href="#">@ ashion_shop</a>-->
        <!--                        </div>-->
        <!--                    </div>-->
        <!--                </div>-->
        <!--            </div>-->
        <!--        </div>-->
        <!--    </div>-->
        <!--    &lt;!&ndash; Instagram End &ndash;&gt;-->

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
