<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

	<form:form modelAttribute="formElement" class="form-horizontal" method="post">
		
		<div class="form-group">
			<label for="elementTitle" class="col-sm-2 control-label">Form Element
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
				<input type="submit" name="add" value="Add Element" class="btn btn-default">
			</div>
		</div>
	</form:form>