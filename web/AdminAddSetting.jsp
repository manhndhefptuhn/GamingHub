<%-- 
    Document   : AdminAddSetting
    Created on : Jun 9, 2023, 11:43:15 AM
    Author     : User
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Add New Setting</title>
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
                <label for="fullName">Setting Types</label>
                <input type="text" class="form-control" id="settingType" placeholder="Enter setting type">
              </div>
            </div>
            <div class="col-lg-12">
              <div class="form-group">
                <label for="fullName">Value</label>
                <input type="email" class="form-control" id="settingValue" placeholder="Enter value">
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
                <button type="button" id="update" name="submit" class="btn btn-primary">Update</button>

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
