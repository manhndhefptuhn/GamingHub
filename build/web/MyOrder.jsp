<%-- 
    Document   : MyOrder
    Created on : Jun 20, 2023, 9:14:57 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
  <meta name="description" content="Ashion Template">
  <meta name="keywords" content="Ashion, unica, creative, html">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>UserOrder</title>
  <!-- Google Font -->
  <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
        rel="stylesheet">

  <!-- Css Styles -->
  <link rel="stylesheet" href="../css/bootstrap.min.css" type="text/css">
  <link rel="stylesheet" href="../css/font-awesome.min.css" type="text/css">
  <link rel="stylesheet" href="../css/elegant-icons.css" type="text/css">
  <link rel="stylesheet" href="../css/jquery-ui.min.css" type="text/css">
  <link rel="stylesheet" href="../css/magnific-popup.css" type="text/css">
  <link rel="stylesheet" href="../css/owl.carousel.min.css" type="text/css">
  <link rel="stylesheet" href="../css/slicknav.min.css" type="text/css">
  <link rel="stylesheet" href="../css/style.css" type="text/css">
</head>
<body>
<!-- Page Preloder -->
<!--<div id="preloder">-->
<!--  <div class="loader"></div>-->
<!--</div>-->

<!-- Offcanvas Menu Begin -->
<div class="offcanvas-menu-overlay"></div>
<div class="offcanvas-menu-wrapper">
  <div class="offcanvas__close">+</div>
  <ul class="offcanvas__widget">
    <li><span class="icon_search search-switch"></span></li>
    <li><a href="#"><span class="icon_heart_alt"></span>
      <div class="tip">2</div>
    </a></li>
    <li><a href="#"><span class="icon_bag_alt"></span>
      <div class="tip">2</div>
    </a></li>
  </ul>
  <div class="offcanvas__logo">
    <a href="home.html"><img src="../img/shop/logo.png" alt=""></a>
  </div>
  <div id="mobile-menu-wrap"></div>
  <div class="offcanvas__auth">
    <!--            <a href="#">Login</a>-->
    <!--            <a href="#">Register</a>-->
    <div class="btn-group">
      <button class="btn btn-secondary btn-lg dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
        Large button
      </button>
      <div class="dropdown-menu">
        <a href="UserProfile.html"></a>
        <a href="changePassword.html"></a>
        <a href=""></a>
      </div>
    </div>
  </div>
</div>
<!-- Offcanvas Menu End -->

<!-- Header Section Begin -->
<header class="header">
  <div class="container-fluid">
    <div class="row">
      <div class="col-xl-3 col-lg-2">
        <div class="header__logo">
          <a href="./home.html"><img src="../img/shop/logo.png" alt=""></a>
        </div>
      </div>
      <div class="col-xl-6 col-lg-7">
        <nav class="header__menu">
          <ul>
            <li class="active"><a href="./home.html">Home</a></li>
            <!--                            <li><a href="#">Intel Core Gaming PC</a></li>-->
            <!--                            <li><a href="#">AMD Ryzen Gaming PC</a></li>-->
            <li><a href="./shop.html">Shop</a></li>
            <li><a href="#">Pages</a>
              <ul class="dropdown">
                <li><a href="./product-details.html">Product Details</a></li>
                <li><a href="./shop-cart.html">Shop Cart</a></li>
                <li><a href="./checkout.html">Checkout</a></li>

              </ul>
            </li>

            <li><a href="./contact.html">Contact</a></li>
          </ul>
        </nav>
      </div>
      <div class="col-lg-3">
        <div class="header__right">
          <div class="header__right__auth">
            <a href="#">Login</a>
            <a href="#">Register</a>
          </div>
          <ul class="header__right__widget">
            <li><span class="icon_search search-switch"></span></li>
            <li><a href="#"><span class="icon_heart_alt"></span>
              <div class="tip">2</div>
            </a></li>
            <li><a href="#"><span class="icon_bag_alt"></span>
              <div class="tip">2</div>
            </a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="canvas__open">
      <i class="fa fa-bars"></i>
    </div>
  </div>
</header>
<!-- Header Section End -->

<!-- Breadcrumb Begin -->
<div class="breadcrumb-option">
  <div class="container">
    <div class="row">
      <div class="col-lg-12">
        <div class="breadcrumb__links">
          <a href="home.html"><i class="fa fa-home"></i> Home</a>
          <span>Shop</span>
        </div>
      </div>
    </div>
  </div>
</div>
<!-- Breadcrumb End -->
<div id="content" class="container">
  <div class="texto">
  <h1>Order History</h1>
  </div>
  <div id="table">


      <div class="table-responsive">
        <table class="table table-striped table-sm">
        <thead>
        <tr>
          <th>#</th>
          <th>Order Time</th>
          <th>Last Updated</th>
          <th>Total Price</th>
          <th>Status</th>
          <th>Actions</th>
        </tr>
        </thead>
      <tbody>
      <tr>
        <td>1,001</td>
        <td>random</td>
        <td>data</td>
        <td>placeholder</td>
        <td>text</td>
        <td><button type="button" id="view" name="view">View</button></td>
      </tr>
      <tr>
        <td>1,002</td>
        <td>placeholder</td>
        <td>irrelevant</td>
        <td>visual</td>
        <td>layout</td>
        <td>
          <button type="button" id="view_2" name="view">View</button>
          <button type="button" id="cancel" name="cancel">Cancel</button>
        </td>
      </tr>
      </tbody>
    </table>
  </div>
    <div class="text2">
      <h1>Featured PC</h1>
    </div>
    <div class="responsive">

      <div class="gallery">
        <a target="_blank" href="../img/shop/10007.png">
          <img src="../img/shop/10007.png" alt="Cinque Terre">
        </a>
        <div class="desc">Add a description of the image here</div>
      </div>
    </div>

    <div class="responsive">
      <div class="gallery">
        <a target="_blank" href="../img/shop/10006.png">
          <img src="../img/shop/10006.png" alt="Forest">
        </a>
        <div class="desc">Add a description of the image here</div>
      </div>
    </div>

    <div class="responsive">
      <div class="gallery">
        <a target="_blank" href="../img/shop/10006.png">
          <img src="../img/shop/10006.png" alt="Northern Lights">
        </a>
        <div class="desc">Add a description of the image here</div>
      </div>
    </div>

    <div class="responsive">
      <div class="gallery">
        <a target="_blank" href="../img/shop/10006.png">
          <img src="../img/shop/10006.png" alt="Mountains">
        </a>
        <div class="desc">Add a description of the image here</div>
      </div>
    </div>

    <div class="clearfix"></div>




</div>
</div>

</body>
</html>
