<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%-- 
    Document   : userProfile
    Created on : 30-05-2023, 07:39:20
    Author     : Zarius
--%>

<%@page import="DAL.RoleDAO"%>
<%@page import="Model.User"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Profile</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style2.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/scss/extra/userProfile.scss">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/js/">
    </head>
    <body>
        <style>
            .user-avatar {
                position: relative;
                overflow: hidden;
            }

            .user-avatar img {
                width: 90px;
                height: 90px;
                -webkit-border-radius: 100px;
                -moz-border-radius: 100px;
                border-radius: 100px;
                transition: filter 0.3s ease;
            }

            .user-avatar:hover img {
                filter: blur(4px);
            }

            .avatar-overlay {
                position: absolute;
                top: 50%;
                left: 50%;
                transform: translate(-50%, -50%);
                width: 90px;
                height: 90px;
                background-color: rgba(0, 0, 0, 0.5);
                color: white;
                font-size: 16px;
                text-align: center;
                display: flex;
                align-items: center;
                justify-content: center;
                opacity: 0;
                border-radius: 100px;
                transition: filter 0.3s ease;
                -webkit-border-radius: 100px;
                -moz-border-radius: 100px;
            }

            .user-avatar:hover .avatar-overlay {
                opacity: 1;
                cursor: pointer;
            }
        </style>
        <%  User u = (User)session.getAttribute("user");
            String userRole = (String)request.getAttribute("userRole");%>
        <form action="updateUserProfile" method="POST" enctype="multipart/form-data">
            <div class="container">
                <input type="hidden" name="userID" value="${sessionScope.user.getUser_ID()}">
                <div class="row gutters">
                    <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="account-settings">
                                    <div class="user-profile">
                                        <div class="user-avatar">
                                            <c:choose>
                                                <c:when test="${sessionScope.user.getProfile_picture() == null}">
                                                    <img src="<%= request.getContextPath()%>/img/default-avatar.png" alt="Avatar" id="avatar-img" onclick="openFileInput()">
                                                </c:when>
                                                <c:otherwise>
                                                    <img src="<%= request.getContextPath()%>/${sessionScope.user.getProfile_picture()}" alt="Avatar" id="avatar-img" class="avatar" onclick="openFileInput()">
                                                </c:otherwise>
                                            </c:choose>
                                            <input type="file" accept="image/jpeg, image/png, image/jpg" name="image" id="input-img" style="display: none;">
                                            <div class="avatar-overlay" onclick="openFileInput()">Change Avatar</div>
                                        </div>
                                        <h5 class="user-name">${sessionScope.user.getFullName()}</h5>
                                        <h6 class="user-email">${sessionScope.user.getEmail()}</h6>
                                    </div>
                                    <div class="about">
                                        <h5>Role</h5>
                                        <p><%=userRole%></p>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                        <div class="card h-100">
                            <div class="card-body">
                                <div class="row gutters">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="fullName">Full Name</label>
                                            <input type="text" class="form-control" name="fullName" id="fullName" placeholder="Enter full name" value="${sessionScope.user.getFullName()}" required>
                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="phone">Phone</label>
                                            <input type="text" class="form-control" name="phone" id="phone" pattern="[0-9]{10}" placeholder="Enter phone number" value="${sessionScope.user.getPhone_Number()}" required>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="text">Address</label>
                                            <input type="text" class="form-control" name="address" id="address" placeholder=" Address" value="${sessionScope.user.getAddress()}" required>
                                        </div>
                                    </div>
                                </div>
                                <div class="row gutters">
                                </div>
                                <%String notification = (String)request.getAttribute("notification");%>
                                <c:if test="${notification != null}">
                                    <strong style="color:red;">${notification}</strong>
                                </c:if>
                                <div class="row gutters">
                                    <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                        <div class="text-right">
                                            <input type="submit" id="update" name="update" value="Update" class="btn btn-primary">
                                            <input type="submit" id="changepass" name="changePass" value="Change Password" class="btn btn-primary">
                                            <input type="submit" id="backtohome" name="backToHome" value="Back to Homepage" class="btn btn-dark">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
        <script>
            function openFileInput() {
                const fileInput = document.getElementById("input-img");
                fileInput.click();
            }

            function handleFileSelect(event) {
                const file = event.target.files[0];
                const reader = new FileReader();

                reader.onload = function (e) {
                    const avatarImg = document.getElementById("avatar-img");
                    avatarImg.src = e.target.result;
                };

                reader.readAsDataURL(file);
            }

            const fileInput = document.getElementById("input-img");
            fileInput.addEventListener("change", handleFileSelect);
        </script>
    </body>

</html>
