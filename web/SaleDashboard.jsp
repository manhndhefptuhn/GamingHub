<%-- 
    Document   : SaleDashboard
    Created on : 10-07-2023, 00:43:38
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
        <title>Sale Dashboard</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="<%= request.getContextPath()%>/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    </head>
    <%@include file="SaleNavigation.jsp" %>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Sale Dashboard</h1>
                <div class="card mb-4">
                    <div class="card-header">
                        <i class="fas fa-chart-area me-1"></i>
                        Area Chart Example
                    </div>
                    <div class="card-body"><canvas id="myAreaChart" width="100%" height="30"></canvas></div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-bar me-1"></i>
                                Bar Chart Example
                            </div>
                            <div class="card-body"><canvas id="myBarChart" width="100%" height="50"></canvas></div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-pie me-1"></i>
                                Number of orders: 
                            </div>
                            <div class="card-body"><canvas id="myPieChartOrder" width="100%" height="50"></canvas></div>
                        </div>
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
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath()%>/assets/demo/chart-area-demo.js"></script>
<script src="<%= request.getContextPath()%>/assets/demo/chart-bar-demo.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath()%>/js/datatables-simple-demo1.js"></script>
<script>

    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#292b2c';

// Pie Chart Example
    var ctx = document.getElementById("myPieChartOrder");
    var myPieChart = new Chart(ctx, {
        type: 'pie',
        data: {
            labels: [<c:forEach  items="${listOrderStatus}" var="listOrderStatus" > "${listOrderStatus.getOrderStatusName()}",</c:forEach>],
            datasets: [{
                    data: [10, 10, 10, 10],
                    backgroundColor: ['#007bff', '#dc3545', '#ffc107', '#28a745'],
                }],
        },
    });
</script>
</body>
</html>
