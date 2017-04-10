<%@ page language="java" contentType="text/html; charset=windows-1256"
<<<<<<< HEAD
	pageEncoding="windows-1256"%>
<!DOCTYPE html>
=======
    pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
>>>>>>> 4f787fbcaec251fac2a7ad07e6a5f8bd4cd9d43f
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css"
<<<<<<< HEAD
	rel="stylesheet" />
<meta http-equiv="Content-Type"
	content="text/html; charset=windows-1256">
<title>Member's List</title>
</head>
<body>
	<nav class="navbar navbar-inverse">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="../login.html">Form Builder</a>
			</div>
			<div class="collapse navbar-collapse">
				<ul class="nav navbar-nav">
					<li><a href="../login.html">Login</a></li>
					<li class="active"><a href="list.html">Member List</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<table class="table">
		<thead class="thead-default">
			<tr>
				<th>Email</th>
				<th>Firstname</th>
				<th>Middlename</th>
				<th>Lastname</th>
				<th>Operations</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${members}" var="member">
				<tr>
					<td>${member.email }</td>
					<td>${member.firstName }</td>
					<td>${member.middleName }</td>
					<td>${member.lastName }</td>
					<td><a href="view.html?id=${member.id}"><button
								type="button" class="btn btn-info">View</button></a> <a
						href="edit.html?id=${member.id}"><button type="button"
								class="btn btn-warning">Edit</button></a> <a
						href="delete.html?id=${member.id}"><button type="button"
								class="btn btn-danger">Delete</button></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<br />
	<a href="add.html"><button type="button" class="btn btn-info">Add
			New Member</button></a>
=======
	rel="stylesheet"/>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>Users List</title>
</head>
<body  style="margin-top: 0px; margin-bottom: 0px; margin-right: 0px;margin-left: 0px;font-family: -apple-system,system-ui,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif" >
<div style="width:100%;height:100px;background-color: #6f5499;margin-left:0;    background-image: linear-gradient(to bottom,#563d7c 0,#6f5499 100%);font-color:red;">
	<div style="top: 25px; left: 20px;position:relative;font-family:Helvetica Neue,Helvetica,Arial,sans-serif;font-size: 30px;color:white;">Form Generator Project
	</div>
	<div style="top: 50px; left: 20px;position:relative;font-family:Helvetica Neue,Helvetica,Arial,sans-serif;font-size: 12px;color:white;">${menu}
	</div>
</div>
<table border="1" cellspacing=0 cellpadding=5 bordercolor="#D3D3D3" style="margin-top: 20px; margin-bottom: 0px; margin-right: 10px;margin-left: 10px;">
<thead>
	<tr>
		<th>Id</th>
		<th>Email</th>
		<th>Firstname</th>
		<th>Middlename</th>
		<th>Lastname</th>
		<th>Operations</th>
	</tr>
</thead>
<tbody>
	<c:forEach items="${members}" var="member">
	<tr>
		<td>${member.id }</td>
		<td>${member.email }</td>
		<td>${member.firstName }</td>
		<td>${member.middleName }</td>
		<td>${member.lastName }</td>
		<td>
			<a href="view.html?id=${member.id}"><button type="button" class="btn btn-info">View</button></a>
			<a href="edit.html?id=${member.id}"><button type="button" class="btn btn-warning">Edit</button></a>
			<a href="delete.html?memberId=${member.id}"><button type="button" class="btn btn-warning">Delete</button></a>
		</td>
	</tr>
</c:forEach>
</tbody>
</table>
<br/>
&nbsp;&nbsp;<a href="add.html">Add new member</a>
>>>>>>> 4f787fbcaec251fac2a7ad07e6a5f8bd4cd9d43f
</body>
</html>