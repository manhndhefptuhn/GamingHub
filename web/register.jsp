<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : register
    Created on : 26-05-2023, 12:10:46
    Author     : Zarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="X-UA-Compatible" content="ie=edge">
        <title>Sign Up </title>

        <!-- Font Icon -->
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <!-- Main css -->
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style1.css">
    </head>
    <body>
        <div class="main">
            <%String phoneNoti = (String)request.getAttribute("phoneNoti");%>
            <%String emailNoti = (String)request.getAttribute("emailNoti");%>
            <%String notification = (String)request.getAttribute("notification");%>
            <!-- Sign up form -->
            <section class="signup">
                <div class="container">
                    <div class="signup-content">
                        <div class="signup-form">
                            <h2 class="form-title">Sign up</h2>
                            <form action="register" method="POST" class="register-form" id="register-form">
                                <div class="form-group">
                                    <input type="text" name="fullName" id="name" placeholder="Your Name" required/>
                                </div>
                                <div class="form-group">
                                    <input type="email" name="email" id="email" placeholder="Your Email" required/>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="address" id="address" placeholder="Your Address" required>
                                </div>
                                <div class="form-group">
                                    <input type="text" name="phoneNum" id="phone-num" placeholder="Your Phone Number" required>
                                </div>
                                <c:if test="${emailNoti!=null}">
                                    <strong style="color: red;">${emailNoti}</strong>
                                </c:if>
                                <c:if test="${phoneNoti!=null}">
                                    <strong style="color: red;">${phoneNoti}</strong>
                                </c:if>
                                <c:if test="${notification!=null}">
                                    <strong style="color: red;">${notification}</strong>
                                </c:if>
                                <div class="form-group form-button">
                                    <input type="submit" name="signup" id="signup" class="form-submit" value="Register"/>
                                </div>
                            </form>
                            <div class="create-acc">
                                <a href="login.jsp" class="text1">Back to Log In</a>
                            </div>
                        </div>
                        <div class="signup-image">
                            <figure><img src="<%= request.getContextPath()%>/img/signup-image.jpg" alt="Register image"></figure>
                        </div>
                    </div>
                </div>
            </section>
            <!-- JS -->
            <script src="<%= request.getContextPath()%>/jquery/jquery.min.js"></script>
            <script src="<%= request.getContextPath()%>/js/main1.js"></script>
        </div>
    </body>
</html>
