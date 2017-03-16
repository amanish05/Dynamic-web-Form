<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html SYSTEM "about:legacy-compat">
<html>
<head>
<style>
.dropdown {
    position: relative;
    display: inline-block;
}
.dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
}
.dropdown-content a {
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<title>Form Editor Version 1.337</title>
</head>
<body>
	<h3>Page ${page.number} Form </h3>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="mainpage.html">Form
				Builder Login</a></li>
		<li class="breadcrumb-item"><a href="../adminpage.html">Admin</a></li>
		<li class="breadcrumb-item">Generated Forms</li>
		<li class="breadcrumb-item">Page List View</li>
		<li class="breadcrumb-item active">Form Element View List</li>
	</ol>
	<c:if test="${empty elements}">
		<h3>There are no form elements to display</h3>
	</c:if>
		<table class="table">
			<thead>
				<tr>
					<th>Form Element ID</th>
					<th>Form Element Name</th>
					<th>Operations</th>
				</tr>
			</thead>
				<tbody>
					<thead>
						<c:forEach items="${elements}" var="element">
							<tr>
								<td>${element.id}</td>
								<td>${element.name}</td>
								<td>
									<a href="editelement.html?id=${element.id}"><button type="button" class="btn btn-warning">Edit</button></a>
									<a href="deleteelement.html?id=${element.id}"><button type="button" class="btn btn-danger">Delete</button></a>
								</td>
								
							</tr>
						</c:forEach>
					</thead>
			</tbody>
		</table>
				<a href="#">Add Text Box</a>
				<a href="#">Add Text Area</a>
				<a href="multiplechoice.html">Add Multiple Choice</a>
				<a href="#">Add DateText</a>
		
		
</body>
</html>