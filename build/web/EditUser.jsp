<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.101.0">

        <title>Edit User Information</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/dashboard/">

        <!-- Bootstrap core CSS -->
        <link href="<%= request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/dashboard.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style3.css">
        <style>
            .form-container {
                display: flex;
                flex-direction: column;
                align-items: center;
                justify-content: center;
                padding: 20px;
            }

            .form-container label {
                display: block;
                margin-bottom: 10px;
            }

            .form-container input[type="text"],
            .form-container input[type="file"],
            .form-container input[type="submit"] {
                width: 300px;
                padding: 5px;
                margin-bottom: 10px;
                
            }

            .upload-container {
                display: flex;
                align-items: center;
                justify-content: center;
                flex-direction: column;
                margin-bottom: 10px;
                gap: 10px;
            }

            #previewImage {
                width: 150px;
                height: 150px;
                object-fit: cover;
                margin-bottom: 10px;
            }

            h2 {
                text-align: center;
                margin-bottom: 20px;
            }
        </style>
        <link href="<%= request.getContextPath()%>/css/dashboard.css" rel="stylesheet">
    </head>
    <body>
        <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
            <a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="#"></a>
            <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse" data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <ul class="navbar-nav px-3" >
                <li class="nav-item text-nowrap">
                    <a class="nav-link" href="#">Admin</a>
                </li>
            </ul>
        </nav>

        <div class="container-fluid">
            <div class="row"> 
                <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
                    <div class="sidebar-sticky pt-3">
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">
                                    <div>
                                        <img src="https://bootdey.com/img/Content/avatar/avatar7.png" width="100px" id="profile-pic"alt="User">
                                        <h1>Admin</h1>
                                    </div>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">
                                    <span data-feather="home"></span>
                                    Dashboard <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="userListController">
                                    <span data-feather="file"></span>
                                    User List
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="viewSliderController">
                                    <span data-feather="settings"></span>
                                    Slider List
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
                    <h2>Edit User Information</h2>

                    <div class="form-container">
                        <form method="post" action="updateUserController" enctype="multipart/form-data">
                            <input type="hidden" name="userId" value="${user.getUser_ID()}" />
                            <table>
                                <tr>
                                    <td><label for="fullName">Full Name:</label></td>
                                    <td><input type="text" id="fullName" name="fullName" value="${user.getFullName()}" /></td>
                                </tr>
                                <tr>
                                    <td><label for="email">Email:</label></td>
                                    <td><input type="text" id="email" name="email" value="${user.getEmail()}" /></td>
                                </tr>

                                <tr>
                                    <td><label for="password">Password:</label></td>
                                    <td><input type="text" id="password" name="password" value="${user.getPassword()}" /></td>
                                </tr>
                                
                                <tr>
                                    <td><label for="profilePicture">Profile picture:</label></td>
                                    <td>
                                        <div class="upload-container">
                                            <img id="previewImage" src="${user.getProfile_picture()}" alt="Profile Picture" width="150" height="150">
                                            <input type="file" id="profilePicture" name="profilePicture" accept="image/*" onchange="previewProfilePicture(event)">
                                        </div>
                                    </td>
                                </tr>
                                
                                <script>
                                function previewProfilePicture(event) {
                                    var input = event.target;
                                    var preview = document.getElementById('previewImage');

                                    if (input.files && input.files[0]) {
                                        var reader = new FileReader();

                                        reader.onload = function (e) {
                                            preview.src = e.target.result;
                                        };

                                        reader.readAsDataURL(input.files[0]);
                                    }
                                }
                                </script>
                                
                                <tr>
                                    <td><label for="phoneNumber">Phone Number:</label></td>
                                    <td><input type="text" id="phoneNumber" name="phoneNumber" value="${user.getPhone_Number()}" /></td>
                                </tr>
                                <tr>
                                    <td><label for="address">Address:</label></td>
                                    <td><input type="text" id="address" name="address" value="${user.getAddress()}" /></td>
                                </tr>
                                <tr>
                                    <td><label for="status">Status:</label></td>
                                    <td><input type="text" id="status" name="status" value="${user.isStatus()}" /></td>
                                </tr>
                                <tr>
                                    <td><label for="roleID">Role ID:</label></td>
                                    <td><input type="number" id="roleID" name="roleID" value="${user.getRole_ID()}" /></td>
                                </tr>
                            </table>
                            <input type="submit" value="Update" />
                        </form>
                    </div>
                </main>
            </div>
        </div>
    </body>
</html>