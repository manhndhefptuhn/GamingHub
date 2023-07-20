<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Edit Role</title>
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
                    <h1 class="mt-4">Edit Role</h1>
                    <div class="card mb-4">
                        <form method="POST" action="updateRoleController">
                            <table id="datatablesSimple">
                                <tbody>
                                    <tr>
                                        <th>Role ID: </th>
                                        <td><input name="roleID" value="${roles.getRoleID()}" readonly/></td>
                                    </tr>
                                    
                                    <tr>
                                        <th>Role name</th>
                                        <td><input type="text" id="roleName" name="roleName" value="${roles.getRoleName()}" /><br></td>
                                    </tr>
                                </tbody>
                            </table>
                            <input type="submit" name="update" value="Update" class="btn-update"/> 
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
        </script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
            <script src="<%= request.getContextPath()%>/js/scripts1.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
            <script src="<%= request.getContextPath()%>/js/datatables-simple-demo1.js">
        </script>
    </body>
</html>
