<!DOCTYPE html>

<%
  String totalFeedback = (String) request.getAttribute("totalFeedback");
  String ratio =  (String) request.getAttribute("ratio");
%>

<html lang="en">
<head>
  <title>Support Dashboard</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <style>

    .row.content {height: 550px}

    .sidenav {
      background-color: #f1f1f1;
      height: 100%;
    }
        
    @media screen and (max-width: 767px) {
      .row.content {height: auto;} 
    }
  </style>
</head>
<body>

<%--<%@include file="header.jsp" %>--%>

<div class="container-fluid">
  <div class="row content">
    <div class="col-sm-3 sidenav hidden-xs">
      <h2>Gaming HUB</h2>
      <ul class="nav nav-pills nav-stacked">
        <li class="active"><a href="supportDashboard.jsp">Dashboard</a></li>
        <li><a href="GetFeedbackList">Feedback List</a></li>
      </ul><br>
    </div>
    <br>
    
<!--    dummy info, add statistic later-->
    <div class="col-sm-9">
      <div class="well">
        <h4>Dashboard</h4>
        <p> Gaming HUB feedback overview</p>
      </div>
      <div class="row">
        <div class="col-sm-3">
          <div class="well">
            <h4>Customer</h4>
            <p> customer</p> 
          </div>
        </div>
        <div class="col-sm-3">
          <div class="well">
            <h4>Total feedback</h4>
            <p>7</p> 
          </div>
        </div>
        <div class="col-sm-3">
          <div class="well">
            <h4>Feeback ratio</h4>
            <p> % </p> 
          </div>
        </div>
        <div class="col-sm-3">
          <div class="well">
            <h4>Average Rating</h4>
            <p>3.7</p> 
          </div>
        </div>
      </div>
        
      <div class="row">
        <div class="col-sm-4">
          <div class="well">
            <p>Text</p> 
            <p>Text</p> 
            <p>Text</p> 
          </div>
        </div>
        <div class="col-sm-4">
          <div class="well">
            <p>Text</p> 
            <p>Text</p> 
            <p>Text</p> 
          </div>
        </div>
        <div class="col-sm-4">
          <div class="well">
            <p>Text</p> 
            <p>Text</p> 
            <p>Text</p> 
          </div>
        </div>
      </div>
      <div class="row">
        <div class="col-sm-8">
          <div class="well">
            <p>Text</p> 
          </div>
        </div>
        <div class="col-sm-4">
          <div class="well">
            <p>Text</p> 
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

</body>
</html>