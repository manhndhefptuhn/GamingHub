<%-- 
    Document   : supportFeedbackList
    Created on : Jun 16, 2023, 10:52:37 AM
    Author     : admin
--%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta name="description" content="">
        <link rel="canonical" href="https://getbootstrap.com/docs/4.6/examples/dashboard/">
        <title>Feedback List</title>
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
                    <a class="nav-link" href="#">Support</a>
                </li>
            </ul>
        </nav>

        <div class="container-fluid">
            <div class="row">
                <nav id="sidebarMenu" class="col-md-3 col-lg-2 d-md-block bg-light sidebar collapse">
                    <div class="sidebar-sticky pt-3">
                        <ul class="nav flex-column">
                            <li class="nav-item">
                                <a class="nav-link active" href=""> <!-- User Profile -->
                                    <div>
                                        <img src="https://bootdey.com/img/Content/avatar/avatar7.png" width="100px" id="profile-pic"alt="User">
                                        <h1>Support</h1>
                                    </div>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="GetSupportDashboardInfo">
                                    <span data-feather="home"></span>
                                    Dashboard <span class="sr-only">(current)</span>
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="GetFeedbackList">
                                    <span data-feather="file"></span>
                                    Feedback List
                                </a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="GetFeedbackReplyList">
                                    <span data-feather="file-text"></span>
                                    Feedback Response List
                                </a>
                            </li>
                        </ul>
                    </div>
                </nav>
                <!--        sort feedback form-->
<!--                <div class="col-sm-9">
                    <div class="well">                                    
                        <form action="GetFeedbackList" method="post">
                            Sort Feedbacks:
                            <select name="sortFeedback" onchange="this.form.submit()">
                                <option value="default">Default</option>
                                <option value="ratingAsc">Rating (Low -> High)</option>
                                <option value="ratingDesc">Rating (High -> Low)</option>
                                <option value="NResolve">Not resolved</option>
                                <option value="resolve">Resolved</option>
                            </select>
                        </form>                   
                    </div>               
                </div>  -->
                <main role="main" class="col-md-9 ml-sm-auto col-lg-10 px-md-4">
                    <h2>Feedback List</h2>
                    <div class="search_bar">
                        <form id="customerListForm" method="POST" action="searchFeedback">
                            <input type="text" name="name" placeholder="Search...">
                            <button type="submit">Search</button>                        
                        </form>
                    </div>
                    <%
                      String xName = (String)request.getAttribute("search");
                    %>
                    <div class="table-responsive">
                        <c:if test="${not empty lst}">
                            <table class="table table-striped table-sm">
                                <thead>
                                    <tr>
                                        <th>Feedback ID </th>
                                        <th>User ID</th>
                                        <th>Create date</th>
                                        <th>Rating </th>
                                        <th>Status</th>
                                        <th>Content</th>                                   
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach var="lst" items="${lst}">
                                        <tr>
                                            <td>${lst.getFeedbackId()}</td>
                                            <td>${lst.getUserId()}</td>
                                            <td>${lst.getCreateDate()}</td>
                                            <td>${lst.getRating()}</td>
                                            <td>${lst.getStatus()}</td>
                                            <td>${lst.getContent()}</td>
                                            <td><a href="GetFeedbackDetails?id=${lst.getFeedbackId()}">View</a></td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:if>
                        <c:if test="${empty lst}">
                            <p>No feedback found.</p>
                        </c:if>
                    </div>
                </main>
            </div>
        </div>
    </body>
</html>


