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
              height: 50%;
            }

            @media screen and (max-width: 767px) {
              .row.content {height: auto;} 
            }
        </style>
        <title>Feedback List</title>
    </head>
    
    <body>     
        <%@include file="header.jsp" %>
    
        
<!--        side navigation-->
        <div class="container-fluid">
         <div class="row content">    
           <div class="col-sm-3 sidenav hidden-xs">
             <h2>Gaming HUB</h2>
             <ul class="nav nav-pills nav-stacked">
               <li><a href="supportDashboard.jsp">Dashboard</a></li>
               <li class="active"><a href="GetFeedbackList">Feedback List</a></li>
             </ul><br>
           </div>
         </div>
        </div>
        
<!--        search feedback with name-->
        <form action="searchFeedback" method="POST">
            <p>Search Feedback: <input type="text" name="name" value=""/> <input type="submit" value="Search"> 
        </form>  
        
        

<!--        sort feedback form-->
        <form action="GetFeedbackList" method="post">
            Sort Feedbacks:
            <select name="sortFeedback">
                    <option value="default">Default</option>
                    <option value="ratingAsc">Rating (Low -> High)</option>
                    <option value="ratingDesc">Rating (High -> Low)</option>
                    <option value="NResolve">Not resolved</option>
                    <option value="resolve">Resolved</option>
            </select>
            <input type="submit" value="Sort"/>
        </form>       
        <br/><br/>
            
        
        
<!--        display feedback list-->
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
                    if(lst == null){
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
        
    </body>
</html>


