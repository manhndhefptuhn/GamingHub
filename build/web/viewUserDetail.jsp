<%-- 
    Document   : viewUserDetail
    Created on : 01-June-2023
    Author     : Viet
--%>

<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="Model.User" %>
<%@ page import="java.util.List" %>
<html>
    <head>
        <title>User Details</title>
    </head>
    <body>
        <h1>User Details</h1>
        <% List<User> userDetailList = (List<User>) request.getAttribute("userDetailList"); %>
        

        <form action="userListController" method="POST">
            <table class="table">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Email</th> 
                        <th>Password</th> 
                        <th>Profile_picture</th>
                        <th>Phone Number</th>
                        <th>Address</th>
                        <th>Status</th>
                        <th>Role_ID</th>
                    </tr>
                </thead>
                <tbody>
                    <c:choose>
                        <c:when test="${not empty userDetailList}">
                            <c:forEach var="userDetail" items="${userDetailList}">
                                <tr>
                                    <td><c:out value="${userDetail.getUser_ID()}"/></td>
                                    <td><c:out value="${userDetail.getFullName()}"/></td>
                                    <td><c:out value="${userDetail.getEmail()}"/></td>
                                    <td><c:out value="${userDetail.getPassword()}"/></td> 
                                    <td><c:out value="${userDetail.getProfile_picture()}"/></td>
                                    <td><c:out value="${userDetail.getPhone_Number()}"/></td>
                                    <td><c:out value="${userDetail.getAddress()}"/></td>
                                    <td><c:out value="${userDetail.isStatus()}"/></td>
                                    <td><c:out value="${userDetail.getRole_ID()}"/></td>
                                </tr>
                            </c:forEach>
                        </c:when>
                        <c:otherwise>
                            <tr>
                                <td colspan="6">Not found</td>
                            </tr>
                        </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </form>

        <br>

        <a href="edit.jsp?id=<c:out value="${user.getUser_ID()}" />">Edit</a>
    </body>
</html>
