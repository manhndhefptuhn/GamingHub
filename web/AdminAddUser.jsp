<%-- 
    Document   : AdminAddUser
    Created on : Jun 9, 2023, 11:07:08 AM
    Author     : User
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
        </style>
    </head>
    <body class="sb-nav-fixed">
        <nav class="sb-topnav navbar navbar-expand navbar-dark bg-dark">
            <!-- Navbar Brand-->
            <a class="navbar-brand ps-3" href="#">Gaming Hub</a>
            <!-- Sidebar Toggle-->
            <button class="btn btn-link btn-sm order-1 order-lg-0 me-4 me-lg-0" id="sidebarToggle" href="#!"><i class="fas fa-bars"></i></button>
            <!-- Navbar Search-->
            <form class="d-none d-md-inline-block form-inline ms-auto me-0 me-md-3 my-2 my-md-0">
            </form>
            <!-- Navbar-->
            <ul class="navbar-nav ms-auto ms-md-0 me-3 me-lg-4">
                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" id="navbarDropdown" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false"><i class="fas fa-user fa-fw"></i></a>
                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown">
                        <li><a class="dropdown-item" href="home">Home</a></li>
                        <li><a class="dropdown-item" href="userProfile">User Profile</a></li>
                        <li><hr class="dropdown-divider"/></li>
                        <li><a class="dropdown-item" href="logout">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
        <div id="layoutSidenav">
            <div id="layoutSidenav_nav">
                <nav class="sb-sidenav accordion sb-sidenav-dark" id="sidenavAccordion">
                    <div class="sb-sidenav-menu">
                        <div class="nav">
                            <div class="sb-sidenav-menu-heading">Head</div>
                            <a class="nav-link" href="#">
                                <div class="sb-nav-link-icon"><i class="fa fa-pie-chart"></i></div>
                                Dashboard
                            </a>
                            <div class="sb-sidenav-menu-heading">Management</div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayouts" aria-expanded="false" aria-controls="collapseLayouts">
                                <div class="sb-nav-link-icon"><i class="fa fa-user"></i></div>
                                User Management
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayouts" aria-labelledby="headingOne" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="userList">User List</a>
                                    <a class="nav-link" href="#">Add An User</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayoutsTwo" aria-expanded="false" aria-controls="collapseLayoutsTwo">
                                <div class="sb-nav-link-icon"><i class="fa fa-folder-open"></i></div>
                                Slider Management
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayoutsTwo" aria-labelledby="headingTwo" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="sliderList">Slider List</a>
                                    <a class="nav-link" href="AdminAddSlider.jsp">Add A Slider</a>
                                </nav>
                            </div>
                            <a class="nav-link collapsed" href="#" data-bs-toggle="collapse" data-bs-target="#collapseLayoutsThree" aria-expanded="false" aria-controls="collapseLayoutsThree">
                                <div class="sb-nav-link-icon"><i class="fa fa-cogs"></i></div>
                                Setting Management
                                <div class="sb-sidenav-collapse-arrow"><i class="fas fa-angle-down"></i></div>
                            </a>
                            <div class="collapse" id="collapseLayoutsThree" aria-labelledby="headingThree" data-bs-parent="#sidenavAccordion">
                                <nav class="sb-sidenav-menu-nested nav">
                                    <a class="nav-link" href="#">Setting List</a>
                                    <a class="nav-link" href="#">???</a>
                                </nav>
                            </div>
                        </div>
                    </div>  
                    <div class="sb-sidenav-footer">
                        <c:if test="${sessionScope.user != null}">
                            <div class="small">Logged in as: ${sessionScope.user.getFullName()}</div>
                        </c:if>
                    </div>
                </nav>
            </div>
            <div id="layoutSidenav_content">
                <main>
                    <div class="container-fluid px-4">
                        <h1 class="mt-4">User Detail</h1>
                        <div class="card mb-4">
                            <form method="POST" action="" enctype="multipart/form-data">
                                <c:set var="userDetail" value="${requestScope.userDetail}" />
                                <div class="card-body">
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
                                                <td><input type="text" id="phone" name="phone" placeholder="Enter phone number" value="${userDetail.getPhone_Number()}"/><br></td>
                                            </tr>
                                            <tr>
                                                <th>Address</th>
                                                <td><input type="text" id="address" name="address" value="${userDetail.getAddress()}"/><br></td>
                                            </tr>
                                            <tr>
                                                <th>Status</th>
                                                <td><input type="text" id="status" name="status" value="${userDetail.isStatus()}"/><br></td>
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