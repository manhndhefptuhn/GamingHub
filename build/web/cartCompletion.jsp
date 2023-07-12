<%-- 
    Document   : cartCompletion
    Created on : 12-07-2023, 06:58:09
    Author     : Zarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zxx">
    <html>
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <title>Cart Completion</title>
            <!-- Google Font -->
            <link href="https://fonts.googleapis.com/css2?family=Cookie&display=swap" rel="stylesheet">
            <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700;800;900&display=swap"
                  rel="stylesheet">

            <!-- Css Styles -->
            <link rel="stylesheet" href="<%= request.getContextPath()%>/css/bootstrap.min.css" type="text/css">
            <link rel="stylesheet" href="<%= request.getContextPath()%>/css/font-awesome.min.css" type="text/css">
            <link rel="stylesheet" href="<%= request.getContextPath()%>/css/elegant-icons.css" type="text/css">
            <link rel="stylesheet" href="<%= request.getContextPath()%>/css/jquery-ui.min.css" type="text/css">
            <link rel="stylesheet" href="<%= request.getContextPath()%>/css/magnific-popup.css" type="text/css">
            <link rel="stylesheet" href="<%= request.getContextPath()%>/css/owl.carousel.min.css" type="text/css">
            <link rel="stylesheet" href="<%= request.getContextPath()%>/css/slicknav.min.css" type="text/css">
            <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style.css" type="text/css">
        </head>
        <body>
            <%@include file="header.jsp" %>s
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-body ">
                        <div class="text-right"> <i class="fa fa-close close" data-dismiss="modal"></i> </div>

                        <div class="px-4 py-5">

                            <h5 class="text-uppercase">${sessionScope.user.getFullName()}</h5>
                            <h4 class="mt-5 theme-color mb-5">Thanks for your order</h4>
                            <h4 class="mt-5 theme-color mb-5">Your order ID is ${orderID}</h4>
                            <span class="theme-color">Payment Summary</span>
                            <div class="mb-3">
                                <hr class="new1">
                            </div>
                            <c:set var="listProductName" value="${requestScope.listProductName}" />
                            <c:forEach var="listOrderDetail" items="${listOrderDetail}">
                                <c:set var="productID" value="${listOrderDetail.getProductID()}" />

                                <div class="d-flex justify-content-between">
                                    <span class="font-weight-bold">${listProductName[productID]}(Qty:${listOrderDetail.getQuantity()})</span>
                                    <span class="text-muted">${listOrderDetail.getTotalCost()} VND</span>
                                </div>
                            </c:forEach>
                            <div class="d-flex justify-content-between mt-3">
                                <span class="font-weight-bold">Total</span>
                                <span class="font-weight-bold theme-color">${orderTotalCost} VND</span>
                            </div>  
                            <div class="text-center mt-5">
                                <a href="orderDetail?id=${orderID}"><button class="btn btn-primary">Track your order</button></a>
                            </div>                   
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%@include file="footer.jsp" %>
        <!-- Js Plugins -->
        <script src="<%= request.getContextPath()%>/js/jquery-3.3.1.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/bootstrap.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/jquery.magnific-popup.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/jquery-ui.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/mixitup.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/jquery.countdown.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/jquery.slicknav.js"></script>
        <script src="<%= request.getContextPath()%>/js/owl.carousel.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/jquery.nicescroll.min.js"></script>
        <script src="<%= request.getContextPath()%>/js/main.js"></script>
    </body>
</html>
