<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet"/>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>Member's List</title>
</head>
<body>
<table class="table">
<thead class="thead-default">
	<tr>
		<th>Email</th>
		<th>Firstname</th>
		<th>Middlename</th>
		<th>Lastname</th>
		<th>Password</th>
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
		<td>${member.passcode }</td>
		<td>
			<a href="view.html?id=${member.id}"><button type="button" class="btn btn-info">View</button></a>
			<a href="edit.html?id=${member.id}"><button type="button" class="btn btn-warning">Edit</button></a>
		</td>
	</tr>
</c:forEach>
</tbody>
</table>
<br/>
<a href="add.html">Add new member</a>
</body>
</html>