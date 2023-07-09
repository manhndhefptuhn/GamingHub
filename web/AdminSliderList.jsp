<%-- 
    Document   : AdminSliderList
    Created on : 09-07-2023, 08:46:31
    Author     : Zarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <title>Admin Slider List</title>
        <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/dashboard/">
        <!-- Bootstrap core CSS -->
        <link href="<%= request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/dashboard.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style3.css">
        <style>
            .bd-placeholder-img {
                font-size: 1.125rem;
                text-anchor: middle;
                -webkit-user-select: none;
                -moz-user-select: none;
                -ms-user-select: none;
                user-select: none;
            }

            @media (min-width: 768px) {
                .bd-placeholder-img-lg {
                    font-size: 3.5rem;
                }
            }
        </style>
    </head>
    <body>

        <nav class="navbar navbar-dark sticky-top bg-dark flex-md-nowrap p-0 shadow">
            <a class="navbar-brand col-md-3 col-lg-2 mr-0 px-3" href="home"></a>
            <button class="navbar-toggler position-absolute d-md-none collapsed" type="button" data-toggle="collapse" data-target="#sidebarMenu" aria-controls="sidebarMenu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <ul class="navbar-nav px-3" >
                <li class="nav-item text-nowrap">
                    <a class="nav-link" href="userProfile">Admin</a>
                </li>
            </ul>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
                    <div class="sidebar-sticky pt-3">
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link active" href="userProfile"> <!-- User Profile -->
                                    <div>
                                        <img src="https://bootdey.com/img/Content/avatar/avatar7.png" width="100px" id="profile-pic"alt="User">
                                        <h1>Admin</h1>
                                    </div>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#"><span data-feather="home"></span>Dashboard</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="userListController"><span data-feather="file"></span>User List</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="sliderList"><span data-feather="settings"></span>Slider List</a>
                            </li>
                        </ul>
                    </div>
                </nav>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
                    <h2 style="text-align:center;">Slider List</h2>
                    <form action="searchSliderController" method="GET" class="search-form">
                        <div class="form-group search-group d-flex">
                            <input type="text" name="searchID" id="searchID" class="form-control search-input mr-2 search-box"
                                   placeholder="Enter ID">
                            <button type="submit" class="btn btn-primary search-button">Search</button>
                        </div>
                    </form>
                    <c:if test="${notification != null}">
                        <div>
                            <strong style="color: red;">${notification}</strong>
                        </div>
                    </c:if>
                    <div class="table-responsive">
                        <c:choose>
                            <c:when test="${not empty sliderList}">
                                <table class="table table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <th>ID</th>
                                            <th>Title</th>
                                            <th>Image</th>
                                            <th>Status</th>
                                            <th>Actions</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="slider" items="${sliderList}">
                                            <tr>
                                                <td><c:out value="${slider.getSliderID()}"/></td>
                                                <td><c:out value="${slider.getSliderTitle()}"/></td>
                                                <td><img src="<%= request.getContextPath()%>/${slider.getSliderImage()}" width="200" height="200"/></td>
                                                <td><c:out value="${slider.isStatus()}"/></td>
                                                <td>
                                                    <a href="sliderDetail?id=<c:out value="${slider.getSliderID()}" />">View</a> |
                                                    <a href="deleteSlider?id=<c:out value="${slider.getSliderID()}" />">Delete</a> 
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </tbody>
                                </table>
                            </c:when>
                            <c:otherwise>
                                <table class="table table-striped table-sm">
                                    <thead>
                                        <tr>
                                            <td colspan="6">No sliders found</td>
                                        </tr>
                                    </thead>
                                </table>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </main>
            </div>
        </div>


        <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
        <script>window.jQuery || document.write('<script src="<%= request.getContextPath()%>/assets/js/vendor/jquery.slim.min.js"><\/script>')</script><script src="<%= request.getContextPath()%>/assets/dist/js/bootstrap.bundle.min.js"></script>


        <script src="https://cdn.jsdelivr.net/npm/feather-icons@4.28.0/dist/feather.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/chart.js@2.9.4/dist/Chart.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/dashboard.js"></script>
    </body>
</html>
