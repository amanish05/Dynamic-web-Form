<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

 <div class="center-block">
 	
 	<form:form modelAttribute="form" class="form-horizontal">
		<div class="form-group">
			<label for="formTitle" class="col-sm-2 control-label">Form Title:</label>
			<div class="col-xs-5">
				<form:input path="title" type="text" class="form-control" id="formTitle" placeholder="Form Title" name="formTitle"/>
			</div>
		</div>
		<div class="form-group">
			<label for="formName" class="col-sm-2 control-label">Description:</label>
			<div class="col-xs-5">			
				<form:textarea path="description" rows="3" class="form-control" id="formName" placeholder="Description" name="formName"/>
			</div>
		</div>
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<a class="btn btn-primary btn-sm" href="AddElement.html?formId=${form.id}">Add Element</a>			
				<input type="submit" name="Add Form" value="Save" class="btn btn-warning">
			</div>
		</div>
	</form:form>
	
	<c:if test="${empty formElement}">
		<div class="jumbotron">
			<h1>
				Uh-Oh! <small>There are no Forms to display.</small>
			</h1>
		</div>
	</c:if>
	 
	<c:if test="${not empty formElement}">
		<div class="panel panel-default">
			<div class="panel-heading">
				<h2>Manage Elements</h2>
			</div>
			<div class="panel-body">
				<table class="table table-hover table-striped table-bordered">
					<thead>
						<tr>
							<th style="text-align: center;">Title</th>
							<th style="text-align: center;">Is Required</th>
							<th style="text-align: center;">Is Enabled</th>													
							<th style="text-align: center;">Action</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${formElement}" var="element">
							<tr>
								<td>${element.title}</td>
								<td>${element.isRequired}</td>																			      
								<td>${element.isEnabled}</td>
								<td><a class="btn btn-primary btn-sm"
									href="EditElement.html?elementId=${element.id}&formId=${form.id}">Edit</a> <a
									class="btn btn-danger" href="DeleteElement.html?elementId=${element.id}&formId=${form.id}">Delete</a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</c:if>
 </div>
