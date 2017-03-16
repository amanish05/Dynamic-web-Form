<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="webjars/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Form Creator Version 1.337</title>
</head>
<body>
	<ol class="breadcrumb">
		<li class="breadcrumb-item"><a href="mainpage.html">Form
				Builder Login</a></li>
		<li class="breadcrumb-item"><a href="adminpage.html">Admin</a></li>
		<li class="breadcrumb-item">Generated Forms</li>
		<li class="breadcrumb-item active">Form Creation</li>
	</ol>
	<h3>Create New Form</h3>
	<h4>Please enter the following information</h4>
	<form:form modelAttribute="form">
	<table class="table">
		<thead>
			<tr>
				<th>
					Form Title: <form:input path="title"/> 
				</th>
			</tr>
			<tr>
				<th>
					Description: <form:textarea path="description" rows="5" cols="50"></form:textarea> <br />
				</th>
			</tr>
		</thead>
	</table>
	<input type="submit" name="add" value="Add"/>
	</form:form>
	
</body>
</html>