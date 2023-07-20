<%-- 
    Document   : forgetPassword
    Created on : 28-05-2023, 15:53:55
    Author     : Zarius
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Forgot password</title>
        <link rel="icon" type="image/png" href="<%= request.getContextPath()%>/img/shop/logo1.png"/>
        
        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style1.css">
    </head>
    <body>
        <%String notification = (String)request.getAttribute("notification");%>
        <!-- Sing in  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="<%= request.getContextPath()%>/img/signin-image.jpg" alt="sing up image"></figure>
                        <a href="Login.jsp" class="signup-image-link">Back to Log In</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Forgot password</h2>
                        <form action="forgetPass" method="POST" class="register-form" id="login-form">
                            <div class="form-group">
                                <label for="email"><i class="zmdi zmdi-email"></i></label>
                                <input type="email" name="email" id="your_email" placeholder="Your Email"/>
                            </div>
                            <c:if test="${notification != null}">
                                <strong style="color:red;">${notification}</strong>
                            </c:if>
                            <div class="form-group">
                                <div class="form-group form-button">
                                    <input type="submit" name="send-email" id="send_email" class="form-submit" value="Send Request"/>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>
        <!-- JS -->
        <script src="<%= request.getContextPath()%>/jquery/jquery.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/main1.js"></script>

    </body>
</html>
