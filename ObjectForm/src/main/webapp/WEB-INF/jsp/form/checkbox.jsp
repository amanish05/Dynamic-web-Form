<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<head>
	<script language="Javascript" type="text/javascript">	
		var counter = 0;
		function addInput(divName){	
			var newdiv = document.createElement('div'); 
			newdiv.innerHTML = "<input type='text' name='choices[]'>"; 
			document.getElementById(divName).appendChild(newdiv); 
			counter++; 
		}
	</script>
</head>

<form:form modelAttribute="formElement" class="form-horizontal"	method="post">

	<div class="form-group">
		<label for="elementTitle" class="col-sm-2 control-label">Element Title:</label>
		<div class="col-sm-5">
			<form:input path="title" type="text" class="form-control" id="elementTitle" placeholder="Enter Element Title" name="elementTitle" />
		</div>
	</div>
	
	<div class="form-group">
		<label class="col-sm-2 control-label">Get Element type:</label>
		<div style="margin-right: 4px;">
			<label class="radio-inline"><form:radiobutton path="choiceType" value="MultiChecbox" /> MultiChecbox</label>
			<label class="radio-inline"><form:radiobutton path="choiceType" value="RadioButton" />	RadioButton</label>
			<label class="radio-inline"><form:radiobutton path="choiceType" value="DropDown"  /> DropDown</label>
		</div>
	</div>

	<div class="form-group">
		<label class="col-sm-2 control-label">Is Required:</label>
		<div class="col-sm-10">
			<form:checkbox class="checkbox" path="isRequired" />
		</div>
	</div>
	
	<div class="form-group" >
		<label for="elementTitle" class="col-sm-2 control-label">Option:</label>
		<div class="col-sm-5" id="choice">
			<form:input path="choices" type="text" class="form-control" id="choice" placeholder="Enter Option" name="choices[]" />
		</div>
		<input type="button" value="Add option" onClick="addInput('choice');">
	</div>

	<div class="form-group">
		<div class="col-sm-offset-2 col-sm-10">
			<input type="submit" name="add" value="Add Element"
				class="btn btn-default">
		</div>
	</div>
</form:form>