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
              </div>
              <h6 class="user-email">Admin</h6>
              <h5 class="user-name">Setting Detail</h5>
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
                <label for="phone">Status</label>
                <input type="tel" class="form-control" id="settingvalue"  placeholder="Enter value">
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