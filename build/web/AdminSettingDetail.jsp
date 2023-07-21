<%-- 
    Document   : AdminSettingDetail
    Created on : 09-07-2023, 15:30:05
    Author     : Zarius
--%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Admin Setting Detail</title>
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
        <%@include file="AdminNavigation.jsp" %>
        <div id="layoutSidenav_content">
            <main>
                <div class="container-fluid px-4">
                    <h1 class="mt-4">Setting Detail</h1>
                    <div class="card mb-4">
                        <form method="POST" action="updateSetting" id="settingForm">
                            <input type="hidden" name="action" id="actionInput">
                            <div class="card-body">
                                <c:if test="${notification != null}">
                                    <div>
                                        <strong style="color: red;">${notification}</strong>
                                    </div>
                                </c:if>
                                <c:if test="${role != null}">
                                    <input type="hidden" name="type" value="role">
                                    <table id="datatablesSimple">
                                        <tbody>
                                            <tr>
                                                <th>ID</th>
                                                <td><input style="background-color:#C5C5C5;" type="text" id="roleID" name="roleID" value="${role.getRoleID()}" readonly/><br></td>
                                            </tr>
                                            <tr>
                                                <th>Name</th>
                                                <td><input type="text" id="roleName" name="roleName" value="${role.getRoleName()}" required/><br></td>
                                            </tr>
                                            <tr>
                                                <th>Status</th>
                                                <td>
                                                    <div class="button-group">
                                                        <input type="radio" id="active" name="status" value="true" ${role.isStatus() == true ? 'checked' : ''} required>
                                                        <label for="active">Active</label>
                                                        <input type="radio" id="deactive" name="status" value="false" ${role.isStatus() == false ? 'checked' : ''} required>
                                                        <label for="deactive">Not Active</label>
                                                    </div>
                                                </td>
                                            </tr>
                                    </table>
                                </c:if>
                                <c:if test="${category != null}">
                                    <input type="hidden" name="type" value="category">
                                    <table id="datatablesSimple">
                                        <tbody>
                                            <tr>
                                                <th>ID</th>
                                                <td><input style="background-color:#C5C5C5;" type="text" id="categoryID" name="categoryID" value="${category.getCategoryID()}" readonly/><br></td>
                                            </tr>
                                            <tr>
                                                <th>Name</th>
                                                <td><input type="text" id="categoryName" name="categoryName" value="${category.getCategoryName()}" required/><br></td>
                                            </tr>
                                            <tr>
                                                <th>Status</th>
                                                <td>
                                                    <div class="button-group">
                                                        <input type="radio" id="active" name="status" value="true" ${category.isStatus() == true ? 'checked' : ''} required>
                                                        <label for="active">Active</label>
                                                        <input type="radio" id="deactive" name="status" value="false" ${category.isStatus() == false ? 'checked' : ''} required>
                                                        <label for="deactive">Not Active</label>
                                                    </div>
                                                </td>
                                            </tr>
                                    </table>
                                </c:if>
                                <input type="button" name="back" value="Back" class="btn-update" onclick="backToSettingList()"/>
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
        function backToSettingList() {
            // Set the value of the hidden input field
            document.getElementById("actionInput").value = "back";

            // Submit the form
            document.getElementById("settingForm").submit();
        }
    </script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
    <script src="<%= request.getContextPath()%>/js/scripts1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/simple-datatables@7.1.2/dist/umd/simple-datatables.min.js" crossorigin="anonymous"></script>
    <script src="<%= request.getContextPath()%>/js/datatables-simple-demo1.js"></script>
</body>
</html>
