<%-- 
    Document   : supportFeedbackDetails
    Created on : Jun 16, 2023, 10:53:07 AM
    Author     : admin
--%>



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
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
        <title>Feedback Details</title>
    </head>
    
    <style>
            .form-popup {
                display: none;
                position: fixed;
                top: 50%;
                left: 50%;
                border: 3px solid #f1f1f1;
                border-radius: 15px;
                text-align: center;
            }
        
            .delete {
                text-align: center;
                display: none;
                position: fixed;
                z-index: 1;
                padding-top: 100px;
                left: 0;
                top: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.4);
            }
    </style>
    <body>
        
        <!--    uncomment to display header-->
        <%@include file="header.jsp" %>
        
        <!--display feedback details-->
        <h1>Feedback Details</h1>
                          
                    <%
                        if(feedbackDetails.isEmpty()){
                            out.println("No Feedback Found");
                        }
                        else{
                            if(!feedbackDetails.isEmpty()){
                    %>
                
                            <%
                                for(Feedback x: feedbackDetails) {
                            %>
                    
                                    <tr>
                                        <td>Feedback ID: <%= x.getFeedbackId()%></td></br>
                                        <td><a href="productDetail?productID=<%= x.getProductId() %>">Product ID: <%=x.getProductId()%></a></td></br>
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
                <h3>Previous reply</h3>
<%
                        if(feedbackRep.isEmpty()){
%>
                            <h3>Add reply</h3>
                            <form method="post" action="SetFeedbackReply">  
                                <input type="text" name="reply" required>
                                <input type="hidden" name="feedbackId" value ="<%=feedbackDetails.get(0).getFeedbackId()%>">
                                <input type="hidden" name="userId" value ="<%=feedbackDetails.get(0).getUserId()%>">            
                                <br><br>
                                <input type="submit" value="Reply">
                            </form>
<%                          
                        }
                        else{
                            if(!feedbackRep.isEmpty()){
%>              
<%
                                for(FeedbackReply x: feedbackRep) {
%>
                                    <p><%=x.getResponseContent()%></p>
                                                                                   
                                    <!-- Delete confirmation-->
                                       
                                    <a href="supportDeleteFeedbackResponse?responseId=<%= x.getResponseId() %>" onclick="return confirm('Delete this response?');">Delete</a>
                                    <br>
                                        
<%  
                                }                            
%>                             
<% 
                            }
%>                        

                            <h3>Add more reply</h3>
                            <form method="post" action="SetFeedbackReply">  
                                <input type="text" name="reply" required>
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
                        <h3>Reply</h3>
                        <form method="post" action="SetFeedbackReply">  
                            <input type="text" name="reply" required>
                            <input type="hidden" name="feedbackId" value ="<%=feedbackDetails.get(0).getFeedbackId()%>">
                            <input type="hidden" name="userId" value ="<%=feedbackDetails.get(0).getUserId()%>">            
                            <br><br>
                            <input type="submit" value="Reply">
                        </form>
        
       <% }
        %>     
            
        

        
        
        
        
    </body>
</html>
