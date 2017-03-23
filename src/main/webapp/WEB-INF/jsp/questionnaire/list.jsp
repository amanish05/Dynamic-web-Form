<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<title>questionnaire</title>
<link href="<%=request.getContextPath()%>/webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<div>
	<a href="<%=request.getContextPath()%>/questionnaire/add.html">Add question</a> | 
	<a href="<%=request.getContextPath()%>/questionnaire/page.html">Question page</a>
</div>
<table class="table table-bordered">
<thead>
<tr>
	<th>ID</th>
	<th>Question Description</th>
	<th>Type</th>
	<th>Operation</th>
</tr>
</thead>
<tbody>
<c:forEach items="${question}" var="question">
<tr>
  <td>${question.id}</td>
  <td>${question.description}</td>
  <td>${question.type == 0 ? 'Text Question' : 'Checkbox Question'}</td>
  <td><a href="<%=request.getContextPath()%>/questionnaire/edit.html?id=${question.id}">edit</a> | <a href="<%=request.getContextPath()%>/questionnaire/delete.html?id=${question.id}">delete</a></td>
</tr>
</c:forEach>
</tbody>
</table>
</body>
</html>