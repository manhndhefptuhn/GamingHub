<%-- 
    Document   : SalesViewCustomer
    Created on : Jun 9, 2023, 11:49:16 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Update customer</title>
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style2.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/css/bootstrap.min.css">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/scss/extra/userProfile.scss">
        <link rel="stylesheet" href="<%= request.getContextPath()%>/js/">
    </head>
    <body>
        <div class="container">
            <div class="row gutters">
                <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
                    <div class="card h-100">
                        <div class="card-body">
                            <div class="account-settings">
                                <div class="user-profile">
                                    <div class="user-avatar">
                                        <img src="https://bootdey.com/img/Content/avatar/avatar7.png"  id="profile-pic" alt="User">
                                        
                                    </div>

                                </div>
                                <div class="about">



                                </div>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
                    <div class="card h-100">
                        <div class="card-body">
                            <form id="customer-form" action="ViewCustomerController" method="post" >
                                <input type="hidden" name="user_ID" value="${customer.getUser_ID()}" />
                                <div class="row gutters">
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="fullName">Full Name</label>
                                            <input type="text" class="form-control" id="fullName" name="fullName" value="${customer.getFullName()}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="email">Email</label>
                                            <input type="email" class="form-control" id="email" name="email" value="${customer.getEmail()}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="phone">Phone</label>
                                            <input type="tel" class="form-control" id="phone" name="phoneNumber" value="${customer.getPhone_Number()}" readonly>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <div class="form-group">
                                            <label for="address">Address</label>
                                            <input type="text" class="form-control" id="address" name="address" value="${customer.getAddress()}" readonly>
                                        </div>
                                    </div>
                                </div>
                                <div class="row gutters">
                                    <div class="col-lg-12">
                                        <div class="text-right">
                                            <div class="row gutters">
                                            </div>
                                            <div class="row gutters">
                                                <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
                                                    <div class="text-right">


                                                        <button type="button" id="back" name="back" class="btn btn-dark"><a href="CustomerListController" style="color: white">Back</a></button>
                                                    </div>
                                                </div>
                                            </div>
                                            </form>
                                        </div>
                                    </div>
                                </div>
                        </div>
                    </div>
                    <!--<script>-->
                    <!--    let profilePic = document.getElementById("profile-pic");-->
                    <!--    let inputFile = document.getElementById("input-img");-->

                    <!--    inputFile.onchange = function (){-->
                    <!--        profilePic.src = URL.createObjectURL(inputFile.files[0]);-->
                    <!--    }-->
                    <!--</script>-->
                    </body>

                    </html>