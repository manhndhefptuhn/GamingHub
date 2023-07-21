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
                <div class="dateFromTo">
                    <form action="SaleDashboard">
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
                        My Revenue
                    </div>
                    <div class="card-body"><canvas id="myRevenueChart" width="100%" height="30"></canvas></div>
                </div>
                <div class="row">
                    <div class="col-lg-6">
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-bar me-1"></i>
                                Component
                            </div>
                            <h4 class="text-center mt-4">Number of component: ${totalComponent}</h4>
                            <div class="card-body"><canvas id="myBarChartComponent" width="100%" height="50"></canvas></div>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="card mb-4">
                            <div class="card-header">
                                <i class="fas fa-chart-pie me-1"></i>
                                Order Status 
                            </div>
                            <h4 class="text-center mt-4">Number of order: ${totalOrder}</h4>
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
<c:set var="listNumberOfOrderByStatus" value="${requestScope.listNumberOfOrderByStatus}" />
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath()%>/js/scripts1.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js" crossorigin="anonymous"></script>
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
                            data: [<c:forEach  items="${listOrderStatus}" var="listOrderStatus" >${listNumberOfOrderByStatus[listOrderStatus.getOrderStatusID()]}, </c:forEach>],
                            backgroundColor: ['#007bff', '#ffc107', '#ff6f69','#ffcc5c','#28a745', '#dc3545'],
                        }],
        },
    });
    </script>

    <script>
        // Set new default font family and font color to mimic Bootstrap's default styling
        Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
        Chart.defaults.global.defaultFontColor = '#292b2c';

    // Bar Chart Example
        var ctx = document.getElementById("myBarChartComponent");
        var myLineChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ["Mainboard", "CPU", "RAM", "VGA", "Storage", "PSU", "Case"],
                datasets: [{
                        label: "Number",
                        backgroundColor: "rgba(2,117,216,1)",
                        borderColor: "rgba(2,117,216,1)",
                        data: [${numberOfMainboard}, ${numberOfCpu}, ${numberOfRAM}, ${numberOfVGA}, ${numberOfStorage}, ${numberOfPSU}, ${numberOfCase}],
                    }],
            },
            options: {
                scales: {
                    xAxes: [{
                            time: {
                                unit: 'month'
                            },
                            gridLines: {
                                display: false
                            },
                            ticks: {
                            }
                        }],
                    yAxes: [{
                            ticks: {
                                beginAtZero: true,
                                maxTicksLimit: 5
                            },
                            gridLines: {
                                display: true
                            }
                        }],
                },
                legend: {
                    display: false
                }
            }
        });

</script>
<script>
// Set new default font family and font color to mimic Bootstrap's default styling
    Chart.defaults.global.defaultFontFamily = '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
    Chart.defaults.global.defaultFontColor = '#292b2c';

// Area Chart Example
    var ctx = document.getElementById("myRevenueChart");
    var myLineChart = new Chart(ctx, {
        type: 'line',
        data: {
            labels: [<c:forEach  items="${listChartRevenueArea}" var="revenue" > "${revenue.date}",</c:forEach>],
            datasets: [{
                    label: "Sessions",
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
