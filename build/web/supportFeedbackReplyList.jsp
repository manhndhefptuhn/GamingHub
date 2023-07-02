<%-- 
    Document   : supportFeedbackReplyList
    Created on : Jun 22, 2023, 10:47:33 PM
    Author     : admin
--%>
<%@page import="Model.*"%>
<%@page import = "java.util.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
  List<FeedbackReply> lst = (List<FeedbackReply>) request.getAttribute("lst");
  String xName = (String)request.getAttribute("search");
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
        
        <title>Support Reply</title>
    </head>
    <body>
    <%@include file="header.jsp" %>   

        <div class="container-fluid">
          <div class="row content"> 
              
              
            <!--        side nav--> 
            <div class="col-sm-3 sidenav hidden-xs">
                <h2>Gaming HUB</h2>
                <ul class="nav nav-pills nav-stacked">
                    <li><a href="GetSupportDashboardInfo">Dashboard</a></li>
                    <li><a href="GetFeedbackList">Feedback List</a></li>
                    <li class="active"><a href="GetFeedbackReplyList">Feedback Reply List</a></li>
                </ul><br>
            </div>
           
             <!--        search feedback with name -->
            <div class="col-sm-9">
               <div class="well">                                     
                    <form action="searchResponse" method="POST">
                        <p>Search Feedback Response: <input type="text" name="name" value=""/> <input type="submit" value="Search"> 
                    </form>
               </div>               
            </div>
            
            <!--       Reply table-->
            <div class="col-sm-9">                  
                <table class="TableofFeedback" border="1">
                    <br>
                    <thead>
                        <tr>
                            <th scope="col"> Response ID </th>
                            <th scope="col"> Feedback ID </th>
                            <th scope="col"> User ID </th>
                            <th scope="col"> Response Date </th>
                            <th scope="col"> Response Content </th>
                        </tr>
                    </thead>
                    <tbody>
                        
                        <%
                            if(xName != null){
                        %>                          
                            <h2>Searched results for "<%= xName%>"</h2>
                        <%
                            }
                        %>
                        
                        <%
                        if(lst.isEmpty()){
                            out.println("No feedback found");
                            }else{
                        if(!lst.isEmpty()){
                        %>
                        
                            
                        
                        <%
                            for(FeedbackReply x: lst) {
                        %>
                        <tr class="box">
    <!--                        get the feedback ID for getting details-->
                            <td><a href="GetFeedbackDetails?id=<%= x.getFeedbackId() %>"><%=x.getResponseId()%></a></td>
                            <td><%=x.getFeedbackId()%></td>
                            <td><%=x.getUserId()%></td>
                            <td><%=x.getResponseDate()%></td>
                            <td><%=x.getResponseContent()%></td>                                                
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
