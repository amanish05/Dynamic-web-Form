<%@ page language="java" contentType="text/html; charset=windows-1256" pageEncoding="windows-1256"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<link href="../webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<tiles:insertAttribute name="title" ignore="true"></tiles:insertAttribute>
<form:form modelAttribute="checkbox">
<table class="table">
		<tr>
			<th>Title : </th>
			<td><form:input path="title"/></td>
		</tr>
		<tr>
			<th>Name : </th>
			<td><form:input path="name"/></td>
		</tr>
		<tr>
			<th>Is Required : </th>
			<td><form:checkbox path="isRequired"/></td>
		</tr>
		<tr>
			<th>Is Enabled : </th>
			<td><form:checkbox path="isEnabled"/></td>
		</tr>
				           					           
	</table>
	<br/>
	<b>Add First Choice:</b>
	<table class="table">
		    <tr>
	            <td>Choice</td>
	            <td><form:input path="choices[0].text"/></td>
	        </tr>
	</table>
	<input type="hidden" name="formId" value="${formId} "/>
	<input type="hidden" name="pageId" value="${pageId} "/>
    <input type="submit" name="add" class="btn btn-success" value="add">           
</form:form>