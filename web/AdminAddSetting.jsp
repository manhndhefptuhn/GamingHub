<%-- 
    Document   : AdminAddSlider
    Created on : 09-07-2023, 16:21:55
    Author     : Zarius
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Admin Add Setting</title>
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
            .hidden-row {
                display: none;
            }
        </style>
    </head>
    <body class="sb-nav-fixed">
        <%@include file="AdminNavigation.jsp" %>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Create A Setting</h1>
                    <div class="card mb-4">
                        <form method="POST" action="createSetting">
                            <div class="card-body">
                                <c:if test="${notification != null}">
                                    <div>
                                        <strong style="color: red;">${notification}</strong>
                                    </div>
                                </c:if>
                                <table id="datatablesSimple">
                                    <tbody>
                                        <tr>
                                            <th>Type</th>
                                            <td>
                                                <select name="type" id="type">
                                                    <option value="role">Role</option>
                                                    <option value="category">Category</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Name</th>
                                            <td><input type="text" id="name" name="name" required/><br></td>
                                        </tr>
                                        <tr class="status-row">
                                            <th>Status</th>
                                            <td>
                                                <div class="button-group">
                                                    <input type="radio" id="active" name="status" value="true" required>
                                                    <label for="active">Active</label>
                                                    <input type="radio" id="deactive" name="status" value="false" required>
                                                    <label for="deactive">Not Active</label>
                                                </div>
                                            </td>
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
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="<%= request.getContextPath()%>/js/scripts1.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
        <script src="<%= request.getContextPath()%>/js/datatables-simple-demo1.js"></script>
    </body>
</html>
