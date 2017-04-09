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
				<input type="submit" name="Add Form" value="Save" class="btn btn-warning">
			</div>
		</div>
	</form:form>	
</div>
	
