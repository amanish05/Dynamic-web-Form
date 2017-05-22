<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<script  src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<form:form modelAttribute="elementsContainer" action="formsheet.html?${_csrf.parameterName}=${_csrf.token}" method= "post" class="form-horizontal" enctype="multipart/form-data" >
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
				<c:if test="${empty elementsContainer.elements}">
					<div class="jumbotron">
						<h1>
							Uh-Oh! <small>There are no Elements to display.</small>
						</h1>
					</div>
				</c:if>
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
										<td>
											<div class="form-group">
											    <label for="username" class="col-sm-2">${element.title}</label>
											    <div class="col-sm-3">
											    	<form:input type="text" name="${element.name}" class="form-control" path="elements[${i.index}].answers[0].value" value="${element.answers[0].value}"  maxlength="gElement.maxLength" />								      					
											   </div>
											</div>
										</td>
									</tr>													
								</c:if>
								
								<c:if test="${element.type == 'DateText'}">
									<tr>											
										<td>
											<div class="form-group required">
											    <label for="username" class="col-sm-2">${element.title}</label>
											    <div class="col-sm-3">
											    	<form:input type="date" name="${element.name}" class="form-control" path="elements[${i.index}].answers[0].date" value="${element.answers[0].date}" />								      					
											   </div>
											</div>									
										</td>
									</tr>
								</c:if>
								
													
								
								<c:if test="${element.type == 'MultipleChoice'}">
									<tr>											
										<td>
											<div class="form-group">
												<label class="col-sm-2">${element.title}</label>
												<div class="col-sm-5">
													<c:forEach items="${element.choices}" var="choice" varStatus="j" begin="0">
														<form:checkbox path="elements[${i.index}].answers[0].choiceAnswers" value="${choice}" class="checkbox" style="display: inline;"/>${choice.text}
													</c:forEach>
												</div>
											</div> 																						
										</td>
									</tr>
								</c:if>
														
								<c:if test="${element.type == 'FormFile'}">						
									<tr>											
										<td>									
											<c:choose>									         
										         <c:when test = "${not fromanswer}">
										         		<div class="form-group">														
															<label for="fileupload" class="col-sm-2">${element.title}</label>
															<div class="col-sm-3">
																<input id="fileupload" type="file" name="files" class="form-control-file"  aria-describedby="fileHelp" multiple />
																<input type="hidden" name="formId" value="${form.id}" />
																<input type="hidden" name="elementId" value="${element.id}" />	
															</div>
														</div>
										         </c:when>
										         										         									         
										         <c:otherwise>
										         	<div class="form-group">
										         		 <label class="col-sm-2">${element.title}</label>
										         		 <div class="col-sm-3">
															<c:forEach items="${files}" var="file">																
																<a href="../form/download.html?fileId=${file.id}">${file.fileName }</a>	
															</c:forEach>
														</div>
										         	</div>
										         </c:otherwise>
										      </c:choose>															    
										</td>
									</tr>
								</c:if>									
							</c:forEach>
						</tbody>
					</table>
					<c:if test="${not isReadonly}">
						<div class="form-group" style="display: inline-block;">
							<div class="col-sm-offset-2 col-sm-10">	
								<input type="submit" name="Submit" value="Submit" class="btn btn-success">
							</div>
						</div>
						<div class="form-group" style="display: inline-block;">
							<div class="col-sm-offset-2 col-sm-10">							
								<a href="">
									<button class="btn btn-danger" >
										Reset Me
									</button>
								</a>
							</div>
						</div>
					</c:if>			
				</c:if>
			</div>
		</div>
	</div>
</form:form>	