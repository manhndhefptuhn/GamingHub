<%-- 
    Document   : AdminUserDetailGood
    Created on : 09-07-2023, 15:49:42
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
        <title>Admin User Detail</title>
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
                    <h1 class="mt-4">User Detail</h1>
                    <div class="card mb-4">
                        <form method="POST" action="editUserController" enctype="multipart/form-data">
                            <c:set var="userDetail" value="${requestScope.userDetail}" />
                            <div class="card-body">
                                <c:if test="${notification != null}">
                                    <div>
                                        <strong style="color: red;">${notification}</strong>
                                    </div>
                                </c:if>
                                <input type="hidden" name="userID" value="${userDetail.getUser_ID()}" />
                                <table id="datatablesSimple">
                                    <tbody>
                                        <tr>
                                            <th>Name</th>
                                            <td><input type="text" id="name" name="fullName" value="${userDetail.getFullName()}"/><br></td>
                                        </tr>
                                        <tr>
                                            <th>Email</th>
                                            <td><input style="background-color:#C5C5C5;" type="email" id="email" name="email" value="${userDetail.getEmail()}" readonly/><br></td>
                                        </tr>
                                        <tr>
                                            <th>Password</th>
                                            <td><input type="password" id="password" name="password" value="${userDetail.getPassword()}"/><br></td>
                                        </tr>
                                        <tr>
                                            <th>Profile Picture</th>
                                            <td><img id="previewImage" src="<%= request.getContextPath()%>/${userDetail.getProfile_picture()}" width="150" height="150"/>
                                                <input type="file" id="profilePicture" name="profilePicture" accept="image/*" onchange="previewProfilePicture(event)"></td>
                                        </tr>
                                        <tr>
                                            <th>Phone Number</th>
                                            <td><input type="text" id="phone" name="phone" placeholder="Enter phone number" value="${userDetail.getPhone_Number()}"/><br>
                                                <strong id="notification" style="display: none; color: red;"></strong>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Address</th>
                                            <td><input type="text" id="address" name="address" value="${userDetail.getAddress()}"/><br></td>
                                        </tr>
                                        <tr>
                                            <th>Status</th>
                                            <td><div class="button-group">
                                                    <c:choose>
                                                        <c:when test="${userDetail.getRole_ID() == 4}">
                                                            <input type="radio" id="active" name="status" value="true" ${userDetail.isStatus() == true ? 'checked' : ''} required>
                                                            <label for="active">Active</label>
                                                        </c:when>
                                                        <c:otherwise>
                                                            <input type="radio" id="active" name="status" value="true" ${userDetail.isStatus() == true ? 'checked' : ''} required>
                                                            <label for="active">Active</label>
                                                            <input type="radio" id="deactive" name="status" value="false" ${userDetail.isStatus() == false ? 'checked' : ''} required>
                                                            <label for="deactive">Not Active</label>
                                                        </c:otherwise>
                                                    </c:choose>

                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Role Name</th>
                                            <td>
                                                <select name="role" id="role">
                                                    <option value="${userDetail.getRole_ID()}">${userRole}</option>
                                                    <c:forEach var="listRole" items="${listRole}">
                                                        <c:if test="${listRole.getRoleID() ne userDetail.getRole_ID()}">
                                                            <option value="${listRole.getRoleID()}">${listRole.getRoleName()}</option>
                                                        </c:if> 
                                                    </c:forEach>
                                                </select>
                                            </td>
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
        <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script>
                                                    $(document).ready(function () {
                                                        $('form').submit(function (event) {
                                                            const phoneNumber = $('#phone').val();
                                                            if (phoneNumber.length !== 10) {
                                                                event.preventDefault();
                                                                $('#notification').text('Please enter a 10-digit phone number').show();
                                                            } else if(phoneNumber.length === 10){
                                                                $('#notification').hide();
                                                            }
                                                        });
                                                    });
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
</html>
