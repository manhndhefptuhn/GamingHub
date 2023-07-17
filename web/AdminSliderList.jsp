<%-- 
    Document   : AdminSliderListGood
    Created on : 09-07-2023, 14:51:26
    Author     : Zarius
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Admin Slider List</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="<%= request.getContextPath()%>/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="AdminNavigation.jsp" %>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Slider List</h1>
                    <div class="card mb-4">
                        <div class="card-body">
                            <c:if test="${notification != null}">
                                <div>
                                    <strong style="color: red;">${notification}</strong>
                                </div>
                            </c:if>
                            <c:choose>
                                <c:when test="${not empty sliderList}">
                                    <table id="datatablesSimple">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Title</th>
                                                <th>Image</th>
                                                <th>Status</th>
                                                <th>Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="slider" items="${sliderList}">
                                                <tr>
                                                    <td><c:out value="${slider.getSliderID()}"/></td>
                                                    <td><c:out value="${slider.getSliderTitle()}"/></td>
                                                    <td><img src="<%= request.getContextPath()%>/${slider.getSliderImage()}" width="200" height="200"/></td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${slider.isStatus() == true}">
                                                                <c:out value="Active"/>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:out value="Deactive"/>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <a href="sliderDetail?id=<c:out value="${slider.getSliderID()}" />">View</a> |
                                                        <a href="deleteSlider?id=<c:out value="${slider.getSliderID()}" />">Delete</a> |
                                                        <c:choose>
                                                            <c:when test="${slider.isStatus() == true}">
                                                                <a href="falseSlider?id=<c:out value="${slider.getSliderID()}" />">Deactive</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a href="trueSlider?id=<c:out value="${slider.getSliderID()}" />">Active</a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:when>
                                <c:otherwise>
                                    <h1 class="mt-4">Empty Slider List</h1>
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
