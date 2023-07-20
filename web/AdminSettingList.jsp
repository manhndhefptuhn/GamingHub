<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Admin Slider List</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="<%= request.getContextPath()%>/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>

    <style>
        .custom-heading {
            margin-top: 4px;
            margin-left: 8px;
        }
    </style>

    <body class="sb-nav-fixed">
        <%@include file="AdminNavigation.jsp" %>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Other List</h1>

                    <div class="card mb-4">
                        <form method="POST" action="editRoleController">
                            <h2 class="custom-heading">Role list</h2>
                            <div class="card-body">
                                <c:choose>
                                    <c:when test="${not empty roleList}">
                                        <table id="datatablesSimple">
                                            <thead>
                                                <tr>
                                                    <th>ID</th>
                                                    <th>Name</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="role" items="${roleList}">
                                                    <c:set var="roleID" value="${role.getRoleID()}" />
                                                    <tr>
                                                        <td><c:out value="${role.getRoleID()}"/></td>
                                                        <td><c:out value="${role.getRoleName()}"/></td>
                                                        <td>
                                                            <a href="editRoleController?id=${role.getRoleID()}">Update</a> 
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </c:when>
                                    <c:otherwise>
                                        <h1 class="mt-4">Empty Role List</h1>
                                    </c:otherwise>
                                </c:choose>
                            </div>
                        </form>
                    </div>

                    <div class="card mb-4">
                        <h2 class="custom-heading">Category list</h2>
                        <div class="card-body">
                            <c:choose>
                                <c:when test="${not empty categoryList}">
                                    <table id="datatablesSimple1">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="category" items="${categoryList}">
                                                <c:set var="categoryID" value="${category.getCategoryID()}" />
                                                <tr>
                                                    <td><c:out value="${category.getCategoryID()}"/></td>
                                                    <td><c:out value="${category.getCategoryName()}"/></td>
                                                    <td>
                                                        <c:choose>
                                                            <c:when test="${category.isStatus() == true}">
                                                                <c:out value="Active"/>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <c:out value="Deactive"/>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                    <td>
                                                        <a href="editCategoryController?id=${category.getCategoryID()}">Update</a> 
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:when>
                                <c:otherwise>
                                    <h1 class="mt-4">Empty Category List</h1>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </main>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="<%= request.getContextPath()%>/js/scripts1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="<%= request.getContextPath()%>/js/datatables-simple-demo1.js"></script>
        <script src="<%= request.getContextPath()%>/js/datatables-simple-demo2.js"></script>
    </body>
</html>