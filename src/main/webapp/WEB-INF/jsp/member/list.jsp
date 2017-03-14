<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<title>Members</title>
<link href="<%=request.getContextPath()%>/webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<div>
	<a href="<%=request.getContextPath()%>/member/add.html">Add Member</a>
</div>
<table class="table table-bordered">
<thead>
<tr>
	<th>ID</th>
	<th>First Name</th>
	<th>Middle Name</th>
	<th>Last Name</th>
	<th>Email</th>
	<th>Passcode</th>
	<th>House</th>
	<th>Street</th>
	<th>Area</th>
	<th>City</th>
	<th>Zip_Code</th>
	<th>State</th>
	<th>Country</th>
	<th></th>
</tr>
</thead>
<tbody>
<c:forEach items="${members}" var="member">
<tr>
  <td>${member.id}</td>
  <td>${member.firstName}</td>
  <td>${member.middleName}</td>
  <td>${member.lastName}</td>
  <td>${member.email}</td>
  <td>${member.passcode}</td>
  <td>${member.address.house}</td>
  <td>${member.address.street}</td>
  <td>${member.address.area}</td>
  <td>${member.address.city}</td>
  <td>${member.address.zip}</td>
  <td>${member.address.state}</td>
  <td>${member.address.country}</td>
  <td><a href="<%=request.getContextPath()%>/member/edit.html?id=${member.id}">edit</a> | <a href="<%=request.getContextPath()%>/member/delete.html?id=${member.id}">delete</a></td>
</tr>
</c:forEach>
</tbody>
</table>
</body>
</html>