<%-- 
    Document   : adminDashboard
    Created on : 30-May-2023, 9:06:13 AM
    Author     : Viet
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Model.User" %>
<%@ page import="java.util.List" %>
<% List<User> userList = (List<User>) request.getAttribute("userList"); %>

<!DOCTYPE html>
<html>
    <head>
        <title>User Overview</title>
        <link rel="stylesheet" type="text/css" href="draft.css">
    </head>
    <body>
        <div class="sidebar">
            <!-- Sidebar content goes here -->
        </div>

        <nav class="navbar navbar-dark bg-dark">
            <a class="navbar-brand" href="#">User Overview</a>
        </nav>

        <main role="main" class="container-fluid">
            <div class="row">
                <div class="col-md-12">
                    <h1>Users</h1>
                    <form action="userListController" method="POST">
                        <table class="table">
                            <thead>
                                <tr>
                                    <th>ID</th>
                                    <th>Name</th>
                                    <th>Email</th>
                                    <th>Phone Number</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${not empty userList}">
                                        <c:forEach var="user" items="${userList}">
                                            <tr>
                                                <td><c:out value="${user.getUser_ID()}"/></td>
                                                <td><c:out value="${user.getFullName()}"/></td>
                                                <td><c:out value="${user.getEmail()}"/></td>
                                                <td><c:out value="${user.getPhone_Number()}"/></td>
                                                <td><c:out value="${user.isStatus()}"/></td>
                                                <td>
                                                    <a href="userDetailServlet?id=<c:out value="${user.getUser_ID()}" />">View</a> |
                                                    <a href="edit.jsp?id=<c:out value="${user.getUser_ID()}" />">Edit</a>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:when>
                                    <c:otherwise>
                                        <tr>
                                            <td colspan="6">No users found</td>
                                        </tr>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </form>
                </div>
            </div>
        </main>
    </body>
</html>
