<%-- 
    Document   : AdminSettingDetail
    Created on : Jun 9, 2023, 11:13:00 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Setting Detail</title>
  <link rel="stylesheet" href="../css/style2.css">
  <link rel="stylesheet" href="../css/bootstrap.min.css">
  <link rel="stylesheet" href="../scss/extra/userProfile.scss">
  <link rel="stylesheet" href="../js/">
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
                <img src="https://bootdey.com/img/Content/avatar/avatar7.png"  id="profile-pic"alt="User">
                <label for="input-img">Change picture</label>
                <input type="file" accept="image/jpeg, image/png, image/jpg" id="input-img">
              </div>
              <h5 class="user-name">Yuki Hayashi</h5>
              <h6 class="user-email">yuki@Maxwell.com</h6>
            </div>
            <div class="about">
              <select name="roles" id="roles">
                <option value="All Roles">All Roles</option>
                <option value="Admin">Admin</option>
                <option value="Sale">Sale</option>
                <option value="Customer">Customer</option>
                <option value="Marketing">Marketing</option>
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
                <label for="SettingType">Setting Type</label>
                <input type="text" class="form-control" id="settingType" placeholder="Enter Setting Type">
              </div>
            </div>

            <div class="col-lg-12">
              <div class="form-group">
                <label for="phone">Phone</label>
                <input type="tel" class="form-control" id="settingvalue"  placeholder="Enter value">
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
                <button type="button" id="update" name="submit" class="btn btn-primary">Update</button>
                <!--                <button type="button" id="changepass" name="changepass" class="btn btn-primary">Change Password</button>-->
                <button type="button" id="back" name="back" class="btn btn-dark">Back</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>

</html>