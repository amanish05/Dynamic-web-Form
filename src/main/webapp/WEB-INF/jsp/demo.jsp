<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Users</title>
</head>
<body>
	<table>
		<tr>
			<th>ID</th>
			<th>Username</th>
			<th>Name</th>
		</tr>
		<c:forEach items="${members}" var="user">
			<tr>
				<td>${user.id}</td>
				<td>${user.email}</td>
				<td>${user.firstName}</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>