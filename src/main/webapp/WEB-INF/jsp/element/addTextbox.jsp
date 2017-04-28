
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>

<form:form modelAttribute="textbox" class="form-horizontal">
	<table class="table">
		<tr>
			<th>Title :</th>
			<td><form:input path="title" /></td>
		</tr>
		<tr>
			<th>Name :</th>
			<td><form:input path="name" /></td>
		</tr>
		<tr>
			<th>Is Required :</th>
			<td><form:checkbox path="isRequired" /></td>
		</tr>
		<tr>
			<th>Is Enabled :</th>
			<td><form:checkbox path="isEnabled" /></td>
		</tr>
		<tr>
			<th>Has Multiple Answer :</th>
			<td><form:checkbox path="isMultipleAnswerAllowed" /></td>
		</tr>
		<tr>
			<th>Default Value :</th>
			<td><form:input path="defaultValue" /></td>
		</tr>
		<tr>
			<th>Max Length :</th>
			<td><form:input path="maxLength" /></td>
		</tr>
		<tr>
			<th>Width :</th>
			<td><form:input path="size" /></td>
		</tr>
	</table>
	<br>
	<input type="hidden" name="formId" value="${formId} " />
	<input type="hidden" name="pageId" value="${pageId} " />
	<input type="submit" name="add" class="btn btn-success" value="add">
</form:form>