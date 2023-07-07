<!DOCTYPE html>
<%@page import="Model.*"%>
<%@page import = "java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html lang="en">
    <head>
        <title>Support Dashboard</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>

            .row.content {
                height: 550px
            }

            .sidenav {
                background-color: #f1f1f1;
                height: 75%;
            }

            @media screen and (max-width: 767px) {
                .row.content {
                    height: auto;
                }
            }
        </style>
    </head>
    <body>

        <%
          List<FeedbackDashboard> lst = (List<FeedbackDashboard>) request.getAttribute("lst");  
  
        %>

        <div class="container-fluid">
            <div class="row content">
                <div class="col-sm-3 sidenav hidden-xs">
                    <h2>Gaming HUB</h2>
                    <ul class="nav nav-pills nav-stacked">
                        <li class="active"><a href="GetSupportDashboardInfo">Dashboard</a></li>
                        <li><a href="GetFeedbackList">Feedback List</a></li>
                        <li><a href="GetFeedbackReplyList">Feedback Reply List</a></li>
                    </ul><br>
                </div>
                <br>



                <div class="col-sm-9">
                    <div class="well">
                        <h4>Dashboard</h4>
                        <p> Gaming HUB feedback overview</p>
                    </div>       
                    <c:choose>
                        <c:when test="${not empty lst}">
                            <c:forEach var="dashboard" items="${lst}">

                                <div class="row">
                                    <div class="col-sm-3">
                                        <div class="well">
                                            <h4>Customer</h4>
                                            <p><c:out value="${dashboard.getTotalCustomer()}"/></p> 
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="well">
                                            <h4>Total feedback</h4>
                                            <p><c:out value="${dashboard.getTotalFeedback()}"/></p> 
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="well">
                                            <h4>Need handling</h4>
                                            <p><c:out value="${dashboard.getNotResolve()}"/></p> 
                                        </div>
                                    </div>
                                    <div class="col-sm-3">
                                        <div class="well">
                                            <h4>Avg. Rating</h4>
                                            <p><c:out value="${dashboard.getAverageRating()}"/></p> 
                                        </div>
                                    </div>
                                </div>


                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="6">Not found</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>



                    <div class="row">
                        <div class="col-sm-8">
                            <div class="well">
                                <p>Text</p> 
                            </div>
                        </div>
                        <div class="col-sm-4">
                            <div class="well">
                                <p>Text</p> 
                            </div>
                        </div>
                    </div>
                </div>
            </div>

    </body>
</html>