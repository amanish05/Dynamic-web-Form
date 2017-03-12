<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<title>Register New User</title>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <a class="navbar-brand" href="mainpage.html">Form Builder Applications</a>
    </div>
    <div class="collapse navbar-collapse">
      <ul class="nav navbar-nav">
        <li><a href="mainpage.html">Login</a></li>
        <li class="active"><a href="registernewuser.html">Register New User</a></li>
      </ul> 
    </div>
  </div>
</nav>
<form action="registernewuser.html" method="post">
<h3>Enter Your Details:</h3>
  <div class="form-group row">
    <label for="firstName" class="col-sm-2 col-form-label">First Name:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" 
             id="firstName" placeholder="Enter Your First Name"
             name="firstName">
    </div>
  </div>
  <div class="form-group row">
    <label for="lastName" class="col-sm-2 col-form-label">Last Name:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" 
             id="lastName" placeholder="Enter Your Last Name"
             name="lastName">
    </div>
  </div>
  <div class="form-group row">
    <label for="middleName" class="col-sm-2 col-form-label">Middle Name:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" 
             id="middleName" placeholder="Enter Your Middle Name"
             name="middleName">
    </div>
  </div>
  <div class="form-group row">
    <label for="email" class="col-sm-2 col-form-label">Email Id:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" 
             id="email" placeholder="Enter Your Email Id"
             name="email">
    </div>
  </div>
  <div class="form-group row">
    <label for="password" class="col-sm-2 col-form-label">Password:</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" 
             id="password" placeholder="Enter Your Password"
             name="password">
    </div>
  </div>
  <div class="form-group row">
    <label for="confirmPassword" class="col-sm-2 col-form-label">Confirm Password:</label>
    <div class="col-sm-10">
      <input type="password" class="form-control" 
             id="confirmPassword" placeholder="Confirm Your Entered Password"
             name="confirmPassword">
    </div>
  </div>
  <h4><small>Enter Your Address:</small></h4>
  <div class="form-group row">
    <label for="house" class="col-sm-2 col-form-label">House Number:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" 
             id="house" placeholder="Enter Your House Number"
             name="house">
    </div>
  </div>
  <div class="form-group row">
    <label for="street" class="col-sm-2 col-form-label">Street Number:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" 
             id="street" placeholder="Enter Your Street Number"
             name="street">
    </div>
  </div>
  <div class="form-group row">
    <label for="area" class="col-sm-2 col-form-label">Area:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" 
             id="area" placeholder="Enter Your Area"
             name="area">
    </div>
  </div>
  <div class="form-group row">
    <label for="city" class="col-sm-2 col-form-label">City:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" 
             id="city" placeholder="Enter Your City"
             name="city">
    </div>
  </div>
  <div class="form-group row">
    <label for="state" class="col-sm-2 col-form-label">State:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" 
             id="state" placeholder="Enter Your State"
             name="state">
    </div>
  </div>
  <div class="form-group row">
    <label for="country" class="col-sm-2 col-form-label">Country:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" 
             id="country" placeholder="Enter Your Country"
             name="country">
    </div>
  </div>
  <div class="form-group row">
    <label for="zip" class="col-sm-2 col-form-label">Zip Code:</label>
    <div class="col-sm-10">
      <input type="text" class="form-control" 
             id="zip" placeholder="Enter Your Zip Code"
             name="zip">
    </div>
  </div>
  <input type="submit" class="btn btn-success" 
         name="register" value="Register">
</form>
</body>
</html>