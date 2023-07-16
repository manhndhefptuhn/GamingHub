<%-- 
    Document   : SalesAddProduct
    Created on : Jul 11, 2023, 8:04:43 AM
    Author     : User
--%>
<%@ page import="Model.ProductStatus" %>
<%@ page import="DAL.ProductDAO" %>
<%@ page import="DAL.CategoryDAO" %>
<%@ page import="Model.Category" %>
<%@ page import="Model.CPU" %>
<%@ page import="Model.Case" %>
<%@ page import="Model.Mainboard" %>
<%@ page import="Model.PSU" %>
<%@ page import="Model.RAM" %>
<%@ page import="Model.Storage" %>
<%@ page import="Model.VGA" %>
<%@ page import="DAL.CPUDAO" %>
<%@ page import="DAL.CaseDAO" %>
<%@ page import="DAL.MainboardDAO" %>
<%@ page import="DAL.PSUDAO" %>
<%@ page import="DAL.RAMDAO" %>
<%@ page import="DAL.StorageDAO" %>
<%@ page import="DAL.VGADAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%-- 
    Document   : AdminAddUser
    Created on : Jun 9, 2023, 11:07:08 AM
    Author     : User
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Add New Product</title>
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
                <h1 class="mt-4">Add New Product</h1>
                <div class="card mb-4">
                    <form method="post" action="CreateProductController" enctype="">
                        <c:set var="userDetail" value="${requestScope.userDetail}" />
                        <div class="card-body">
                            <% String message = (String) request.getAttribute("message"); %>
                            <% if (message != null) { %>
                            <p><%= message %></p>
                            <% } %>
                            <table id="datatablesSimple">
                                <tbody>
                                    <tr>
                                        <th>Product Name</th>
                                        <td><input type="text" id="productName" name="productName" value="" required/><br><br></td>
                                    </tr>
                                    <tr>
                                        <th>Description</th>
                                        <td><textarea id="description" name="description"></textarea><br><br></td>
                                    </tr>
                                    <tr>
                                        <th>Status</th>
                                        <td><select type="status" id="status" name="status" placeholder="">
                                                <option value="true" ${product.isStatus() ? 'selected' : ''}>Active</option>
                                                <option value="false" ${!product.isStatus() ? 'selected' : ''}>Deactive</option>
                                            </select><br><br></td>
                                    </tr>
                                    <tr>
                                        <th>Quantity</th>
                                        <td><input type="number" id="quantity" name="quantity" min="0" required/><br><br></td>
                                    </tr>
                                    <tr>
                                        <th>Product Status</th>
                                        <td>

                                            <select name="productStatus" id="productStatus" onchange="updateSalePercentage()">
                                                <option value="">-- Select Product Status --</option>
                                                <% for (ProductStatus ps : new ProductDAO().getAllProductStatus()) { %>
                                                <option value="<%= ps.getProductStatusID() %>"><%= ps.getProductStatusName() %></option>
                                                <% } %>                                                      
                                            </select><br><br></td>
                                    </tr>
                                    <tr>
                                        <th>Sale Percentage</th>
                                        <td><input type="text" id="salePercentage" name="salePercentage" value="0" max="100" readonly><br><br></td>
                                    </tr>
                                    <tr>
                                        <th>Category</th>
                                        <td><select  id="category" name="category" >
                                                <option value="">-- Select Category --</option>
                                                <% for (Category c : new CategoryDAO().getAllCategory()) { %>
                                                <option value="<%= c.getCategoryID() %>"><%= c.getCategoryName() %></option>
                                                <% } %>                                                     
                                            </select><br><br></td>

                                    </tr>
                                    <tr>
                                        <th>CPU</th>
                                        <td><select  type="text" id="cpu" name="cpu" value="" >
                                                <option value="">-- Select CPU --</option>
                                                <% for (CPU cpu : new CPUDAO().getAllCPU()) { %>
                                                <option value="<%= cpu.getCpuID() %>"><%= cpu.getCpuName() %> - <%=cpu.getPrice()%> VND</option>
                                                <% } %>
                                            </select><br><br></td>
                                        <<th></th>

                                    </tr>
                                    <tr>
                                        <th>CASE</th>
                                        <td><select type="text" id="case" name="case" value="">
                                                <option value="">-- Select Case --</option>
                                                <% for (Case ca : new CaseDAO().getAllCase()) { %>
                                                <option value="<%= ca.getCaseID() %>"><%= ca.getCaseName() %> - <%=ca.getPrice()%> VND</option>
                                                <% } %>
                                            </select><br><br></td>
                                    </tr>
                                    <tr>
                                        <th>Mainboard</th>
                                        <td><select  type="text" id="mainboard" name="mainboard" value="">
                                                <option value="">-- Select Mainboard --</option>
                                                <% for (Mainboard mb : new MainboardDAO().getAllMainboard()) { %>
                                                <option value="<%= mb.getMainboardID() %>"><%= mb.getMainboardName() %> - <%=mb.getPrice()%> VND</option>
                                                <% } %>
                                            </select><br><br></td>
                                    </tr>
                                    <tr>
                                        <th>PSU</th>
                                        <td><select type="text"  id="psu" name="psu" value="">
                                                <option value="">-- Select PSU --</option>
                                                <% for (PSU psu : new PSUDAO().getAllPSU()) { %>
                                                <option value="<%= psu.getPsuID() %>"><%= psu.getPsuName() %> - <%=psu.getPrice()%> VND</option>
                                                <% } %>
                                            </select><br><br></td>
                                    </tr>
                                    <tr>
                                        <th>RAM</th>
                                        <td><select type="text"  id="ram" name="ram" value="">
                                                <option value="">-- Select RAM --</option>
                                                <% for (RAM r : new RAMDAO().getAllRAM()) { %>
                                                <option value="<%= r.getRamID() %>"><%= r.getRamName() %> - <%=r.getPrice()%> VND</option>
                                                <% } %>
                                            </select><br><br></td>
                                    </tr>
                                    <tr>
                                        <th>Storage</th>
                                        <td><select type="text" id="storage" name="storage" value="">
                                                <option value="">-- Select Storage --</option>
                                                <% for (Storage st : new StorageDAO().getAllStorage()) { %>
                                                <option value="<%= st.getStorageID() %>"><%= st.getStorageName() %> - <%=st.getPrice()%> VND</option>
                                                <% } %>
                                            </select><br><br></td>
                                    </tr>
                                    <tr>
                                        <th>VGA</th>
                                        <td><select type="text" id="vga" name="vga" value="" >
                                                <option value="">-- Select VGA --</option>
                                                <% for (VGA vga: new VGADAO().getAllVGA()) { %>
                                                <option value="<%= vga.getVgaID() %>"><%= vga.getVgaName() %> - <%=vga.getPrice()%> VND</option>
                                                <% } %>
                                            </select><br><br></td>
                                    </tr> 
                                </tbody>
                            </table>
                            <button type="submit" value="Create product"><a style="text-decoration: none; color: black;">Submit</a></button>
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
</script>
<script>
    function previewProfilePicture(event) {
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath()%>/js/scripts1.js"></script>
<script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
<script src="<%= request.getContextPath()%>/js/datatables-simple-demo1.js"></script>
</body>
</body>

</html>
