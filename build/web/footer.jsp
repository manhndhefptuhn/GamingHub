<%-- 
    Document   : footer
    Created on : 30-05-2023, 08:37:34
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

        <!-- Google Font -->
        <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
              rel="stylesheet">

    </head>
    <body>
        <!-- Footer Section Begin -->
        <footer class="footer">
            <div class="container">
                <div class="row">
                    <div class="col-lg-6 col-md-6 col-sm-12">
                        <div class="footer__about">
                            <div class="footer__logo">
                                <a href="home"><img src="<%= request.getContextPath()%>/img/shop/logo1.png" alt="logo"></a>
                            </div>
                            <p>Experience PC Excellence with Gaming Hub - Your Trusted Source for Cutting-Edge Technology</p>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12">
                        <div class="footer__widget">
                            <h6>Quick links</h6>
                            <ul>
                                <li><a href="home">Home</a></li>
                                <li><a href="shop">Shop</a></li>
                                <li><a href="contact.jsp">Contact</a></li>
                            </ul>
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6 col-sm-12">
                        <div class="footer__newslatter">
                            <h6>WHERE TO FIND US</h6>
                            <div class="footer__social">
                                <a href="https://www.facebook.com/"><i class="fa fa-facebook"></i></a>
                                <a href="https://twitter.com/"><i class="fa fa-twitter"></i></a>
                                <a href="https://www.youtube.com/"><i class="fa fa-youtube-play"></i></a>
                                <a href="https://www.instagram.com/"><i class="fa fa-instagram"></i></a>
                                <a href="https://www.pinterest.com/"><i class="fa fa-pinterest"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="footer__copyright__text">
                            <p>Copyright &copy; <script>document.write(new Date().getFullYear());</script> Gaming Hub</p>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
        <!-- Footer Section End -->

    </body>
</html>
