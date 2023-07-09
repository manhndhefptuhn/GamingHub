<%-- 
    Document   : AdminUserList
    Created on : Jun 9, 2023, 10:59:06 AM
    Author     : User
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Model.User" %>
<%@ page import="java.util.List" %>
<% List<User> userList = (List<User>) request.getAttribute("userList"); %>
<!doctype html>
<html lang="en">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.101.0">
        <title>Admin UserList</title>

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


        <!-- Custom styles for this template -->
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
                                <a class="nav-link" href="AdminUserList.jsp">
                                    <span data-feather="file"></span>
                                    User List
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="AdminSettingList.jsp">
                                    <span data-feather="settings"></span>
                                    Setting List
                                </a>
                            </li>


                        </ul>

                    </div>
                </nav>

                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
                    <h2>User List</h2>
                    <div class="col-md-10 main-content">
                        <!-- Search Form -->
                        <form action="userSearchResultController" method="POST" class="search-form">
                            <div class="form-group search-group d-flex">
                                <input type="text" name="searchID" id="searchID" class="form-control search-input mr-2"
                                       placeholder="Enter ID">
                                <input type="text" name="searchFullName" id="searchFullName" class="form-control search-input mr-2"
                                       placeholder="Enter Full name">
                                <input type="text" name="searchEmail" id="searchEmail" class="form-control search-input mr-2"
                                       placeholder="Enter Email">
                                <input type="text" name="searchPhoneNumber" id="searchPhoneNumber" class="form-control search-input mr-2"
                                       placeholder="Enter Phone Number">
                                <input type="text" name="searchAddress" id="searchAddress" class="form-control search-input mr-2"
                                       placeholder="Enter Address">
                                <button type="submit" class="btn btn-primary search-button">Search</button>
                            </div>
                        </form>


                        <!-- User Table -->
                        <table class="table">
                            <!-- Table content... -->
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Phone Number</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                            <c:choose>
                                <c:when test="${not empty userList}">
                                    <c:forEach var="user" items="${userList}">
                                        <tr>
                                            <td><c:out value="${user.getUser_ID()}"/></td>
                                        <td><c:out value="${user.getFullName()}"/></td>
                                        <td><c:out value="${user.getEmail()}"/></td>
                                        <td><c:out value="${user.getPhone_Number()}"/></td>
                                        <td><c:out value="${user.isStatus()}"/></td>
                                        <td>
                                            <a href="userDetailServlet?id=<c:out value="${user.getUser_ID()}" />View</a> |
                                            <a href="editUserController?id=<c:out value="${user.getUser_ID()}" />Edit</a>
                                        </td>
                                        </tr>
                                    </c:forEach>
                                </c:when>
                                <c:otherwise>
                                    <tr>
                                        <td colspan="6">No users found</td>
                                    </tr>
                                </c:otherwise>
                            </c:choose>
                            </tbody>
                        </table>
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


