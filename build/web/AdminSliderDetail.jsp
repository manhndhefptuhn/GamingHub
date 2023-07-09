<%-- 
    Document   : AdminSliderDetailGood
    Created on : 09-07-2023, 15:30:05
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
        <title>Admin Slider Detail</title>
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
    <body class="sb-nav-fixed">
        <%@include file="AdminNavigation.jsp" %>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Slider Detail</h1>
                    <div class="card mb-4">
                        <form method="POST" action="editSliderController" enctype="multipart/form-data">
                            <div class="card-body">
                                <input type="hidden" name="sliderId" value="${slider.getSliderID()}" />
                                <table id="datatablesSimple">
                                    <tbody>
                                        <tr>
                                            <th>Title</th>
                                            <td><input type="text" id="title" name="title" value="${slider.getSliderTitle()}" /><br></td>
                                        </tr>
                                        <tr>
                                            <th>Slider picture</th>
                                            <td><img id="previewImage" src="<%= request.getContextPath()%>/${slider.getSliderImage()}" alt="Slider Picture" width="150" height="150">
                                                <input type="file" id="sliderPicture" name="sliderPicture" accept="image/*" onchange="previewSliderPicture(event)"></td>
                                        </tr>
                                        <tr>
                                            <th>Backlink</th>
                                            <td> <input type="text" id="backlink" name="backlink" value="${slider.getBacklink()}" /><br></td>
                                        </tr>
                                        <tr>
                                            <th>Note</th>
                                            <td><input type="text" id="note" name="note" value="${slider.getNote()}" /><br></td>
                                        </tr>
                                        <tr>
                                            <th>Status</th>
                                            <td><input type="text" id="status" name="status" value="${slider.isStatus()}" /><br></td>
                                        </tr>
                                </table>
                                <input type="submit" name="back" value="Back" class="btn-update"/>
                                <input type="submit" name="update" value="Update" class="btn-update"/>  
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
        function previewSliderPicture(event) {
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
