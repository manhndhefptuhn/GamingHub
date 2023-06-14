<%-- 
    Document   : AdminAddUser
    Created on : Jun 9, 2023, 11:07:08 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add new user</title>
  <link rel="stylesheet" href="<%= request.getContextPath()%>/css/style2.css">
  <link rel="stylesheet" href="<%= request.getContextPath()%>/css/bootstrap.min.css">
  <link rel="stylesheet" href="<%= request.getContextPath()%>/scss/extra/userProfile.scss">
  <link rel="stylesheet" href="<%= request.getContextPath()%>/js/">
</head>
<body>
<div class="dash-container">
  <div class="row gutters">
    <div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
      <div class="card h-100">
        <div class="card-body">
          <div class="account-settings">
            <div class="user-profile">
              <div class="user-avatar">
                <img src="https://bootdey.com/img/Content/avatar/avatar7.png"  id="profile-pic"alt="User">
                <label for="input-img">Change picture</label>
                <input type="file" accept="image/jpeg, image/png, image/jpg" id="input-img">
              </div>

            </div>
            <div class="about">
              <select name="roles" id="roles">
                <option value="All Roles">All Roles</option>
                <option value="Admin">Admin</option>
                <option value="Sales">Sales</option>
                <option value="Customer">Customer</option>
                <option value="Support">Support</option>
              </select>


            </div>

          </div>
        </div>
      </div>
    </div>
    <div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
      <div class="card h-100">
        <div class="card-body">
          <div class="row gutters">
            <div class="col-lg-12">
              <div class="form-group">
                <label for="fullName">Full Name</label>
                <input type="text" class="form-control" id="fullName" placeholder="Enter full name">
              </div>
            </div>
            <div class="col-lg-12">
              <div class="form-group">
                <label for="fullName">Email</label>
                <input type="email" class="form-control" id="email" placeholder="Enter email">
              </div>
            </div>
            <div class="col-lg-12">
              <div class="form-group">
                <label for="phone">Phone</label>
                <input type="tel" class="form-control" id="phone" pattern="[0-9]{3}-[0-9]{2}-[0-9]{3}" placeholder="Enter phone number">
              </div>
            </div>
            <div class="col-lg-12">
              <div class="form-group">
                <label for="text">Address</label>
                <input type="text" class="form-control" id="address" placeholder=" Address">
              </div>
            </div>
          </div>
          <div class="row gutters">
          </div>
          <div class="row gutters">
            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
              <div class="text-right">
                <button type="button" id="add" name="add" class="btn btn-primary">Add</button>

                <button type="button" id="back" name="back" class="btn btn-dark"><a href="AdminUserList.html" style="color: white">Back</a></button>
              </div>
            </div>
          </div>
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