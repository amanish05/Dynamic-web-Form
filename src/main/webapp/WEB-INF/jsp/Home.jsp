<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta charset="UTF-8">
		<link href="webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
		<title>ObjectForm Home</title>
	</head>
<body>
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="#">Object Form</a>
	    </div>
	
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
	      <li class="active"><a href="#">Home<span class="sr-only">(current)</span></a></li>
	        <li class="active"><a href="#">Create New Form<span class="sr-only">(current)</span></a></li>	        
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">User Management<span class="caret"></span></a>
	          <ul class="dropdown-menu">
	            <li><a href="#">Edit profile</a></li>
	            <li><a href="#">Update Password</a></li>            
	            <li role="separator" class="divider"></li>
	            <li><a href="#">Create profile</a></li>	            
	            <li role="separator" class="divider"></li>
	            <li><a href="#">Users</a></li>
	          </ul>
	        </li>
	      </ul>
	      <form class="navbar-form navbar-left">
	        <div class="form-group">
	          <input type="text" class="form-control" placeholder="Search">
	        </div>
	        <button type="submit" class="btn btn-default">Submit</button>
	      </form>
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="#">Sign Out</a></li>
	        <li><a href="#">Help</a></li>       
	      </ul>
	    </div>
	  </div>
	</nav>
	
	<div class="container">
		<div class="page-header">
			<h3>Forms</h3>
		</div>
		<c:if test="${empty forms}">
			<div class="jumbotron">
				<h1>
					Uh-Oh! <small>There are no Forms to display.</small>
				</h1>
			</div>
		</c:if>

		<c:if test="${not empty forms}">
			<div class="panel panel-primary">
				<div class="panel-heading">
					<h2>Manage Forms</h2>
				</div>
				<div class="panel-body">
					<table class="table table-hover table-striped table-bordered">
						<thead>
							<tr>
								<th style="text-align: center;">Title</th>
								<th style="text-align: center;">Created Date</th>
								<th style="text-align: center;">Created By</th>								
								<th style="text-align: center;">Action</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${forms}" var="form">
								<tr>
									<td>${form.title}</td>
									<td>${form.createdDate}</td>
									<td>${form.ownedBy}</td>									
									<td><a class="btn btn-primary btn-sm"
										href="EditForm?id=${form.id}">Edit</a> <a
										class="btn btn-danger" href="DisableForm?id=${form.id}">Disable</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:if>		
	</div>
</body>
</html>