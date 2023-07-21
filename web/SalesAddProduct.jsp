<%-- 
    Document   : SalesAddProduct
    Created on : Jul 11, 2023, 8:04:43 AM
    Author     : User
--%>

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
        </style>
    </head>
    <%@include file="SaleNavigation.jsp" %>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">Add New Product</h1>
                        <div class="card mb-4">
                            <form method="POST" action="" enctype="multipart/form-data">
                                <c:set var="userDetail" value="${requestScope.userDetail}" />
                                <div class="card-body">
                                    <table id="datatablesSimple">
                                        <tbody>
                                            <tr>
                                                <th>Product Name</th>
                                                <td><input type="text" id="ProductName" name="ProductName" value=""/><br></td>
                                            </tr>
                                            <tr>
                                                <th>Description</th>
                                                <td><input type="text" id="desc" name="desc" value="" /><br></td>
                                            </tr>
                                            <tr>
                                                <th>Status</th>
                                                <td><select type="status" id="status" name="status" placeholder="">
                                                        <option value="1">Active</option>
                                                        <option value="0">Inactive</option>
                                                    </select></td>
                                            </tr>
                                           <tr>
                                                <th>Quantity</th>
                                                <td><input type="text" id="quantity" name="quantity" value="" /><br></td>
                                            </tr>
                                            <tr>
                                                <th>Product Status</th>
                                                <td>
                                                    
                                                    <select  id="prodstatus" name="prodstatus" value="">
                                                        <option value="0">Normal</option>
                                                        <option value="1">New</option>
                                                        <option value="2">Sale</option>                                                      
                                                    </select></td>
                                            </tr>
                                            <tr>
                                                <th>Sale Percentage</th>
                                                <td><input type="text" id="saleperc" name="saleperc" value=""/><br></td>
                                            </tr>
                                            <tr>
                                                <th>Category</th>
                                                <td><select  id="CPU" name="CPU" >
                                                        <option value="1">Gaming</option>
                                                        <option value="2">MiniPC</option>
                                                        <option value="3">WorkStation</option>                                                      
                                                    </select></td>
                                                
                                            </tr>
                                            <tr>
                                                <th>CPU</th>
                                                <td><select  type="text" id="cpu" name="cpu" valuee="" >
                                                        <option value="1">INTEL Xeon Max 9462</option>
                                                        
                                                    </select></td>
                                                    <<th></th>
                                                    
                                            </tr>
                                            <tr>
                                                <th>CASE</th>
                                                <td><select type="text" id="case" name="case" value="">
                                                        <option value="1"></option>
                                                        
                                                    </select></td>
                                            </tr>
                                            <tr>
                                                <th>Mainboard</th>
                                                <td><select  type="text" id="mainboard" name="mainboard" value="">
                                                        <option value="1"></option>
                                                                                                             
                                                    </select></td>
                                            </tr>
                                            <tr>
                                                <th>PSU</th>
                                                <td><select type="text"  id="psu" name="psu" value="">
                                                        <option value="1">Jetek A200M</option>
                                                                                                             
                                                    </select></td>
                                            </tr>
                                            <tr>
                                                <th>Storage</th>
                                                <td><select type="text" id="storage" name="storage" value="">
                                                        <option value="1">WD Blue</option>
                                                                                                            
                                                    </select></td>
                                            </tr>
                                            <tr>
                                                <th>VGA</th>
                                                <td><select type="text" id="VGA" name="VGA" value="" >
                                                        <option value="1">GIGABYTE GeForce RTX 4090 GAMING OC 24G</option>
                                                                                                             
                                                    </select></td>
                                            </tr> 
                                        </tbody>
                                    </table>
                                    <input type="submit" name="createProduct" value="Create product" class="btn-update"/>
                                    <input type="submit" name="Cancel" value="Cancel" class="btn-update"/>  
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
