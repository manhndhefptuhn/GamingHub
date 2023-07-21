<%-- 
    Document   : SaleCustomerListGood
    Created on : 09-07-2023, 20:41:49
    Author     : Zarius
--%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="Model.OrderStatus" %>
<%@ page import="DAL.OrderDAO" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Sale Order List</title>
        <link rel="icon" type="image/png" href="<%= request.getContextPath()%>/img/shop/logo1.png"/>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="<%= request.getContextPath()%>/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <style>
            select option[selected] {
                background-color: #C5C5C5;
                font-weight: bold;
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="SaleNavigation.jsp" %>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Order List</h1>
                    <div class="card mb-4">
                        <div class="card-body">
                            <c:if test="${notification != null}">
                                    <div>
                                        <strong style="color: red;">${notification}</strong>
                                    </div>
                                </c:if>
                            <c:choose>
                                <c:when test="${not empty orders}">
                                    <table id="datatablesSimple">
                                        <thead>
                                            <tr>
                                                <th>Order ID</th>
                                                <th>Customer Name</th>
                                                <th>Order Date</th>
                                                <th>Total Cost</th>  
                                                <th>Payment</th>  
                                                <th>Order Status</th>                                              
                                                <th>View</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="order" items="${orders}">
                                                <tr>
                                                    <td>${order.getOrderID()}</td>
                                                    <td>${order.getFullName()}</td>
                                                    <td>${order.getOrderDate()}</td>
                                                    <td><fmt:formatNumber pattern="#,##0" value="${order.getTotalCost()}"/> VNÐ</td>
                                                    <td>${order.getPayment()}</td>
                                                    <td>
                                                        <form id="form-${order.getOrderID()}" method="post" action="SaleUpdateOrderStatusController">
                                                            <input type="hidden" name="orderID" value="${order.getOrderID()}">
                                                            <c:set var="listOrderStatusName" value="${requestScope.listOrderStatusName}" />
                                                            <c:set var="isReadOnly" value="${order.getOrderStatus() == 5 || order.getOrderStatus() == 6}" />
                                                            <c:choose>
                                                                <c:when test="${isReadOnly}">
                                                                    ${listOrderStatusName[order.getOrderStatus()]}
                                                                </c:when>
                                                                <c:otherwise>
                                                                    <select name="status" onchange="submitForm(${order.getOrderID()})">
                                                                        <c:choose>
                                                                            <c:when test="${order.getPayment() eq 'COD'}">
                                                                                <c:forEach var="statusCOD" items="${statusesCOD}">
                                                                                    <c:choose>
                                                                                        <c:when test="${order.getOrderStatus() == statusCOD.getOrderStatusID()}">
                                                                                            <option value="${order.getOrderStatus()}" selected="selected">${statusCOD.getOrderStatusName()}</option>
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            <option value="${statusCOD.getOrderStatusID()}">${statusCOD.getOrderStatusName()}</option>
                                                                                        </c:otherwise>
                                                                                    </c:choose>
                                                                                </c:forEach>
                                                                            </c:when>
                                                                            <c:when test="${order.getPayment() eq 'VNPay'}">
                                                                                <c:forEach var="statusVNPay" items="${statusesVNPay}">
                                                                                    <c:choose>
                                                                                        <c:when test="${order.getOrderStatus() == statusVNPay.getOrderStatusID()}">
                                                                                            <option value="${order.getOrderStatus()}" selected="selected">${statusVNPay.getOrderStatusName()}</option>
                                                                                        </c:when>
                                                                                        <c:otherwise>
                                                                                            <option value="${statusVNPay.getOrderStatusID()}">${statusVNPay.getOrderStatusName()}</option>
                                                                                        </c:otherwise>
                                                                                    </c:choose>
                                                                                </c:forEach>
                                                                            </c:when>
                                                                        </c:choose>
                                                                    </select>
                                                                </c:otherwise>
                                                            </c:choose>
                                                        </form>
                                                    </td>
                                                    <td><a href="SaleOrderDetailController?id=${order.getOrderID()}">View</a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:when>
                                <c:otherwise>
                                    <h1 class="mt-4">Empty Order List</h1>
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
    <script>
        function submitForm(orderID) {
            document.getElementById('form-' + orderID).submit();
        }
    </script>
    <script>

    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="<%= request.getContextPath()%>/js/scripts1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="<%= request.getContextPath()%>/js/datatables-simple-demo1.js"></script>
</body>
</html>
