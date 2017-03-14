<?xml version="1.0" encoding="ISO-8859-1" ?>
<jsp:root xmlns:jsp="http://java.sun.com/JSP/Page" version="2.0">
	<jsp:directive.page contentType="text/html; charset=ISO-8859-1"
		pageEncoding="ISO-8859-1" session="false" />
	<jsp:output doctype-root-element="html"
		doctype-public="-//W3C//DTD XHTML 1.0 Transitional//EN"
		doctype-system="http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd"
		omit-xml-declaration="true" />
	<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Object Form</title>
</head>
<body>
	<a href="CreateForm" class="btn btn-primary btn-sm">Create New Form</a>
	<a href="Convert" class="btn btn-primary btn-sm" style="float: right;">Manage
		User</a>
	<div class="container">
		<div class="page-header">
			<h3>Object Form</h3>
		</div>

		<c:if test="${empty convertors}">
			<div class="jumbotron">
				<h1>
					Uh-Oh! <small>There are no items to display.</small>
				</h1>
			</div>
		</c:if>

		<c:if test="${not empty convertors}">

			<table class="table table-hover table-striped table-bordered">
				<thead>
					<tr>
						<th style="text-align: center;">Quantity</th>
						<th style="text-align: center;">Unit 1</th>
						<th style="text-align: center;"></th>
						<th style="text-align: center;">Quantity</th>
						<th style="text-align: center;">Unit 2</th>
						<th style="text-align: center;"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${convertors}" var="item">
						<tr>
							<td>${item.quantity1}</td>
							<td>${item.unit1}</td>
							<td>=</td>
							<td>${item.quantity2}</td>
							<td>${item.unit2}</td>
							<td><a class="btn btn-primary btn-sm"
								href="EditConvertor?id=${item.id}">Edit</a></td>
						</tr>
					</c:forEach>
					<form action="Convertor" method="post">
						<tr>
							<td>1</td>
							<td><input type="text" name="unit1"></td>
							<td>=</td>
							<td><input type="text" name="quantity2"></td>
							<td><input type="text" name="unit2"></td>
							<td><input type="submit" value="Add new data"
								class="btn btn-primary btn-sm" /></td>
						</tr>
					</form>
				</tbody>
			</table>
		</c:if>
		<a href="Convert" class="btn btn-primary btn-sm">Convert</a>
	</div>
</body>
	</html>
</jsp:root>