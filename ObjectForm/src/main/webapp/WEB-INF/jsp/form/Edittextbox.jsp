<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

	<form:form modelAttribute="textbox" class="form-horizontal">
		
		<div class="form-group">
			<label for="elementTitle" class="col-sm-2 control-label"> Element
				Title:</label>
			<div class="col-sm-5">
				<form:input path="title" type="text" class="form-control" id="elementTitle"
					placeholder="Enter Form Element Title" name="elementTitle"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Maximum Character:</label>
			<div class="col-sm-2">
				<form:input path="maxLength" type="text" class="form-control"
					placeholder="No. of Character" name="maxLength"/>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label">Is Required:</label>
			<div class="col-sm-10">
			  <form:checkbox class="checkbox" path="isRequired" />
			</div>			
		</div>
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" name="add" value="Update Element" class="btn btn-default">
			</div>
		</div>
		
	</form:form>