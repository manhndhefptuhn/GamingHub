<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ page import="Model.User" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.101.0">

        <title>User Search Results</title>

        <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/dashboard/">

        <!-- Bootstrap core CSS -->
        <link href="<%= request.getContextPath()%>/css/bootstrap.min.css" rel="stylesheet">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/dashboard.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style3.css">
        <style>
            h2 {
                text-align: center; /* Đặt căn chỉnh văn bản của h2 thành center */
            }
        </style>
        <link href="<%= request.getContextPath()%>/css/dashboard.css" rel="stylesheet">
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                padding: 8px;
                text-align: left;
                border: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
            }
        </style>
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

        <%-- Check if user list is not empty --%>
        <% if (request.getAttribute("userSearchResultList") != null) {
            List<User> userSearchResultList = (List<User>) request.getAttribute("userSearchResultList");
        %>

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
                    <h2>Search Result</h2>
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

                        <%-- Display the table --%>
                        <table>
                            <thead>
                                <tr>
                                    <th>User ID</th>
                                    <th>Full Name</th>
                                    <th>Email</th>
                                    <th>Phone Number</th>
                                </tr>
                            </thead>

                            <tbody>
                                <%-- Iterate over the user list and display user information in table rows --%>
                                <% for (User user : userSearchResultList) { %>
                                <tr>
                                    <td><%= user.getUser_ID() %></td>
                                    <td><%= user.getFullName() %></td>
                                    <td><%= user.getEmail() %></td>
                                    <td><%= user.getPhone_Number() %></td>
                                </tr>
                                <% } %>
                            </tbody>
                        </table>
                        <% } else { %>
                        <p>No users found.</p>
                        <% } %>
                    </div>
                </main>
            </div>
        </div>
    </body>
</html>
