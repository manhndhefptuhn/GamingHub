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
        <link rel="icon" type="image/png" href="<%= request.getContextPath()%>/img/shop/logo1.png"/>
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
                        <figure><img src="<%= request.getContextPath()%>/img/signin-image.jpg" alt="Sign in image"></figure>
                        <a href="home" class="signup-image-link">Home</a>
                    </div>

                    <div class="signin-form">
                        <h2 class="form-title">Sign in </h2>
                        <form action="login" method="POST" class="register-form" id="login-form">
                            <c:choose>
                                <c:when test="${email != null}">
                                    <div class="form-group">
                                        <label for="email"><i class="zmdi zmdi-email"></i></label>
                                        <input type="email" name="email" id="your_email" placeholder="Your Email" value="${email}" required/>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="form-group">
                                        <label for="email"><i class="zmdi zmdi-email"></i></label>
                                        <input type="email" name="email" id="your_email" placeholder="Your Email" required/>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-key"></i></label>
                                <input type="password" name="password" id="loginPassword"  placeholder="Password" required/>
                            </div>
                            <div class="form-group" style="margin-bottom: 0;">
                                <div class="div_left" style="text-align:left;">
                                    <div>
                                        <input type="checkbox" id="revealCheckbox" class="reveal-checkbox" onchange="togglePasswordVisibility()">
                                        <label for="revealCheckbox" class="label-agree-term" ><span><span></span></span>Reveal Password</label>                       
                                    </div>
                                </div>
                                <div class="div_right">
                                    <a href="forgetPassword.jsp" class="forgetpass">Forgot password</a>
                                </div>
                            </div> 
                            <c:if test="${notification != null}">
                                <div>
                                    <strong style="color: red;">${notification}</strong>
                                </div>
                            </c:if>
                            <div class="form-group form-button">
                                <input style="width: 100%" type="submit" name="signin" id="signin" class="form-submit" value="Sign in"/>
                            </div>
                            <p class="forgetpass">Not have account?<a href="register.jsp" class="forgetpass" style="padding-bottom: 2em;">Create new account</a></p>
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
