<%-- 
    Document   : SaleViewCustomerGood
    Created on : 09-07-2023, 21:02:32
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
        <title>Sale Order Detail</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="<%= request.getContextPath()%>/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
        <style>
            .datatable-bottom, .datatable-top, .datatable-sorter, thead{
                display: none;
            }
            input{
                width: 50%;
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="SaleNavigation.jsp" %>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Order Detail</h1>
                    <div class="card mb-4">
                        <form method="" action="" enctype="">
                            <c:set var="order" value="${requestScope.order}" />
                            <div class="card-body">
                                <input type="hidden" name="id" value="${order.getOrderID()}" />
                                <table id="datatablesSimple">
                                    <tbody>
                                        <tr>
                                            <th>Order ID</th>
                                            <td><input style="background-color:#C5C5C5;" type="text" id="orderID" name="id" value="${order.getOrderID()}" readonly/><br></td>
                                        </tr>
                                        <tr>
                                            <th>Full Name</th>
                                            <td><input style="background-color:#C5C5C5;" type="text" id="name" name="fullName" value="${order.getFullName()}" readonly/><br></td>
                                        </tr>
                                        <tr>
                                            <th>Address</th>
                                            <td><input style="background-color:#C5C5C5;" type="text" id="address" name="address" value="${order.getAddress()}" readonly/><br></td>
                                        </tr>
                                        <tr>
                                            <th>Phone Number</th>
                                            <td><input style="background-color:#C5C5C5;" type="text" id="phone" name="phone" value="${order.getPhoneNumber()}" readonly/><br></td>
                                        </tr>
                                        <tr>
                                            <th>Order Date</th>
                                            <td><input style="background-color:#C5C5C5;" type="orderDate" id="orderDate" name="orderDate" value="${order.getOrderDate()}" readonly/><br></td>
                                        </tr>
                                        <tr>
                                            <th>Total Cost</th>
                                            <td><input style="background-color:#C5C5C5;" type="totalCost" id="totalCost" name="totalCost" value="${order.getTotalCost()}" readonly/><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Payment Type</th>
                                            <td><input style="background-color:#C5C5C5;" type="paymentType" id="paymentType" name="paymentType" value="${order.getPayment()}" readonly/><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Order Status</th>
                                            <td><input style="background-color:#C5C5C5;" type="orderStatus" id="orderStatus" name="orderStatus" value="${order.getOrderStatus()}"/><br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Note</th>
                                            <td><input style="background-color:#C5C5C5;" type="note" id="note" name="note" value="${order.getNote()}" readonly/><br>
                                            </td>
                                        </tr>
                                </table>
                                <button type="button" id="back" name="back"><a href="orderList" style="text-decoration: none; color: black;">Back</a></button>
                            </div>
                        </form>
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
