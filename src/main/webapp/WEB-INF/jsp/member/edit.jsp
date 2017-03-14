<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>Member Add</title>
<link href="webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<style>
</style>
</head>

<body class="table table-bordered">
	<form action="<%=request.getContextPath()%>/member/save.html" method="post">
		<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'/>
		<table>
			<tr>
				<td>First Name</td>
				<td>
					<input type="hidden" name="id" value="${member.id}">
					<input type="text" name="firstName" value="${member.firstName}">
				</td>
			</tr>
			<tr>
				<td>Last Name</td>
				<td><input type="text" name="lastName" value="${member.lastName}"></td>
			</tr>
			<tr>
				<td>Middle Name</td>
				<td><input type="text" name="middleName" value="${member.middleName}"></td>
			</tr>
			<tr>
				<td>Email</td>
				<td><input type="text" name="email" value="${member.email}"></td>
			</tr>
			<tr>
				<td>Passcode</td>
				<td><input type="text" name="passcode" value="${member.passcode}"></td>
			</tr>
			<tr>
				<td>House</td>
				<td><input type="text" name="address.house" value="${member.address.house}"></td>
			</tr>
			<tr>
				<td>Street</td>
				<td><input type="text" name="address.street" value="${member.address.street}"></td>
			</tr>
			<tr>
				<td>Area</td>
				<td><input type="text" name="address.area" value="${member.address.area}"></td>
			</tr>
			<tr>
				<td>City</td>
				<td><input type="text" name="address.city" value="${member.address.city}"></td>
			</tr>
			<tr>
				<td>Zip Code</td>
				<td><input type="text" name="address.zip" value="${member.address.zip}"></td>
			</tr>
			<tr>
				<td>State</td>
				<td><input type="text" name="address.state" value="${member.address.state}"></td>
			</tr>
			<tr>
				<td>Country</td>
				<td><input type="text" name="address.country" value="${member.address.country}"></td>
			</tr>
			<tr>
				<td></td>
				<td><input type="submit" value="submit"></td>
			</tr>
		</table>
	</form>
</body>
</html>