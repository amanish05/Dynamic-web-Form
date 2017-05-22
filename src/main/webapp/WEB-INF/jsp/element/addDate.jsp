<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">

	<form:form modelAttribute="dateText" class="form-horizontal"	method="post">
	
		<div class="form-group">
			<label for="elementTitle" class="col-sm-2 control-label">Element Title:</label>
			<div class="col-sm-5">
				<form:input path="title" type="text" class="form-control" id="elementTitle" placeholder="Enter Element Title" name="elementTitle" autofocus="autofocus"/>
			</div>
		</div>
		
		<div class="form-group">
			<label for="maxLength" class="col-sm-2 control-label">Date Format</label>
			<div class="col-md-3">
				<form:input path="dateFormat" type="text" class="col-md-3 form-control" name="elementTitle" placeholder="YYYY-MM-DD" value="YYYY-MM-DD"/>
			</div>
		</div>	
				
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">				
				<input type="hidden" name="pageId" value="${pageId} " />
				<input type="hidden" name="formId" value="${formId} " />						
				<input type="submit" name="add" value="Add Element" class="btn btn-primary" id="sbmt">
			</div>
		</div>
	</form:form>
