<%-- 
    Document   : SaleAddProductGood
    Created on : 18-07-2023, 20:16:26
    Author     : Zarius
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Sale Add product</title>
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
            .button-group {
                display: flex;
                align-items: center;
            }

            .button-group input[type="radio"],
            .button-group label {
                display: inline-block;
                vertical-align: middle;
                width: auto;
                margin-left: 1em;
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="SaleNavigation.jsp" %>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Add New Product</h1>
                    <div class="card mb-4">
                        <form method="POST" action="CreateProductController" enctype="">
                            <div class="card-body">
                                <c:if test="${notification != null}">
                                    <div>
                                        <strong id="notification" style="color: red;">${notification}</strong>
                                    </div>
                                </c:if>
                                <table id="datatablesSimple">
                                    <tbody>
                                        <tr>
                                            <th>Product Name</th>
                                            <td><input type="text" id="productName" name="productName" placeholder="Enter product name" required/><br></td>
                                        </tr>
                                        <tr>
                                            <th>Description</th>
                                            <td><input style="width: 100%; box-sizing: border-box;" id="description" name="description"/><br></td>
                                        </tr>
                                        <tr>
                                            <th>Status</th>
                                            <td><div class="button-group">
                                                    <input type="radio" id="active" name="status" value="true" required>
                                                    <label for="active">Active</label>
                                                    <input type="radio" id="dedactive" name="status" value="false" required>
                                                    <label for="deactive">Not Active</label>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Quantity</th>
                                            <td><input type="number" id="quantity" name="quantity" min="0" required/><br></td>
                                        </tr>
                                        <tr>
                                            <th>Product Status</th>
                                            <td>
                                                <select required name="productStatus" id="productStatus" onchange="updateSalePercentage()">
                                                    <option disabled selected value>-- Select Product Status --</option>
                                                    <c:forEach var="ps" items="${allprs}">
                                                        <option value="${ps.productStatusID}">${ps.productStatusName}</option>
                                                    </c:forEach>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Sale Percentage</th>
                                            <td>
                                                <input type="number" id="salePercentage" name="salePercentage" value="0" max="100">
                                                <br>
                                        </tr>
                                        <tr>
                                            <th>Category</th>
                                            <td>
                                                <select required name="category" id="category">
                                                    <option disabled selected value>-- Select Category --</option>
                                                    <c:forEach var="c" items="${allcate}">
                                                        <option value="${c.getCategoryID()}">${c.getCategoryName()}</option>
                                                    </c:forEach>
                                                </select>
                                        </tr>
                                        <tr>
                                            <th>CPU</th>
                                            <td>
                                                <select required name="cpu" id="cpu">
                                                    <option disabled selected value>-- Select CPU --</option>
                                                    <c:forEach var="cpu" items="${allcpu}">
                                                        <option value="${cpu.getCpuID()}" data-price="${cpu.getPrice()}">${cpu.getCpuName()} - <fmt:formatNumber pattern="#,##0" value="${cpu.getPrice()}"/> VNÐ</option>
                                                    </c:forEach>
                                                </select>
                                                <br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>CASE</th>
                                            <td>
                                                <select required id="case" name="case">
                                                    <option disabled selected value>-- Select Case --</option>
                                                    <c:forEach var="ca" items="${allca}">
                                                        <option value="${ca.getCaseID()}" data-price="${ca.getPrice()}">${ca.getCaseName()} - <fmt:formatNumber pattern="#,##0" value="${ca.getPrice()}"/> VNÐ</option>
                                                    </c:forEach>
                                                </select>
                                                <br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Mainboard</th>
                                            <td>
                                                <select required id="mainboard" name="mainboard">
                                                    <option disabled selected value>-- Select Mainboard --</option>
                                                    <c:forEach var="mb" items="${allmb}">
                                                        <option value="${mb.getMainboardID()}" data-price="${mb.getPrice()}">${mb.getMainboardName()} - <fmt:formatNumber pattern="#,##0" value="${mb.getPrice()}"/> VNÐ VNÐ</option>
                                                    </c:forEach>
                                                </select>
                                                <br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>PSU</th>
                                            <td>
                                                <select required id="psu" name="psu">
                                                    <option disabled selected value>-- Select PSU --</option>
                                                    <c:forEach var="psu" items="${allpsu}">
                                                        <option value="${psu.getPsuID()}" data-price="${psu.getPrice()}">${psu.getPsuName()} - <fmt:formatNumber pattern="#,##0" value="${psu.getPrice()}"/> VNÐ</option>
                                                    </c:forEach>
                                                </select>
                                                <br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>RAM</th>
                                            <td>
                                                <select required id="ram" name="ram">
                                                    <option disabled selected value>-- Select RAM --</option>
                                                    <c:forEach var="ram" items="${allram}">
                                                        <option value="${ram.getRamID()}" data-price="${ram.getPrice()}">${ram.getRamName()} - <fmt:formatNumber pattern="#,##0" value="${ram.getPrice()}"/> VNÐ</option>
                                                    </c:forEach>
                                                </select>
                                                <br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Storage</th>
                                            <td>
                                                <select required id="storage" name="storage">
                                                    <option disabled selected value>-- Select Storage --</option>
                                                    <c:forEach var="st" items="${allst}">

                                                        <option value="${st.getStorageID()}" data-price="${st.getPrice()}">${st.getStorageName()} - <fmt:formatNumber pattern="#,##0" value="${st.getPrice()}"/> VNÐ</option>
                                                    </c:forEach>
                                                </select>
                                                <br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>VGA</th>
                                            <td>
                                                <select required id="vga" name="vga">
                                                    <option disabled selected value>-- Select VGA --</option>
                                                    <c:forEach var="vga" items="${allvga}">
                                                        <option value="${vga.getVgaID()}" data-price="${vga.getPrice()}">${vga.getVgaName()} - <fmt:formatNumber pattern="#,##0" value="${vga.getPrice()}"/> VNÐ</option>
                                                    </c:forEach>
                                                </select>
                                                <br>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Total Price</th>
                                            <td><span id="totalPrice"></span> VNĐ<br></td>
                                        </tr>
                                        <tr id="salePriceRow">
                                            <th>Sale Price</th>
                                            <td><span style="color: red;" id="salePrice"></span> VNĐ<br></td>
                                        </tr>
                                </table>
                                <input type="submit" name="create" value="Create" class="btn-update"/>  
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
        <script>
                                                    document.addEventListener('DOMContentLoaded', function () {
                                                        new simpleDatatables.DataTable('#datatablesSimple', {
                                                            paging: false // Disable pagination
                                                        });
                                                    });

                                                    function updateSalePercentage() {
                                                        var productStatus = document.getElementById("productStatus");
                                                        var salePercentage = document.getElementById("salePercentage");
                                                        if (productStatus.value === "2") {
                                                            salePercentage.readOnly = false;
                                                            salePercentage.style.backgroundColor = "white";
                                                        } else {
                                                            salePercentage.value = "0";
                                                            salePercentage.readOnly = true;
                                                            salePercentage.style.backgroundColor = "#C5C5C5";
                                                        }
                                                    }
        </script>

        <script>
            $(document).ready(function () {
                // Function to calculate and update the total price
                function calculateTotalPrice() {
                    var cpuPrice = parseFloat($("#cpu").find(":selected").data("price"));
                    var casePrice = parseFloat($("#case").find(":selected").data("price"));
                    var mainboardPrice = parseFloat($("#mainboard").find(":selected").data("price"));
                    var psuPrice = parseFloat($("#psu").find(":selected").data("price"));
                    var ramPrice = parseFloat($("#ram").find(":selected").data("price"));
                    var storagePrice = parseFloat($("#storage").find(":selected").data("price"));
                    var vgaPrice = parseFloat($("#vga").find(":selected").data("price"));

                    var totalPrice = cpuPrice + casePrice + mainboardPrice + psuPrice + ramPrice + storagePrice + vgaPrice;
                    var formattedPrice = totalPrice.toLocaleString("vi-VN", {minimumFractionDigits: 0});
                    $("#totalPrice").text(formattedPrice);


                    // Check if the product status is "Sale"
                    var productStatus = $("#productStatus").val();
                    if (productStatus === "2") {
                        var salePercentage = parseInt($("#salePercentage").val());
                        var salePrice = totalPrice - (totalPrice * (salePercentage / 100));
                        var formattedSalePrice = salePrice.toLocaleString("vi-VN", {minimumFractionDigits: 0});
                        $("#salePrice").text(formattedSalePrice);
                        $("#salePriceRow").show();
                    } else {
                        $("#salePrice").text("");
                        $("#salePriceRow").hide();
                    }
                }

                // Calculate and update the total price initially
                calculateTotalPrice();

                // Listen for changes in the dropdown options
                $("#cpu, #case, #mainboard, #psu, #ram, #storage, #vga, #productStatus, #salePercentage").change(function () {
                    calculateTotalPrice();
                });
            });
        </script>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="<%= request.getContextPath()%>/js/scripts1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="<%= request.getContextPath()%>/js/datatables-simple-demo1.js"></script>
    </body>
</html>
