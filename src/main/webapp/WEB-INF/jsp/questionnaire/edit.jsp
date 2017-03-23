<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>Questionnaire Edit</title>
<link href="<%=request.getContextPath()%>/webjars/bootstrap/3.2.0/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="<%=request.getContextPath()%>/assets/js/common/jquery-1.10.2.min.js"></script>

<script type="text/javascript">
$(function(){
	var option_tpl;
	$('input[name="type"]').change(function(){
		var type = $(this).val();
		if("0" == type){
			$('.option').hide();
		}else if("1" == type){
			$('.option').show();
			$('.option').find('input').val('');
		}
	});
	var index = 0;
	$('.add').on('click', function(){
		if(!option_tpl){
			option_tpl = $('.option').first().clone(true);
		}
		var $tr = option_tpl.clone(true);;
		$tr.find('.del').show();
		$tr.find('.option_content').val('');
		$('#contro').before($tr);
	});
	$('#sbmt').click(function(){
		var $inputs = $('.option_content');
		$.each($inputs, function(i, v){
			$(v).prop('name','options[' + i + '].content');
		});
		$('#questionForm').submit();
	});
	$('.del').on('click', function(){
		$(this).parents('tr').remove();
		if($('.option').length == 1){
			$('.option').find('.del').hide();
		}
	});
});
</script>
<style type="text/css">
.dn {
	display:none;
}

td {
	height: 40px;
}
</style>
</head>

<body class="table table-bordered">
 	<form action="<%=request.getContextPath()%>/questionnaire/save.html" method="post" id="questionForm">
		<input type='hidden' name='${_csrf.parameterName}' value='${_csrf.token}'/>
		<table>
			<tr>
				<td>Question Description</td>
				<td>
					<input type="hidden" name="id" value="${question.id}" id="q_id">
					<input type="hidden" name="type" value="${question.type}">
					<input type="text" name="description" value="${question.description}">
				</td>
			</tr>
			<tr>
				<td>Question Type</td>
				<td><input type="text" value="${question.type == 0 ? 'Text Question' : 'Checkbox Question'}" readonly></td>
			</tr>
			<c:if test="${question.type==1}">
			 <c:forEach var="options" items="${question.options}" varStatus="state">
			 	<tr class="option">
					<td>Option Content</td>
					<td>
						<input type="text" class="option_content" value="${options.content}">
						<img src="<%=request.getContextPath()%>/assets/image/plus.jpg" width="15" height="15" class="add">
						<img src="<%=request.getContextPath()%>/assets/image/minus.jpg" width="15" height="15" class="del">
					</td>
				</tr>
			 </c:forEach>
			</c:if>
			<tr id="contro">
				<td></td>
				<td><input type="button" value="submit" id="sbmt"></td>
			</tr>
		</table>
	</form>
<div style="display:none;">
	<form action="<%=request.getContextPath() %>/questionnaire/delOpt.html" name="ifr_del">
		<input name="id" id="op_id">
		<input name="q_id" id="q_id2">
	</form>
</div>
</body>
</html>