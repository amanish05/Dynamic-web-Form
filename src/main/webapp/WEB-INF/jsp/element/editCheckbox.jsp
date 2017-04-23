<%@ page language="java" contentType="text/html; charset=windows-1256"
    pageEncoding="windows-1256"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1256">
<title>Edit Checkbox Element</title>
<script type="text/javascript" charset="utf-8" src="../webjars/jquery/1.11.1/jquery.js"></script>
<script type="text/javascript" src="../webjars/bootstrap/3.2.0/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="../webjars/bootstrap/3.2.0/css/bootstrap.css" />
<script type="text/javascript">
$(function(){
	var option_tpl;
	var index = 0;
	$('.add').on('click', function(){
		if(!option_tpl){
			option_tpl = $('#tr_tpl').clone(true);
		}
		var $tr = option_tpl.clone(true);;
		$tr.find('.del').removeClass('dn');
		$tr.find('.option_content').val('');
		$tr.removeAttr('id');
		$('#js_choices').append($tr);
	});
	$('#sbmt').click(function(){
		var $inputs = $('.option_content');
		$.each($inputs, function(i, v){
			$(v).prop('name','choices[' + i + '].text');
		});
		$('#multiplechoice').submit();
	});
	$('.del').on('click', function(){
		$(this).parents('tr').remove();
	});
});
</script>
<style type="text/css">
.dn {
	display:none!important;
}

td {
	height: 40px;
}
</style>
</head>

<body  style="margin-top: 0px; margin-bottom: 0px; margin-right: 0px;margin-left: 0px;font-family: -apple-system,system-ui,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif" >
<div style="width:100%;height:100px;background-color: #6f5499;margin-left:0;    background-image: linear-gradient(to bottom,#563d7c 0,#6f5499 100%);font-color:red;">
	<div style="top: 25px; left: 20px;position:relative;font-family:Helvetica Neue,Helvetica,Arial,sans-serif;font-size: 30px;color:white;">Form Generator Project
	</div>
	<div style="top: 50px; left: 20px;position:relative;font-family:Helvetica Neue,Helvetica,Arial,sans-serif;font-size: 12px;color:white;">${menu}
	</div>
</div>
<form:form modelAttribute="multiplechoice">
<table border="1" cellspacing=0 cellpadding=5 bordercolor="#D3D3D3" style="margin-top: 20px; margin-bottom: 0px; margin-right: 10px;margin-left: 10px;" id="js_choices">
		<tr>
			<th style="text-align:right">Title : </th>
			<td>
			<form:hidden path="id"/>
			<form:input path="title"/>
			</td>
		</tr>
		<tr>
			<th style="text-align:right">Name : </th>
			<td><form:input path="name"/></td>
		</tr>
		<tr>
			<th style="text-align:right">Is Required : </th>
			<td><form:checkbox path="isRequired"/></td>
		</tr>
		<tr>
			<th style="text-align:right">Is Enabled : </th>
			<td><form:checkbox path="isEnabled"/></td>
		</tr>

		<c:forEach items="${choices}" var="choice" varStatus="status">
			<tr class="option" id="tr_tpl">
				<td>Choice</td>
				<td>
					<input type="text" class="option_content" value="${choice.text}">
					<i class="glyphicon glyphicon-plus add" style="width: 16px;height: 16px;"></i>
					<i class="glyphicon glyphicon-trash del ${status.index == 0?'dn':''}" style="width: 16px;height: 16px;"></i>
				</td>
			</tr>
		</c:forEach>

	</table>
	<br>
	
	<input type="hidden" name="formId" value="${formId} "/>
	<input type="hidden" name="pageId" value="${pageId} "/>
&nbsp;&nbsp;  	<input type="button" name="save" value="Save" id="sbmt">           
</form:form>
</body>
</html>