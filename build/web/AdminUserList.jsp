<%-- 
    Document   : AdminUserListGood
    Created on : 09-07-2023, 14:05:30
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
        <title>Admin User List</title>
        <link rel="icon" type="image/png" href="<%= request.getContextPath()%>/img/shop/logo1.png"/>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="<%= request.getContextPath()%>/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="AdminNavigation.jsp" %>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">User List</h1>
                    <div class="card mb-4">
                        <div class="card-body">
                            <c:if test="${notification != null}">
                                <div>
                                    <strong style="color: red;">${notification}</strong>
                                </div>
                            </c:if>
                            <c:choose>
                                <c:when test="${not empty userList}">
                                    <table id="datatablesSimple">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Email</th>
                                                <th>Phone Number</th>
                                                <th>Role</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="listRoleName" value="${requestScope.listRoleName}" />
                                            <c:forEach var="user" items="${userList}">
                                                <c:set var="roleID" value="${user.getRole_ID()}" />
                                                <tr>
                                                    <td><c:out value="${user.getUser_ID()}"/></td>
                                                    <td><c:out value="${user.getFullName()}"/></td>
                                                    <td><c:out value="${user.getEmail()}"/></td>
                                                    <td><c:out value="${user.getPhone_Number()}"/></td>
                                                    <td><c:out value="${listRoleName[roleID]}"/></td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${user.isStatus() == true}">
                                                                <c:out value="Active"/>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:out value="Deactive"/>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <a href="userDetail?id=${user.getUser_ID()}">View</a>
                                                        <c:if test="${user.getUser_ID() != sessionScope.user.getUser_ID()}">
                                                            <c:choose>
                                                                <c:when test="${(user.isStatus() == true)}">
                                                                    <a href="falseUser?id=<c:out value="${user.getUser_ID()}" />">| Deactive</a>
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <a href="trueUser?id=<c:out value="${user.getUser_ID()}" />">| Active</a>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </c:if>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:when>
                                <c:otherwise>
                                    <h1 class="mt-4">Empty User List</h1>
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

