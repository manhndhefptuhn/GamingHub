<%--
    Document   : viewUserDetail
    Created on : 01-June-2023
    Author     : Viet
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Model.User" %>
<%@ page import="java.util.List" %>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <meta name="author" content="Mark Otto, Jacob Thornton, and Bootstrap contributors">
        <meta name="generator" content="Hugo 0.101.0">

        <title>User Details</title>

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
                    <h2>User Detail</h2>
                    <div class="col-md-10 main-content">
                        <!-- Search Form -->
                        <!--                        <form action="userSearchResultController" method="POST" class="search-form">
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
                                                </form>-->

                        <% List<User> userDetailList = (List<User>) request.getAttribute("userDetailList"); %>


                        <form action="userListController" method="POST">
                            <div class="user-details-container">
                                <c:choose>
                                    <c:when test="${not empty userDetailList}">
                                        <c:forEach var="userDetail" items="${userDetailList}">
                                            <table class="table">
                                                <tbody>
                                                    <tr>
                                                        <th>ID</th>
                                                        <td><c:out value="${userDetail.getUser_ID()}"/></td>
                                                    </tr>
                                                    <tr>
                                                        <th>Name</th>
                                                        <td><c:out value="${userDetail.getFullName()}"/></td>
                                                    </tr>
                                                    <tr>
                                                        <th>Email</th>
                                                        <td><c:out value="${userDetail.getEmail()}"/></td>
                                                    </tr>
                                                    <tr>
                                                        <th>Password</th>
                                                        <td><c:out value="${userDetail.getPassword()}"/></td>
                                                    </tr>

                                                    <tr>
                                                        <th>Profile Picture</th>
                                                        <td><img src="<%= request.getContextPath()%>/${userDetail.getProfile_picture()}" width="150" height="150"/></td>
                                                    </tr>
                                                    <tr>
                                                        <th>Phone Number</th>
                                                        <td><c:out value="${userDetail.getPhone_Number()}"/></td>
                                                    </tr>
                                                    <tr>
                                                        <th>Address</th>
                                                        <td><c:out value="${userDetail.getAddress()}"/></td>
                                                    </tr>
                                                    <tr>
                                                        <th>Status</th>
                                                        <td><c:out value="${userDetail.isStatus()}"/></td>
                                                    </tr>
                                                    <tr>
                                                        <th>Role ID</th>
                                                        <td>
                                                            <c:choose>
                                                                <c:when test="${not empty userDetail.getRole_ID()}">
                                                                    <%-- Thực hiện truy vấn SQL để lấy tên role từ bảng Role --%>
                                                                    <sql:setDataSource var="dataSource" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://your_database_url" user="your_username" password="your_password" />
                                                                    <sql:query dataSource="${dataSource}" var="roleInfo">
                                                                        SELECT role_name FROM Role WHERE role_id = ?
                                                                        <sql:param value="${userDetail.getRole_ID()}" />
                                                                    </sql:query>
                                                                    <c:if test="${roleInfo.rowCount > 0}">
                                                                        <c:out value="${roleInfo.rows[0].role_name}"/>
                                                                    </c:if>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    Unknown Role
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </c:forEach>
                                    </c:when>
                                </c:choose>
                            </div>
                        </form> <br>
                    </div>
                </main>
            </div>
        </div>
    </body>
</html>
