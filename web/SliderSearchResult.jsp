<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@ page import="Model.Slider" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Search Results</title>
        <style>
            table {
                width: 100%;
                border-collapse: collapse;
                margin-top: 20px;
            }

            th, td {
                padding: 8px;
                text-align: left;
                border: 1px solid #ddd;
            }

            th {
                background-color: #f2f2f2;
            }
        </style>
    </head>
    <body>
        <h1>Slider Search Result</h1>
        <% if (request.getAttribute("foundSliderByID") != null) {
            List<Slider> foundSliderByID = (List<User>) request.getAttribute("foundSliderByID");
        %>
        
        <table>
            <thead>
                <tr>
                    <th>Slider ID</th>
                    <th>Title</th>
                    <th>Image</th>
                    <th>Status</th>
                </tr>
            </thead>
            
            <tbody>
                <%-- Iterate over the user list and display user information in table rows --%>
                <% for (Slider slider : foundSliderByID) { %>
                <tr>
                    <td><c:out value="${slider.getSliderID()}"/></td>
                    <td><c:out value="${slider.getSliderTitle()}"/></td>
                    <td><img src="<%= request.getContextPath()%>/${slider.getSliderImage()}" width="200" height="200"/></td>
                    <td><c:out value="${slider.isStatus()}"/></td>
                </tr>
                <% } %>
            </tbody>
        </table>
        <% } else { %>
        <p>No users found.</p>
        <% } %>
    </body>
</html>
