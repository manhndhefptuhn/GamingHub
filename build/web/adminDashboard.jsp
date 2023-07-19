<%-- 
    Document   : AdminDashboard
    Created on : 10-07-2023, 00:42:10
    Author     : Zarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Dashboard - SB Admin</title>
        <link href="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/style.min.css" rel="stylesheet" />
        <link href="<%= request.getContextPath()%>/css/styles.css" rel="stylesheet" />
        <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

        <style>
         input[type="date"] {
                font-size: 20px;
                border-radius: 5px;
            }
        </style>
    </head>
    <%@include file="AdminNavigation.jsp" %>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Admin Dashboard</h1>
                <div class="container-fluid px-4">
                    <div class="dateFromTo">
                        <form action="adminDashboardController">
                            From: 
                            <input class="" type="date" id="start" name="start" value="${start}">
                            To: 
                            <input type="date" id="end" name="end" value="${end}">
                            <input class="ml-4 btn btn-danger mb-2" type="submit" value="Show statistic"/>

                        </form>
                    </div>
                    <div class="card mb-4">
                        <div class="card-header">
                            <i class="fas fa-chart-area me-1"></i>
                            Revenue statistic
                        </div>
                        <div class="card-body"><canvas id="myAreaChart" width="100%" height="30"></canvas></div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-pie me-1"></i>
                                    Product status
                                </div>
                                <h4 class="text-center mt-4">Number of product: ${totalProduct}</h4>
                                <div class="card-body"><canvas id="myPieChart-2" width="100%" height="50"></canvas></div>

                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="card mb-4">
                                <div class="card-header">
                                    <i class="fas fa-chart-pie me-1"></i>
                                    Product statistic
                                </div>
                                <h4 class="text-center mt-4">Number of product: ${totalProduct}</h4>
                                <div class="card-body"><canvas id="myPieChart" width="100%" height="50"></canvas></div>

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
    <c:set var="listNumberOfProduct" value="${requestScope.listNumberOfProduct}" />
    <c:set var="listNumberOfProductStatus" value="${requestScope.listNumberOfProductStatus}" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<!--    <script src="<%= request.getContextPath()%>/js/scripts1.js"></script>-->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
<!--    <script src="<%= request.getContextPath()%>/assets/demo/chart-area-demo.js"></script>
    <script src="<%= request.getContextPath()%>/assets/demo/chart-bar-demo.js"></script>-->
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<!--    <script src="<%= request.getContextPath()%>/js/datatables-simple-demo1.js"></script>
    <script src="<%= request.getContextPath()%>/assets/demo/chart-pie-demo.js"></script>-->
    <script>
        // Set new default font family and font color to mimic Bootstrap's default styling
        Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#292b2c';
        var ctx = document.getElementById("myPieChart");
        var myPieChart = new Chart(ctx, {
        type: 'pie',
                data: {
                labels: [<c:forEach items="${categoryList}" var="category" > "${category.categoryName}",</c:forEach>],
                        datasets: [{
                        data: [<c:forEach items="${categoryList}" var="category" >${listNumberOfProduct[category.getCategoryID()]}, </c:forEach>],
                                backgroundColor: ['#ffc107', '#28a745', '#7e3bad', '#d91a53', '#007bff', '#6610f2', '#6f42c1', '#17a2b8',
                                        '#dc3545', '#fd7e14', '#ffc107', '#28a745', '#007bff', '#6610f2', '#6f42c1', '#17a2b8',
                                        '#dc3545', '#fd7e14', '#ffc107', '#28a745', '#007bff', '#6610f2', '#6f42c1', '#17a2b8',
                                        '#dc3545', '#fd7e14'],
                        }],
                }
        });
        var ctx = document.getElementById("myPieChart-2");
        var myPieChart = new Chart(ctx, {
        type: 'pie',
                data: {
                labels: [<c:forEach items="${productStatusList}" var="productStatus" > "${productStatus.productStatusName}",</c:forEach>],
                        datasets: [{
                        data: [<c:forEach items="${productStatusList}" var="productStatus" >${listNumberOfProductStatus[productStatus.getProductStatusID()]}, </c:forEach>],
                                backgroundColor: ['#ffc107', '#28a745', '#7e3bad', '#d91a53', '#007bff', '#6610f2', '#6f42c1', '#17a2b8',
                                        '#dc3545', '#fd7e14', '#ffc107', '#28a745', '#007bff', '#6610f2', '#6f42c1', '#17a2b8',
                                        '#dc3545', '#fd7e14', '#ffc107', '#28a745', '#007bff', '#6610f2', '#6f42c1', '#17a2b8',
                                        '#dc3545', '#fd7e14'],
                        }],
                }
        });
    </script>

    <script>
        Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#292b2c';
        // Area Chart Example
        var ctx1 = document.getElementById("myAreaChart");
        var myLineChart1 = new Chart(ctx1, {
        type: 'line',
                data: {
                labels: [<c:forEach  items="${listChartRevenueArea}" var="revenue" > "${revenue.date}",</c:forEach>],
                        datasets: [{
                        label: "Revenue",
                                lineTension: 0.3,
                                backgroundColor: "rgba(2,117,216,0.2)",
                                borderColor: "rgba(2,117,216,1)",
                                pointRadius: 5,
                                pointBackgroundColor: "rgba(2,117,216,1)",
                                pointBorderColor: "rgba(255,255,255,0.8)",
                                pointHoverRadius: 5,
                                pointHoverBackgroundColor: "rgba(2,117,216,1)",
                                pointHitRadius: 50,
                                pointBorderWidth: 2,
                                data: [<c:forEach  items="${listChartRevenueArea}" var="revenue" > "${revenue.value}",</c:forEach>],
                        }],
                },
                options: {
                scales: {
                xAxes: [{
                time: {
                unit: 'date'
                },
                        gridLines: {
                        display: false
                        },
                        ticks: {
                        maxTicksLimit: 7
                        }
                }],
                        yAxes: [{
                        ticks: {
                        min: 0,
                                max: ${maxListChartRevenueArea},
                                maxTicksLimit: 5
                        },
                                gridLines: {
                                color: "rgba(0, 0, 0, .125)",
                                }
                        }],
                },
                        legend: {
                        display: false
                        }
                }
        });

    </script>
</body>
</html>
