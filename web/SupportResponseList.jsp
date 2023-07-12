<%-- 
    Document   : SupportResponseList
    Created on : Jul 10, 2023, 9:57:53 PM
    Author     : admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Support Response List</title>
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
                    <h1 class="mt-4">Response List</h1>
                    <div class="card mb-4">
                        <c:if test="${notification != null}">
                            <div>
                                <strong style="color: red;">${notification}</strong>
                            </div>
                        </c:if>
                        <div class="card-body">
                            <c:choose>
                                <c:when test="${not empty responseList}">
                                    <table id="datatablesSimple">
                                        <thead>
                                            <tr>
                                                <th>Response ID</th>
                                                <th>Feedback ID</th>
                                                <th>Response date</th>
                                                <th>Content </th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="listProductName" value="${requestScope.listProductName}" />
                                            <c:set var="listUserName" value="${requestScope.listUserName}" />
                                            <c:forEach var="responseList" items="${responseList}">
                                                <tr>
                                                    <td>${responseList.getResponseID()}</td>
                                                    <td><a href="feedbackDetail?id=${responseList.getFeedbackID()}">${responseList.getFeedbackID()}</a></td>
                                                    <td>${responseList.getResponseDate()}</td>
                                                    <td>${responseList.getResponseContent()}</td>
                                                    
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:when>
                                <c:otherwise>
                                    <h1 class="mt-4">Empty List</h1>
                                </c:otherwise>
                            </c:choose>
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
