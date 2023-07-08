<%-- 
    Document   : SliderList
    Created on : 20-Jun-2023, 9:21:28 AM
    Author     : AN515-57
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Model.Slider" %>
<%@ page import="java.util.List" %>
<% List<Slider> sliderList = (List<Slider>) request.getAttribute("sliderList");%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Slider List</title>
    </head>
    <body>
        <div class="sidebar">
            <!-- Sidebar content goes here -->
            <ul>
                <li><a href="#">Sales Dashboard</a></li>
                <li><a href="#">Support Dashboard</a></li>
                <li><a href="#">Feedback List</a></li>
                <li><a href="#">User Information</a></li>
                <li><a href="/sliderListController">Slider List</a></li>
            </ul>
        </div>
        
        <main role="main" class="container-fluid">
            <div class="row">
                <table class="table">
                        <thead>
                            <tr>
                                <th>ID</th>
                                <th>Title</th>
                                <th>Image</th>
                                <th>Status</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${not empty sliderList}">
                                    <c:forEach var="slider" items="${sliderList}">
                                        <tr>
                                            <td><c:out value="${slider.getSliderID()}"/></td>
                                            <td><c:out value="${slider.getSliderTitle()}"/></td>
<!--                                            <td><img src="<%= request.getContextPath()%>/${listSlider.getSliderImage()}" alt="${listSlider.getSliderTitle()}" /></td>-->
                                            <td><c:out value="${slider.isStatus()}"/></td>
                                            <td>
<!--                                                <a href="userDetailServlet?id=<c:out value="${slider.getSliderID()}" />">View</a> |
                                                <a href="editUserController?id=<c:out value="${slider.getSliderID()}" />">Edit</a>-->
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
                </div>
            </div>
        </main>
    </body>
</html>
