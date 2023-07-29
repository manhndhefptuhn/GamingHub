<%-- 
    Document   : SaleComponentDetail
    Created on : 17-07-2023, 19:11:16
    Author     : Admin
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Sale Component Details</title>
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
                    <h1 class="mt-4">Component Detail</h1>
                    <div class="card mb-4">
                        <form method="POST" action="componentdetail" enctype='multipart/form-data'>
                            <div class="card-body">  
                                <c:if test="${notification != null}">
                                    <div>
                                        <strong style="color: greenyellow;">${notification}</strong>
                                    </div>
                                </c:if>
                                <input type="hidden" name="id" value="${id}" />
                                <input type="hidden" name="type" value="${type}" />
                                <table id="datatablesSimple">
                                    <tbody>
                                        <tr>
                                            <th>Type</th>
                                            <td>${type}</td>
                                        </tr>
                                        <tr>
                                            <th>Name</th>
                                            <td><input type="text" id="name" name="name" value="${name}"/><br></td>
                                        </tr>

                                        <tr>
                                            <th>Image </th>
                                            <td>
                                                <c:if test="${type ne 'CASE'}"><a style="color:gray; opacity:0.7">   No image</a></c:if>
                                                <c:if test="${type eq 'CASE'}">
                                                    <img id="previewImage" src="<%= request.getContextPath()%>/${image}" width="150" height="150"/>                       
                                                    <input type="file" id="image" name="image" accept="image/*" onchange="previewCaseImage(event)">
                                                </c:if>  
                                            </td>
                                        </tr>

                                        <tr>
                                            <th>Price</th>
                                            <td><input type="number" id="price" name="price" value="${price}"/><br></td>
                                        </tr>

                                        <tr>
                                            <th>Status</th>
                                            <td>
                                                 <div class="button-group">

                                                    <input type="radio" id="active" name="status" value="true" ${status == true ? 'checked' : ''} required>
                                                    <label for="active">Active</label>
                                                    <input type="radio" id="deactive" name="status" value="false" ${status == false ? 'checked' : ''} required>
                                                    <label for="deactive">Deactive</label>

                                                </div>
                                            </td>
                                        </tr>
                                </table>                                   
                                <input type="submit" name="update" value="Update" class="btn-update"/>
                            </div>
                        </form>  
                    </div>  
                    <div>
                        <p><a href="componentList" style="color:#000">‎‎‎Back to list</a></p>    
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
