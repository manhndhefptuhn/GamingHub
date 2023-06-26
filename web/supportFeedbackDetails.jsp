<%-- 
    Document   : supportFeedbackDetails
    Created on : Jun 16, 2023, 10:53:07 AM
    Author     : admin
--%>


<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Model.Feedback" %>
<%@ page import="Model.User" %>
<%@ page import="Model.FeedbackReply" %>
<%@ page import="java.util.List" %>


<%
  List<Feedback> feedbackDetails = (List<Feedback>) request.getAttribute("details");
%>
<%
  User u = (User) request.getAttribute("userDetails");
%> 
<%
  List<FeedbackReply> feedbackRep = (List<FeedbackReply>) request.getAttribute("fbrlst");
%>

<html>
    <head>
        <title>Feedback Details</title>
    </head>
    <body>
        
<!--    uncomment to display header-->
<%--<%@include file="header.jsp" %>--%>
        


<!--        display feedback details-->
        <h1>Feedback Details</h1>
                          
                    <%
                        if(feedbackDetails.isEmpty()){
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
                                        <td><a href="ProductDetailController?productID=<%= x.getProductId() %>">Product ID: <%=x.getProductId()%></a></td></br>
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
                        <% }else{%> 
                <h2>No feedback found</h2>
                        <% }
                        } %>        
        <br>
    
        
        
        

<%
            if(feedbackDetails.get(0).getStatus()){               
%>
<!-- feedback status = true, displaying replies and edit/delete/ add reply -->
                <br>
                <br>
                <h4>Previous reply</h4>
<%
                        if(feedbackRep.isEmpty()){
                            out.println("no");
                        }
                        else{
                            if(!feedbackRep.isEmpty()){
%>              
<%
                                for(FeedbackReply x: feedbackRep) {
%>
                                    <p>      <%=x.getResponseContent()%></p>
                                    <a href="supportEditFeedbackResponse?responseId=<%= x.getResponseId() %>">edit</a><br>
                                    <a href="supportDeleteFeedbackResponse?responseId=<%= x.getResponseId() %>">delete</a><br>
<% 
                                }                            
%>                             
<% 
                            }
%>                        

                            <h5>Add more reply</h5>
                            <form method="post" action="SetFeedbackReply">  
                                <input type="text" name="reply">
                                <input type="hidden" name="feedbackId" value ="<%=feedbackDetails.get(0).getFeedbackId()%>">
                                <input type="hidden" name="userId" value ="<%=feedbackDetails.get(0).getUserId()%>">            
                                <br><br>
                                <input type="submit" value="Reply">
                            </form>

<%
                        }
%>
       


<%        
            }
            else{
%>
<!-- status feedback = false, displaying a form to get reply-->
        <h5>Reply</h5>
        <form method="post" action="SetFeedbackReply">  
            <input type="text" name="reply">
            <input type="hidden" name="feedbackId" value ="<%=feedbackDetails.get(0).getFeedbackId()%>">
            <input type="hidden" name="userId" value ="<%=feedbackDetails.get(0).getUserId()%>">            
            <br><br>
            <input type="submit" value="Reply">
        </form>
        
       <% }
        %>
        
        
    </body>
</html>
