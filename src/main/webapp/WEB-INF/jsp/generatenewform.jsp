<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="webjars/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Generate New Form</title>
</head>
<body>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="mainpage.html">Form
				Builder Login</a></li>
		<li class="breadcrumb-item"><a href="adminpage.html">Admin</a></li>
		<li class="breadcrumb-item active">Generate New Form</li>
	</ol>
	<form action="addformelements.html" method="post">
		<div class="form-group">
			<label for="formTitle" class="col-sm-2 control-label">Form
				Title:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="formTitle"
					placeholder="Enter The Form Title" name="formTitle">
			</div>
		</div>
		<div class="form-group">
			<label for="formName" class="col-sm-2 control-label">Form
				Name:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="formName"
					placeholder="Enter The Form Name" name="formName">
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" name="Add Form Elements"
					value="Add Form Elements" class="btn btn-primary">
			</div>
		</div>
	</form>
</body>
</html>