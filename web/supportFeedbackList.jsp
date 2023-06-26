<%-- 
    Document   : supportFeedbackList
    Created on : Jun 16, 2023, 10:52:37 AM
    Author     : admin
--%>
<%@page import="Model.*"%>
<%@page import = "java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  List<Feedback> lst = (List<Feedback>) request.getAttribute("lst");
%>



<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <style>
            .row.content {height: 550px}

            .sidenav {
              background-color: #f1f1f1;
              height: 75%;
            }

            @media screen and (max-width: 767px) {
              .row.content {height: auto;} 
            }
        </style>
        <title>Feedback List</title>
    </head>
    
    <body>         
    
<!--    uncomment to display header-->
<%--<%@include file="header.jsp" %>--%>
        
<!--        side navigation-->
        <div class="container-fluid">
           <div class="row content">    
                
            <div class="col-sm-3 sidenav hidden-xs">
                <h2>Gaming HUB</h2>
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="GetSupportDashboardInfo">Dashboard</a></li>
                    <li class="active"><a href="GetFeedbackList">Feedback List</a></li>
                    <li><a href="GetFeedbackReplyList">Feedback Reply List</a></li>
                </ul><br>
            </div>
            
             
             <!--        search feedback with name -->
            <div class="col-sm-9">
               <div class="well">                                     
                    <form action="searchFeedback" method="POST">
                        <p>Search Feedback: <input type="text" name="name" value=""/> <input type="submit" value="Search"> 
                    </form>
               </div>               
            </div>  
             
             
             <!--        sort feedback form-->
            <div class="col-sm-9">
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
            </div>  
               
             
             
             <!--        display feedback list-->
            <div class="col-sm-9">            
                    <table class="TableofFeedback" border="1">
                        <thead>
                            <tr>
                                <th scope="col"> Feedback ID </th>
                                <th scope="col"> User ID </th>
                                <th scope="col"> Create date </th>
                                <th scope="col"> Rating </th>
                                <th scope="col"> Status </th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                            if(lst.isEmpty()){
                                out.println("no list");
                                }else{
                            if(!lst.isEmpty()){
                            %>
                            <%
                                for(Feedback x: lst) {
                            %>
                            <tr class="box">
        <!--                        get the feedback ID for getting details-->
                                <td><a href="GetFeedbackDetails?id=<%= x.getFeedbackId() %>"> <%= x.getFeedbackId() %></a></td>
                                <td><%=x.getUserId()%></td>
                                <td><%=x.getCreateDate()%></td>
                                <td><%=x.getRating()%></td>
                                <td><%=x.getStatus()%></td>                                                
                            </tr>
                            <% } %>  
                            <% } else {%> 
                        <h2>No products found</h2>
                        <% }
                            } %> 
                        </tbody>
                    </table>               
            </div>
             
                        
                        
           </div>
        </div>              
    </body>
</html>


