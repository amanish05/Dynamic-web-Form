<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script  src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script>
	$( function() {
		$('tbody').sortable();
	    $('tbody').disableSelection();
	 });
		
</script>
<form:form modelAttribute="elementsContainer" class="form-horizontal">
	<div class="center-block">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h2>${form.title}</h2>
			</div>
			
			<div class="form-group">			
				<div class="col-sm-5">
					<div aria-label="Page navigation">
						<ul id="page"class="pagination">
							<c:forEach items="${pageLinks}" var="pageLink" varStatus="count">			
								 <li><a href="${pageLink}" >${count.index+1}</a></li>
							</c:forEach>
						</ul>	  
					</div>
				</div>
			</div>	
			
			<div class="panel-body">
<%-- 				<c:if test="${empty elementsContainer.elements && empty files}"> --%>
<!-- 					<div class="jumbotron"> -->
<!-- 						<h1> -->
<!-- 							Uh-Oh! <small>There are no Elements to display.</small> -->
<!-- 						</h1> -->
<!-- 					</div> -->
<%-- 				</c:if> --%>
				<c:if test="${not empty elementsContainer.elements}">					
					<table class="table">					
						<tbody>						
							<c:forEach items="${elementsContainer.elements}" var="element"  varStatus="i" begin="0">
								<c:if test="${element.type == 'GroupElement'}">
									<th>${element.title}</th>								
									<c:forEach items="${element.groupFormElements}" var="gElement">									
										<c:if test="${gElement.type == 'Textbox'}">
											<tr>											
												<td>${gElement.title}<input type="text" name="${gElement.name}" maxlength="gElement.maxLength" /></td>
											</tr>
										</c:if>
										<c:if test="${gElement.type == 'DateText'}">
											<tr>											
												<td>${gElement.title}<input type="date" name="${gElement.name}"></td>
											</tr>
										</c:if>
										<c:if test="${gElement.type == 'MultipleChoice'}">
											<tr>											
												<td>${gElement.title}</td>
											</tr>
											<c:forEach items="${gElement.choices}" var="choice">
												<tr>
													<td><input type="checkbox" class="checkbox" name="${gElement.name}" value="${choice.text}" />${choice.text}</td>
												</tr>
											</c:forEach>
										</c:if>
									</c:forEach>
								</c:if>
								<c:if test="${element.type == 'Textbox'}">	
									<tr>											
										<!--<td>${element.title}<input type="text" name="${element.name}" maxlength="gElement.maxLength" /></td>-->
										<td>${element.title}<form:input type="text" name="${element.name}" path="elements[${i.index}].answers[0].value" value="${element.answers[0].value}"  maxlength="gElement.maxLength" /></td>
									</tr>													
								</c:if>
								<c:if test="${element.type == 'DateText'}">
									<tr>											
										<td>${element.title}<input type="date" name="${element.name}"></td>
									</tr>
								</c:if>
								<c:if test="${element.type == 'MultipleChoice'}">
									<tr>											
										<td>${element.title}																	
											<c:forEach items="${element.choices}" var="choice" varStatus="j" begin="0">									
												<form:checkbox path="elements[${i.index}].answers[0].choiceAnswers" value="${choice}" class="checkbox" style="display: inline;"/>${choice.text}							
											</c:forEach>														
										</td>
									</tr>
								</c:if>
								<c:if test="${element.type == 'FormFile'}">
									<tr>
										<c:forEach items="${files}" var="file">
											<td>
												<a href="../form/download.html?fileId=${file.id}">${file.fileName }</a>																		    
											</td>
										</c:forEach>										
									</tr>
								</c:if>									
							</c:forEach>
						</tbody>
					</table>						
				</c:if>
			</div>
		</div>
	</div>
</form:form>	