<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 	 
 	 <div class="center-block">
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
										href="EditForm.html?id=${form.id}">Edit</a> <a
										class="btn btn-danger" href="View?id=${form.id}">View</a> <a
										class="glyphicon glyphicon-trash" href="DisableForm.html?id=${form.id}"></a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
		</c:if>
 	 </div> 		
 