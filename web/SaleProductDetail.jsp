<%-- 
    Document   : SalesAddProduct
    Created on : Jul 11, 2023, 8:04:43 AM
    Author     : User
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Product Detail</title>
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
    <%@include file="SaleNavigation.jsp" %>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Product Detail</h1>
                <div class="card mb-4">
                    <form method="post" action="UpdateProductController" enctype="">
                        <c:set var="productDetail" value="${requestScope.productDetail}" />
                        <div class="card-body">
                            <% String message = (String) request.getAttribute("notification"); %>
                            <% if (message != null) { %>
                            <p><%= message %></p>
                            <% } %>
                            <table id="datatablesSimple">
                                <tbody>
                                    <tr>
                                        <th>Product ID</th>
                                        <td><input type="text" id="productID" name="id" value="${product.getProductID()}" readonly/><br></td>
                                    </tr>
                                    <tr>
                                        <th>Product Name</th>
                                        <td><input id="productName" name="productName" value="${product.getProductName()}" required/><br></td>
                                    </tr>
                                    <tr>
                                        <th>Description</th>
                                        <td><textarea id="description" name="description">${product.getDescription()}</textarea><br></td>
                                    </tr>
                                    <tr>
                                        <th>Status</th>
                                        <td><select type="status" id="status" name="status" placeholder="">
                                                <option value="true" ${product.isStatus() ? 'selected' : ''}>Active</option>
                                                <option value="false" ${!product.isStatus() ? 'selected' : ''}>Deactive</option>
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <th>Quantity</th>
                                        <td><input type="number" id="quantity" name="quantity" value="${product.getQuantity()}" min="0" required/><br></td>
                                    </tr>
                                    <tr>
                                        <th>Product Status</th>
                                        <td>    
                                            <select name="productStatus" id="productStatus" onchange="updateSalePercentage()">
                                                <c:forEach var="ps" items="${allprs}">
                                                    <c:choose>
                                                        <c:when test="${ps.productStatusID == product.getProductStatusID()}">
                                                            <option value="${ps.productStatusID}" selected>${ps.productStatusName}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${ps.productStatusID}">${ps.productStatusName}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                    </tr>
                                    <tr>
                                        <th>Sale Percentage</th>
                                        <td><input type="text" id="salePercentage" name="salePercentage" value="0" max="100" readonly><br></td>
                                    </tr>
                                    <tr>
                                        <th>Category</th>
                                        <td>
                                            <select name="category" id="category">
                                                <c:forEach var="c" items="${allcate}">
                                                    <c:choose>
                                                        <c:when test="${c.categoryID == product.getCategoryID()}">
                                                            <option value="${c.categoryID}" selected>${c.categoryName}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${c.categoryID}">${c.categoryName}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </td>

                                    </tr>
                                    <tr>
                                        <th>CPU</th>
                                        <td><select  type="text" id="cpu" name="cpu" value="" >
                                                <span value="${pc.getCpuID()}">${cpu.getCpuName()}</span>
                                                <c:forEach var="cpu" items="${allcpu}">
                                                    <option value="${cpu.cpuID}">${cpu.cpuName} - ${cpu.price} VND</option>
                                                </c:forEach> 
                                            </select></td>

                                        <th>CASE</th>
                                        <td><select type="text" id="case" name="case" value="">
                                                <span value="${pc.getCaseID()}">${c.getCaseName()}</span>
                                                <c:forEach var="ca" items="${allca}">
                                                    <option value="${ca.caseID}">${ca.caseName} - ${ca.price} VND</option>
                                                </c:forEach> 
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <th>Mainboard</th>
                                        <td><select  type="text" id="mainboard" name="mainboard" value="">
                                                <span value="${pc.getMainboardID()}">${mb.getMainboardName()}</span>
                                                <c:forEach var="mb" items="${allmb}">
                                                    <option value="${mb.mainboardID}">${mb.mainboardName} - ${mb.price} VND</option>
                                                </c:forEach> 
                                            </select></td>

                                        <th>PSU</th>
                                        <td><select type="text"  id="psu" name="psu" value="">
                                                <span value="${pc.getPsuID()}">${psu.getPsuName()}</span>
                                                <c:forEach var="psu" items="${allpsu}">
                                                    <option value="${psu.psuID}">${psu.psuName} - ${psu.price} VND</option>
                                                </c:forEach> 
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <th>RAM</th>
                                        <td><select type="text"  id="ram" name="ram" value="">
                                                <span value="${pc.getRamID()}">${ram.getRamName()}</span>
                                                <c:forEach var="ram" items="${allram}">
                                                    <option value="${ram.ramID}">${ram.ramName} - ${ram.price} VND</option>
                                                </c:forEach> 
                                            </select></td>

                                        <th>Storage</th>
                                        <td><select type="text" id="storage" name="storage" value="">
                                                <span value="${pc.getStorageID()}">${st.getStorageName()}</span>
                                                <c:forEach var="st" items="${allst}">
                                                    <option value="${st.storageID}">${st.storageName} - ${st.price} VND</option>
                                                </c:forEach> 
                                            </select></td>
                                    </tr>
                                    <tr>
                                        <th>VGA</th>
                                        <td><select type="text" id="vga" name="vga" value="" >
                                                <span value="${pc.getVgaID()}">${vga.getVgaName()}</span>
                                                <c:forEach var="vga" items="${allvga}">
                                                    <option value="${vga.vgaID}">${vga.vgaName} - ${vga.price} VND</option>
                                                </c:forEach> 
                                            </select></td>
                                    </tr> 
                                </tbody>
                            </table>
                            <button type="submit" value="Update product"><a style="text-decoration: none; color: black;">Submit</a></button>
                            <button type="button" id="back" name="back"><a href="productList" style="text-decoration: none; color: black;">Back</a></button>  
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
<script>
    function updateSalePercentage() {
        var productStatus = document.getElementById("productStatus");
        var salePercentage = document.getElementById("salePercentage");
        if (productStatus.value == "2") {
            salePercentage.readOnly = false;
        } else {
            salePercentage.value = "0";
            salePercentage.readOnly = true;
        }
    }
    function previewProductPicture(event) {
        var input = event.target;
        var preview = document.getElementById('previewImage');

        if (input.files && input.files[0]) {
            var reader = new FileReader();

            reader.onload = function (e) {
                preview.src = e.target.result;
            };

            reader.readAsDataURL(input.files[0]);
        }
    }
</script>
<script>
</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath()%>/js/scripts1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath()%>/js/datatables-simple-demo1.js"></script>
</body>
</body>

</html>
