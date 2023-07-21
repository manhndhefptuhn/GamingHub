<%-- 
    Document   : SalesAddProduct
    Created on : Jul 11, 2023, 8:04:43 AM
    Author     : User
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Sale Product Detail</title>
        <link rel="icon" type="image/png" href="<%= request.getContextPath()%>/img/shop/logo1.png"/>
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
            select option[selected] {
                background-color: #C5C5C5;
                font-weight: bold;
            }
            .previewImage {
                width: 150px;
                height: 150px;
                object-fit: cover;
                margin-right: 10px;
                margin-bottom: 10px;
            }
        </style>
    </head>
    <%@include file="SaleNavigation.jsp" %>
    <div id="layoutSidenav_content">
        <main>
            <div class="container-fluid px-4">
                <h1 class="mt-4">Product Detail</h1>
                <div class="card mb-4">
                    <form method="post" action="UpdateProductController" enctype="multipart/form-data" id="productForm">
                        <input type="hidden" name="action" id="actionInput">
                        <c:set var="product" value="${requestScope.product}" />
                        <input type="hidden" name="productID" value="${product.getProductID()}">
                        <div class="card-body">
                            <c:if test="${notification != null}">
                                <div>
                                    <strong style="color: red;">${notification}</strong>
                                </div>
                            </c:if>
                            <table id="datatablesSimple">
                                <tbody>
                                    <tr>
                                        <th>Product Name</th>
                                        <td><input id="productName" name="productName" value="${product.getProductName()}" required/><br></td>
                                    </tr>
                                    <tr>
                                        <th>Description</th>
                                        <td><input style="width: 100%; box-sizing: border-box;" id="description" name="description" value="${product.getDescription()}"/><br></td>
                                    </tr>
                                    <tr>
                                        <th>Status</th>
                                        <td>
                                            <div class="button-group">
                                                <input type="radio" id="active" name="status" value="true" ${product.isStatus() == true ? 'checked' : ''} required>
                                                <label for="active">Active</label>
                                                <input type="radio" id="deactive" name="status" value="false" ${product.isStatus() == false ? 'checked' : ''} required>
                                                <label for="deactive">Not Active</label>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Quantity</th>
                                        <td><input type="number" id="quantity" name="quantity" value="${product.getQuantity()}" min="0" required/><br></td>
                                    </tr>
                                    <tr>
                                        <th>Product Status</th>
                                        <td>    
                                            <select required name="productStatus" id="productStatus" onchange="updateSalePercentage()">
                                                <c:forEach var="ps" items="${allprs}">
                                                    <c:choose>
                                                        <c:when test="${ps.productStatusID == product.getProductStatusID()}">
                                                            <option value="${ps.productStatusID}" selected="selected">${ps.productStatusName}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${ps.productStatusID}">${ps.productStatusName}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Sale Percentage</th>
                                        <td>
                                            <c:choose>
                                                <c:when test="${product.getProductStatusID() == 2}">
                                                    <input required type="number" id="salePercentage" name="salePercentage" value="${product.getSalePercentage()}" max="100">
                                                </c:when>
                                                <c:otherwise>
                                                    <input style="background-color: #C5C5C5;" type="number" id="salePercentage" name="salePercentage" value="0" readonly>
                                                </c:otherwise>
                                            </c:choose>
                                            <br>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Category</th>
                                        <td>
                                            <select required name="category" id="category">
                                                <c:forEach var="c" items="${allcate}">
                                                    <c:choose>
                                                        <c:when test="${c.getCategoryID() == product.getCategoryID()}">
                                                            <option value="${product.getCategoryID()}" selected="selected">${c.getCategoryName()}</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${c.getCategoryID()}">${c.getCategoryName()}</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>CPU</th>
                                        <td>
                                            <select required name="cpu" id="cpu">
                                                <c:forEach var="cpu" items="${allcpu}">
                                                    <c:choose>
                                                        <c:when test="${pc.getCpuID() == cpu.getCpuID()}">
                                                            <option value="${pc.getCpuID()}" data-price="${cpu.getPrice()}" selected="selected">${cpu.getCpuName()} - <fmt:formatNumber pattern="#,##0" value="${cpu.getPrice()}"/> VNÐ</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${cpu.getCpuID()}" data-price="${cpu.getPrice()}">${cpu.getCpuName()} - <fmt:formatNumber pattern="#,##0" value="${cpu.getPrice()}"/> VNÐ</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>CASE</th>
                                        <td>
                                            <select required id="case" name="case">
                                                <c:forEach var="ca" items="${allca}">
                                                    <c:choose>
                                                        <c:when test="${pc.getCaseID() == ca.getCaseID()}">
                                                            <option value="${pc.getCaseID()}" data-price="${ca.getPrice()}" selected="selected">${ca.getCaseName()} - <fmt:formatNumber pattern="#,##0" value="${ca.getPrice()}"/> VNÐ</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${ca.getCaseID()}" data-price="${ca.getPrice()}">${ca.getCaseName()} - <fmt:formatNumber pattern="#,##0" value="${ca.getPrice()}"/> VNÐ</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Mainboard</th>
                                        <td>
                                            <select required id="mainboard" name="mainboard">
                                                <c:forEach var="mb" items="${allmb}">
                                                    <c:choose>
                                                        <c:when test="${pc.getMainboardID() == mb.getMainboardID()}">
                                                            <option value="${pc.getMainboardID()}" data-price="${mb.getPrice()}" selected="selected">${mb.getMainboardName()} - <fmt:formatNumber pattern="#,##0" value="${mb.getPrice()}"/> VNÐ</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${mb.getMainboardID()}" data-price="${mb.getPrice()}">${mb.getMainboardName()} - <fmt:formatNumber pattern="#,##0" value="${mb.getPrice()}"/> VNÐ VNÐ</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>PSU</th>
                                        <td>
                                            <select required id="psu" name="psu">
                                                <c:forEach var="psu" items="${allpsu}">
                                                    <c:choose>
                                                        <c:when test="${pc.getPsuID() == psu.getPsuID()}">
                                                            <option value="${pc.getPsuID()}" data-price="${psu.getPrice()}" selected="selected">${psu.getPsuName()} - <fmt:formatNumber pattern="#,##0" value="${psu.getPrice()}"/> VNÐ</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${psu.getPsuID()}" data-price="${psu.getPrice()}">${psu.getPsuName()} - <fmt:formatNumber pattern="#,##0" value="${psu.getPrice()}"/> VNÐ</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>RAM</th>
                                        <td>
                                            <select required id="ram" name="ram">
                                                <c:forEach var="ram" items="${allram}">
                                                    <c:choose>
                                                        <c:when test="${pc.getRamID() == ram.getRamID()}">
                                                            <option value="${pc.getRamID()}" data-price="${ram.getPrice()}" selected="selected">${ram.getRamName()} - <fmt:formatNumber pattern="#,##0" value="${ram.getPrice()}"/> VNÐ</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${ram.getRamID()}" data-price="${ram.getPrice()}">${ram.getRamName()} - <fmt:formatNumber pattern="#,##0" value="${ram.getPrice()}"/> VNÐ</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>Storage</th>
                                        <td>
                                            <select required id="storage" name="storage">
                                                <c:forEach var="st" items="${allst}">
                                                    <c:choose>
                                                        <c:when test="${pc.getStorageID() == st.getStorageID()}">
                                                            <option value="${pc.getStorageID()}" data-price="${st.getPrice()}" selected="selected">${st.getStorageName()} - <fmt:formatNumber pattern="#,##0" value="${st.getPrice()}"/> VNÐ</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${st.getStorageID()}" data-price="${st.getPrice()}">${st.getStorageName()} - <fmt:formatNumber pattern="#,##0" value="${st.getPrice()}"/> VNÐ</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
                                        </td>
                                    </tr>
                                    <tr>
                                        <th>VGA</th>
                                        <td>
                                            <select required id="vga" name="vga">
                                                <c:forEach var="vga" items="${allvga}">
                                                    <c:choose>
                                                        <c:when test="${pc.getVgaID() == vga.getVgaID()}">
                                                            <option value="${pc.getVgaID()}" data-price="${vga.getPrice()}" selected="selected">${vga.getVgaName()} - <fmt:formatNumber pattern="#,##0" value="${vga.getPrice()}"/> VNÐ</option>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <option value="${vga.getVgaID()}" data-price="${vga.getPrice()}">${vga.getVgaName()} - <fmt:formatNumber pattern="#,##0" value="${vga.getPrice()}"/> VNÐ</option>
                                                        </c:otherwise>
                                                    </c:choose>
                                                </c:forEach>
                                            </select>
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
                                    <tr>
                                        <th>Product Images</th>
                                        <td>
                                            <div id="imagePreviewContainer">
                                                <c:forEach var="image" items="${listImageOfProduct}">
                                                    <img id="previewImage" src="<%= request.getContextPath()%>/${image.getImages()}" width="150" height="150"/>
                                                    <a href="deleteProductImages?images=${image.getImages()}&productID=${product.getProductID()}" style="color: red" onclick="return confirm('Delete this image?');">Delete</a>
                                                </c:forEach>
                                            </div>
                                            <input type="file" id="productImages" name="productImages" accept="image/*" multiple="" onchange="previewProductImages(event)">
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                            <input type="submit" name="update" value="Update" class="btn-update"/>  
                            <input type="button" name="back" value="Back" class="btn-update" onclick="backToProductList()"/>
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
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
                                function updateSalePercentage() {
                                    var productStatus = document.getElementById("productStatus");
                                    var salePercentage = document.getElementById("salePercentage");
                                    if (productStatus.value === "2") {
                                        salePercentage.readOnly = false;
                                        salePercentage.value = `${product.getSalePercentage()}`;
                                        salePercentage.style.backgroundColor = "white";
                                    } else {
                                        salePercentage.value = "0";
                                        salePercentage.readOnly = true;
                                        salePercentage.style.backgroundColor = "#C5C5C5";
                                    }
                                }



                                function backToProductList() {
                                    // Set the value of the hidden input field
                                    document.getElementById("actionInput").value = "back";

                                    // Submit the form
                                    document.getElementById("productForm").submit();
                                }

                                document.addEventListener('DOMContentLoaded', function () {
                                    new simpleDatatables.DataTable('#datatablesSimple', {
                                        paging: false // Disable pagination
                                    });
                                });
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
<script>
    function previewProductImages(event) {
        var fileInput = event.target;
        var imagePreviewContainer = document.getElementById("imagePreviewContainer");

        // Clear existing image previews
        imagePreviewContainer.innerHTML = "";

        // Iterate over selected files
        for (var i = 0; i < fileInput.files.length; i++) {
            var file = fileInput.files[i];

            // Create an image element for each file
            var imageElement = document.createElement("img");
            imageElement.classList.add("previewImage");

            // Set the image source to the file object URL
            imageElement.src = URL.createObjectURL(file);

            // Append the image element to the container
            imagePreviewContainer.appendChild(imageElement);
        }
    }

    document.addEventListener('DOMContentLoaded', function () {
        // Attach the function to the file input change event
        var fileInput = document.getElementById("productImages");
        if (fileInput) {
            fileInput.addEventListener("change", previewProductImages);
        }
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath()%>/js/scripts1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath()%>/js/datatables-simple-demo1.js"></script>
</body>

</html>
