<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Product List</title>
        <style>
            table, th, td {
                border: 1px solid black;
                border-collapse: collapse;
                padding: 5px;
            }
        </style>
    </head>
    <body>
        <h1>Product List</h1>
        <a href="createProduct.jsp"><button>Create New Product</button></a>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Description</th>
                    <th>Status</th>
                    <th>Quantity</th>
                    <th>Product Status ID</th>
                    <th>Category ID</th>
                    <th>Edit</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="product" items="${products}">
                    <tr>
                        <td>${product.getProductID()}</td>
                        <td>${product.getProductName()}</td>
                        <td>${product.getDescription()}</td>
                        <td>${product.isStatus()}</td>
                        <td>${product.getQuantity()}</td>
                        <td>${product.getProductStatusID()}</td>
                        <td>${product.getCategoryID()}</td>
                        <td><a href="UpdateProductController?id=${product.getProductID()}">Edit</a></td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </body>
</html>