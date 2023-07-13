<%-- 
    Document   : SupportFeedbackListGood
    Created on : 09-07-2023, 21:24:02
    Author     : Zarius
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Model.Feedback" %>
<%@ page import="Model.User" %>
<%@ page import="Model.FeedbackResponse" %>
<%@ page import="java.util.List" %>
<%
  List<Feedback> feedbackDetails = (List<Feedback>) request.getAttribute("details");
%>
<%
  User u = (User) request.getAttribute("userDetails");
%> 
<%
  List<FeedbackResponse> feedbackRep = (List<FeedbackResponse>) request.getAttribute("fbrlst");
%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Support Feedback List</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="<%= request.getContextPath()%>/css/styles.css" rel="stylesheet" />
        <link rel="stylesheet" href="fonts/material-icon/css/material-design-iconic-font.min.css">
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="SupportNavigation.jsp" %>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    
                    <div class="flex-container" style ="display: flex; flex-direction: row;">
                        <div style=" margin: 30px; padding: 15px; flex-grow:0.5;">
                            <h2>Feedback Details</h2>
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

                                            <p>Feedback ID: <%= x.getFeedbackId()%></p>
                                            <p><a href="productDetail?productID=<%= x.getProductId() %>" style="text-decoration: none; color: black">Product ID: <%=x.getProductId()%></a></p>
                                            <p>User Name: <%=u.getFullName()%></p>
                                            <p>User Contact: <%=u.getEmail()%></p>
                                            <p>Create date: <%=x.getCreateDate()%></p>
                                            <p>Content: <%=x.getContent()%></p>                               
                                            <p>Rating: <%=x.getRating()%></p>
                                            <p>Status: <%=x.getStatus()%></p>
                                            <p>Picture: <img src="<%= request.getContextPath()%>/<%=x.getImage()%>" width="150" height="150"/></p>
                                    <% }}}%>   
                        </div> 
                        
                        
                        
                        <div style=" margin: 30px; padding: 15px;">
                            
                                <h3>Add reply</h3>
                                <form method="post" id="response" action="SetFeedbackReply">  
                                    <input type="text" name="reply" placeholder="Enter response..." style=" height: 40px; width:280px;" required>                              
                                    <input type="hidden" name="feedbackId" value ="<%=feedbackDetails.get(0).getFeedbackId()%>">
                                    <input type="hidden" name="userId" value ="<%=feedbackDetails.get(0).getUserId()%>">            
                                    <br>
                                    <br><input type="submit" value="Reply">
                                </form>
                                <br>
                            

                                   
                            <h3>Previous reply</h3>
                                    <%
                                        if(!feedbackRep.isEmpty()){
                                    %>              
                                    <%
                                            for(FeedbackResponse x: feedbackRep) {
                                    %>
                                                <a><%=x.getResponseContent()%></a>

                                                <!-- Delete confirmation-->
                                                <a href="supportDeleteFeedbackResponse?responseId=<%= x.getResponseID() %>" style="color: red" onclick="return confirm('Delete this response?');">   Delete</a>
                                                <br>

                                        <%  
                                            } }                           
                                        %>  
                                       
                       
                        </div>
                    </div>
        
                </div>            
            </main>
            <footer class="py-4 bg-light mt-auto">
                <div class="container-fluid px-4">
                    <div class="d-flex align-items-center justify-content-between small">
                        <div class="text-muted">Copyright &copy; Gaming Hub 2023</div>
                    </div>
                </div>
            </footer>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="<%= request.getContextPath()%>/js/scripts1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="<%= request.getContextPath()%>/js/datatables-simple-demo1.js"></script>
</body>
</html>
