<%-- 
    Document   : SaleAddComponent
    Created on : Jul 20, 2023, 7:01:12 PM
    Author     : admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Sale Add Component</title>
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
        </style>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="SaleNavigation.jsp" %>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Add component</h1>
                    <div class="card mb-4">
                        <form method="POST" action="AddComponent" enctype='multipart/form-data'><!-- multipart/form-data -->
                            <div class="card-body">  
                                <c:if test="${notification != null}">
                                    <div>
                                        <strong style="color: greenyellow;">${notification}</strong>
                                    </div>
                                </c:if>
                                <table id="datatablesSimple">
                                    <tbody>
                                        <tr>
                                            <th>Select type</th>
                                            <td>
                                                <select name ="type">
                                                    <option value="mainboard">Mainboard</option>
                                                    <option value="cpu">CPU</option>
                                                    <option value="case">Case</option>
                                                    <option value="vga">VGA</option>
                                                    <option value="psu">PSU</option> 
                                                    <option value="ram">RAM</option>
                                                    <option value="storage">Storage</option>
                                                </select>
                                                <br></td>
                                        </tr>
                                        <tr>
                                            <th>Component name</th>
                                            <td><input type="text" id="name" name="name" placeholder="Enter name"/><br></td>
                                        </tr>

                                        <tr>
                                            <th>Component Price</th>
                                            <td><input type="number" id="price" name="price" placeholder="Price VND"/> VNÐ<br></td>
                                        </tr>

                                        <tr>
                                            <th>Status</th>
                                            <td>
                                                <div class="button-group">

                                                    <input type="radio" id="active" name="status" value="true" required>
                                                    <label for="active">Active</label>
                                                    <input type="radio" id="deactive" name="status" value="false" required>
                                                    <label for="deactive">Deactive</label>

                                                </div>
                                            </td>
                                        </tr>

                                        <tr>
                                            <th>Image </th>
                                            <td>

                                                <img id="previewImage" width="150" height="150"/>                       
                                                <input type="file" id="image" name="image" accept="image/*" onchange="previewCaseImage(event)">

                                            </td>
                                        </tr>

                                </table>                                   
                                <input type="submit" name="add" value="Add component" class="btn-update"/>
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
        function previewCaseImage(event) {
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
</html>

