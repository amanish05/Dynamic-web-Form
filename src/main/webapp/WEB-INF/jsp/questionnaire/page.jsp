<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<html>
<head>
<title>questionnaire</title>
<link href="<%=request.getContextPath()%>/webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
body {
	padding: 20px;
}
.page {
	width: 800px;
	border: 1px solid #ccc;
	padding: 20px;
	background: #f9f9f9;
}

.question {
	
}
.question-title {
	font-size: 16px;
	font-weight: 800;
	height: 30px;
	line-height: 30px;
}

textarea {
	width: 300px;
	height: 100px;
	resize: none;
}

.option-group {
	line-height: 30px;
	font-size: 14px;
	margin-bottom: 10px;
}

.option-group input {
	line-height: 30px;
}

.question:not(:first-child) {
	border-top: 1px solid #ccc;
}
</style>
</head>
<body>
<div class="page">
	<c:forEach items="${questions}" var="question" varStatus="status">
	<div class="question">
		<div class="question-title">
			<span>
				${status.index+1}. ${question.description}
			</span>
		</div>
		<div class="option-group">
			<c:if test="${question.type == 0}">
				<textarea rows="" cols=""></textarea>
			</c:if>
			<c:if test="${question.type == 1}">
				<c:forEach items="${question.options}" var="option">
					<input type="checkbox" value="" name="chk_${question.id}">${option.content}<br>
				</c:forEach>
			</c:if>
		</div>
	</div>
	</c:forEach>
</div>
</body>
</html>