<%-- 
Document   : SupportFeedbackListGood
Created on : 09-07-2023, 21:24:02
Author     : Zarius
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Support Feedback Detail</title>
        <link rel="icon" type="image/png" href="<%= request.getContextPath()%>/img/shop/logo1.png"/>
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
                    <h1 class="mt-4">Feedback Detail</h1>
                    <div class="row">
                        <div class="col-lg-8">
                            <c:if test="${notification != null}">
                                <div>
                                    <strong style="color: red;">${notification}</strong>
                                </div>
                            </c:if>
                            <c:set var="u" value="${requestScope.userDetails}" />
                            <c:set var="p" value="${requestScope.p}" />
                            <c:set var="feedbackDetail" value="${requestScope.feedbackDetail}" />
                            <p>Feedback ID: ${feedbackDetail.getFeedbackId()}</p>
                            <p><a href="productDetail?productID=${p.getProductID()}" style="text-decoration: none; color: black">Product: ${p.getProductName()}</a></p>
                            <p>User Name: ${u.getFullName()}</p>
                            <p>User Contact: ${u.getEmail()}</p>
                            <p>Create date: ${feedbackDetail.getCreateDate()}</p>
                            <p>Content: ${feedbackDetail.getContent()}</p>                               
                            <p>Rating: ${feedbackDetail.getRating()}</p>
                            <p>Status: ${feedbackDetail.getStatus() ? 'Active' : 'Deactive'}</p>
                            <p>Picture: <img src="<%= request.getContextPath()%>/${feedbackDetail.getImage()}" width="150" height="150"/></p>
                        </div> 
                        <div class="col-lg-4">
                            <h3>Add reply</h3>
                            <form method="post" id="response" action="SetFeedbackReply">  
                                <input type="text" name="reply" placeholder="Enter response..." style=" height: 40px; width:280px;" required>                              
                                <input type="hidden" name="feedbackId" value ="${feedbackDetail.getFeedbackId()}">
                                <input type="hidden" name="userId" value ="${sessionScope.user.getUser_ID()}">            
                                <br>
                                <br><input type="submit" value="Reply">
                            </form>
                            <br>
                            <h3>Previous reply</h3>
                            <c:forEach var="fbrlst" items="${fbrlst}">
                                <div class="row">
                                    <div class="col-lg-8">
                                        <a>${fbrlst.getResponseContent()}</a>
                                    </div>
                                    <div class="col-lg-4">
                                        <a href="supportDeleteFeedbackResponse?responseId=${fbrlst.getResponseID()}&feedbackID=${feedbackDetail.getFeedbackId()}" style="color: red" onclick="return confirm('Delete this response?');">Delete</a>
                                        <br>
                                    </div>
                                </div>
                            </c:forEach>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="<%= request.getContextPath()%>/js/scripts1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="<%= request.getContextPath()%>/js/datatables-simple-demo1.js"></script>
    </body>
</html>
