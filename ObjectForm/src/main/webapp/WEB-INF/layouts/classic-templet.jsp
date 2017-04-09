<%@ taglib  prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html> 
	<head>
		<meta charset="UTF-8">
		<script src="webjars/jquery/1.11.1/jquery.js"></script>
		<script type="text/javascript" src="webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
		<link rel="stylesheet" href="webjars/bootstrap/3.2.0/css/bootstrap.css" />		
		<title><tiles:getAsString name="title"/></title>
	</head>
	<body>
		<tiles:insertAttribute name="menu" defaultValue="/WEB-INF/layouts/menu.jsp" defaultValueType="template" />
		<div class="container">
			<div class="row-fluid">
				<tiles:insertAttribute name="body" />
			</div>
		</div>				
	</body>
</html>