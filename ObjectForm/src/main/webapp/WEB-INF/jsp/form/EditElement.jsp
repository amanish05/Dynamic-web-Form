<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

	<form:form modelAttribute="element" class="form-horizontal" method="post">	
	
		<div class="center-block">
		
			<c:choose>	
				<c:when test="${element.type == 'TextBox'}">
					<div class="form-group">
						<label for="elementTitle" class="col-sm-2 control-label">Element Title:</label>
						<div class="col-sm-5">
							<form:input path="title" type="text" class="form-control" id="elementTitle"
								placeholder="Enter Form Element Title" name="elementTitle"/>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">Maximum Character:</label>
						<div class="col-sm-2">
							<form:input path="maxLength" type="text" class="form-control" placeholder="No. of Character" name="elementTitle"/>
						</div>
					</div>
					
					<div class="form-group">
						<label class="col-sm-2 control-label">Is Required:</label>
						<div class="col-sm-10">
						  <form:checkbox class="checkbox" path="isRequired" />
						</div>			
					</div>					
				</c:when>
		
				<c:when test="${element.type == 'MultipleChoice'}">
					
				</c:when>
		
				<c:when test="${element.type == 'TextArea'}">
					
				</c:when>
				
				<c:when test="${element.type == 'DateText'}">
					
				</c:when>
	
			</c:choose>			
				
		</div>		
		
		<div class="form-group">
			<div class="col-sm-offset-2 col-sm-10">
				<input type="submit" name="add" value="Update Element" class="btn btn-default">
			</div>
		</div>
		
	</form:form>