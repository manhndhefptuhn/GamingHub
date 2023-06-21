<%-- 
    Document   : supportFeedbackDetails
    Created on : Jun 16, 2023, 10:53:07 AM
    Author     : admin
--%>


<%--<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%@ page import="Model.Feedback" %>
<%@ page import="Model.User" %>
<%@ page import="java.util.List" %>


<%
  List<Feedback> feedbackDetails = (List<Feedback>) request.getAttribute("details");
%>
<%
  User u = (User) request.getAttribute("userDetails");
%> 
<html>
    <head>
        <title>Feedback Details</title>
    </head>
    <body>
        <%@include file="header.jsp" %>
        <h1>Feedback Details</h1>


                           
                    <%
                        if(feedbackDetails == null){
                            out.println("no");
                        }
                        else{
                            if(!feedbackDetails.isEmpty()){
                    %>
                
                            <%
                                for(Feedback x: feedbackDetails) {
                            %>
                    
                                    <tr>
                                        <td>Feedback ID: <%= x.getFeedbackId()%></td></br>
                                        <td>Product ID: <%=x.getProductId()%></td></br>
                                        <td>User ID: <%=x.getUserId()%></td></br>
                                        <td>User Name: <%=u.getFullName()%></td></br>
                                        <td>User Contact: <%=u.getEmail()%></td></br>
                                        <td>Create date: <%=x.getCreateDate()%></td></br>
                                        <td>Content: <%=x.getContent()%></td></br>
                                        <td>Picture: <%=x.getImage()%></td></br>
                                        <td>Rating: <%=x.getRating()%></td></br>
                                        <td>Status: <%=x.getStatus()%></td></br>
                                    </tr>
                            <% } %>  
                    <% } else {%> 
                <h2>No products found</h2>
                <% }
                    } %> 
        <br>      
    </body>
</html>
