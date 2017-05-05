<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<div class="">
	<c:if test="${empty elements}">
		<div class="jumbotron">
			<h1>
				Uh-Oh! <small>There are no Elements to display.</small>
			</h1>
		</div>
	</c:if>
	<c:if test="${not empty elements}">
		<div class="panel panel-primary">
			<div class="panel-heading">
				<h2>${form.title} - Preview</h2>
			</div>
			<h4>${pageLinks}</h4>
			<div class="panel-body">
				<table class="table">					
					<tbody>						
						<c:forEach items="${elements}" var="element">
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
									<td>${element.title}<input type="text" name="${element.name}" maxlength="gElement.maxLength" /></td>
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
										<c:forEach items="${element.choices}" var="choice">									
											<input type="radio" name="${element.name}" value="${choice.text}" class="checkbox" style="display: inline;"/>${choice.text}								
										</c:forEach>
									</td>
								</tr>
							</c:if>
							<c:if test="${element.type == 'DateText'}">
								<tr>											
									<td>${element.title}<input type="date" name="${element.name}"></td>
								</tr>
							</c:if>			
						</c:forEach>
					</tbody>
				</table>

				<form action="upload.html?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data">
					<div class="form-group">
					    <label for="PDFFile">PDF File:</label>
					    <input type="hidden" name="formId" value="${form.id}">
					    <c:if test="${not empty file}"><a href="download.html?fileId=${file.id}">${file.fileName }</a></c:if>
					    <input type="file" class="form-control-file" name="file" aria-describedby="fileHelp">
					</div>
					<input type="submit" name="upload" value="Upload" class="btn btn-primary">
				</form>
			</div>
		</div>
	</c:if>
</div>
