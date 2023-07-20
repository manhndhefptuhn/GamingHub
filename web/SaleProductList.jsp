<%-- 
    Document   : SaleCustomerListGood
    Created on : 09-07-2023, 20:41:49
    Author     : Zarius
--%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Sale Product List</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="<%= request.getContextPath()%>/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="SaleNavigation.jsp" %>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Product List</h1>
                    <div class="card mb-4">
                        <div class="card-body">
                            <c:if test="${notification != null}">
                                <div>
                                    <strong style="color: red;">${notification}</strong>
                                </div>
                            </c:if>
                            <c:choose>
                                <c:when test="${not empty products}">
                                    <table id="datatablesSimple">
                                        <thead>
                                            <tr>
                                                <th>ID</th>
                                                <th>Name</th>
                                                <th>Quantity</th>
                                                <th>Price</th>
                                                <th>Category</th>
                                                <th>Status</th>
                                                <th>Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:set var="listProductOrigiPrice" value="${requestScope.listProductOrigiPrice}" />
                                            <c:set var="listProductSalePrice" value="${requestScope.listProductSalePrice}" />
                                            <c:set var="mapCategoryName" value="${requestScope.mapCategoryName}" />
                                            <c:forEach var="product" items="${products}">
                                                <tr>
                                                    <td>${product.getProductID()}</td>
                                                    <td>${product.getProductName()}</td>
                                                    <td>${product.getQuantity()}</td>
                                                    <c:choose>
                                                        <c:when test="${product.getProductStatusID() == 0 || product.getProductStatusID() == 1}">
                                                            <td><fmt:formatNumber pattern="#,##0" value="${listProductOrigiPrice[product.getProductID()]}"/> VNÐ</td>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <td><fmt:formatNumber pattern="#,##0" value="${listProductSalePrice[product.getProductID()]}"/> VNÐ</td>
                                                        </c:otherwise>
                                                    </c:choose>

                                                    <td>${mapCategoryName[product.getProductID()]}</td>
                                                    <td>${product.isStatus() ? 'Active' : 'Deactive'}</td>
                                                    <td><a href="saleProductDetail?id=${product.getProductID()}">View</a> |
                                                        <c:choose>
                                                            <c:when test="${product.isStatus() == true}">
                                                                <a href="falseProduct?id=<c:out value="${product.getProductID()}" />">Deactive</a>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <a href="trueProduct?id=<c:out value="${product.getProductID()}" />">Active</a>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </c:when>
                                <c:otherwise>
                                    <h1 class="mt-4">Empty Product List</h1>
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
