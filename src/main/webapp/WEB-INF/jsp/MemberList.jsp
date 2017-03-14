<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head><title>Users</title></head>
<body>
<table>
<tr><th>ID</th><th>Username</th><th>Enabled</th></tr>
<c:forEach items="${members}" var="member">
<tr>
  <td>${member.id}</td>
  <td>${member.username}</td>
  <td>${member.enabled}</td>
</tr>
</c:forEach>
</table>
</body>
</html>