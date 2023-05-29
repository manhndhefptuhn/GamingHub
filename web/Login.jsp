<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : login
    Created on : 26-05-2023, 12:02:37
    Author     : Zarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sign in</title>

        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style1.css">
    </head>
    <body>
        <%String notification = (String)request.getAttribute("notification");%>
        <!-- Sign in  Form -->
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="<%= request.getContextPath()%>/img/signin-image.jpg" alt="sing up image"></figure>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Sign in </h2>
                        <form action="login" method="POST" class="register-form" id="login-form">
                            <div class="form-group">
                                <input type="email" name="email" id="your_email" placeholder="Your Email"/>
                            </div>
                            <div class="form-group">
                                <input type="password" name="password" id="your-pass"  placeholder="Password"/>
                                <span  class="fa fa-fw field-icon toggle-password"></span>
                            </div>
                            <div>
                                <input type="checkbox" id="reveal-checkbox" class="agree-term" onclick="revealPassword()"/>
                                <label for="reveal-checkbox" class="label-agree-term" ><span><span></span></span>Reveal Password</label>                       
                            </div>
                            <div>
                                <c:if test="${notification != null}">
                                    <strong style="color: red;">${notification}</strong>
                                </c:if>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="Sign in"/>
                            </div>
                            <div class="container-swap">
                                <div class="div_left">
                                    <input type="checkbox" name="rememberMe" id="remember-me" class="agree-term" value="true"/>
                                    <label for="remember-me" class="label-agree-term"><span><span></span></span>Remember me</label>                       
                                </div>
                                <div class="div_right">
                                    <a href="forgetPassword.jsp" class="forgetpass">Forgot password</a>
                                </div>
                            </div>       

                        </form>
                        <div  class="create-acc">
                            <a href="register.jsp" class="text1">Sign Up</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>
        <!-- JS -->
        <script src="<%= request.getContextPath()%>/jquery/jquery.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/main1.js"></script>


    </body>
</html>
