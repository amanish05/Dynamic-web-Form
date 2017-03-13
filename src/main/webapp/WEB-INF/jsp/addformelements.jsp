<!DOCTYPE html>
<html>
<head>
<link href="webjars/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Add Form Elements</title>
</head>
<body>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="mainpage.html">Form
				Builder Login</a></li>
		<li class="breadcrumb-item"><a href="adminpage.html">Admin</a></li>
		<li class="breadcrumb-item"><a href="generatenewform.html">Generate
				New Form</a></li>
		<li class="breadcrumb-item active">Add Form Elements</li>
	</ol>
	<form class="form-horizontal" action="adminpage.html" method="post">
		<div class="form-group">
			<label for="formMame" class="col-sm-2 control-label">Form
				Name:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="formMame"
					placeholder="Enter Form Name" name="formMame">
			</div>
		</div>
		<div class="form-group">
			<label for="pageNumber" class="col-sm-2 control-label">Page
				Number:</label>
			<div class="col-sm-10">
				<input type="text" class="form-control" id="pageNumber"
					placeholder="Enter Page Number" name="pageNumber">
			</div>
		</div>
		<div class="form-group">
			<label for="pageNumber" class="col-sm-2 control-label">Select
				Form Element:</label>
			<div class="col-sm-10">
				<select class="form-control">
					<option>Text Box</option>
					<option>Text Area</option>
					<option>Password Box</option>
					<option>Check Box</option>
					<option>Radio Button</option>
				</select>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" name="add" value="Add" class="btn btn-info">
			</div>
		</div>
	</form>
</body>
</html>