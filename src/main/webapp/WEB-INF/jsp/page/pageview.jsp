<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="webjars/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="webjars/bootstrap/3.2.0/css/bootstrap.min.css"
	rel="stylesheet">
<title>Form Editor Version 1.337</title>
</head>
<body>
	<c:if test="${empty form.pages}">
		<h3>There are no pages to display</h3>
	</c:if>
	<c:if test="${not empty form.pages} }">
	<table class="table">
		<thead>
			<tr>
			</tr>
		</thead>
	</table>
	</c:if>
	<a href="addpage.html"><button type="button" class="btn btn-warning">New Page</button></a>
	
	

</body>
</html>