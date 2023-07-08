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

        <title>Edit Slider</title>

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
                width: 500px;
                height: 300px;
                object-fit: cover;
                margin-bottom: 10px;
            }

            h2 {
                text-align: center;
                margin-bottom: 20px;
            }

            .btn-update {
                background-color: blue;
                color: white;
                padding: 10px 20px;
                border: none;
                
                cursor: pointer;
            }

        </style>

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
                <h2>Edit Slider</h2>
                <div class="form-container">
                    <form method="post" action="editSliderController" enctype="multipart/form-data">

                        <input type="hidden" name="sliderId" value="${slider.getSliderID()}" />

                        <label for="fullName">Title:</label>
                        <input type="text" id="title" name="title" value="${slider.getSliderTitle()}" /><br><br>

                        <label for="sliderPicture">Slider picture:</label>
                        <div class="upload-container">
            <!--                <img id="previewImage" src="${user.getProfile_picture()}" alt="Profile Picture" width="150" height="150">-->
                            <img id="previewImage" src="${slider.getSliderImage()}" alt="Slider Picture" width="150" height="150">
                            <input type="file" id="sliderPicture" name="sliderPicture" accept="image/*" onchange="previewSliderPicture(event)">
                        </div>
                        <br><br>

                        <script>
                            function previewSliderPicture(event) {
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

                        <label for="status">Backlink: </label>
                        <input type="text" id="backlink" name="backlink" value="${slider.getBacklink()}" /><br><br>

                        <label for="status">Note: </label>
                        <input type="text" id="note" name="note" value="${slider.getNote()}" /><br><br>

                        <label for="status">Status:</label>
                        <input type="text" id="status" name="status" value="${slider.isStatus()}" /><br><br>

                        <label for="RoleID">Updated By:</label>
                        <input type="int" id="updatedBy" name="updatedBy" value="${slider.getUpdatedBy()}" /><br><br>

                        <input type="submit" value="Update" class="btn-update"/>
                    </form>
                </div>
            </main>
        </div>
    </div>
</body>
</html>
