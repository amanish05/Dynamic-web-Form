<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head><title>Users</title></head>
<body>
<table>
<tr><th>ID</th><th>Username</th><th>Name</th></tr>
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