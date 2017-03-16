<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link href="webjars/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<meta charset="UTF-8">
<title>Generated Forms</title>
</head>
<body>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="mainpage.html">Form
				Builder Login</a></li>
		<li class="breadcrumb-item"><a href="adminpage.html">Admin</a></li>
		<li class="breadcrumb-item active">Generated Forms</li>
	</ol>
	<h3>List Of Generated Forms</h3>
	<table class="table">
		<thead class="thead-default">
			<tr>
				<th>Form ID</th>
				<th>Form Name</th>
				<th>Creation Date</th>
				<th>Owner</th>
				<th>Operations</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${forms}" var="form">
			
			<tr>
				<td>${form.id}</td>
				<td>${form.title}</td>
				<td>${form.createdDate}</td>
				<td>${form.ownedBy}</td>
				<td>
					<a href="form/editform.html?id=${form.id}"><button type="button" class="btn btn-warning">Edit</button></a>
					<a href="removeform.html?id=${form.id}"><button type="button" class="btn btn-danger">Delete</button></a>
				</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<a href="generatenewform.html"><button type="button" class="btn btn-info">Add Form</button></a>
	<a href="page/pagelistview.html"><button type="button" class="btn btn-info">View All Pages</button></a>
</body>
</html>