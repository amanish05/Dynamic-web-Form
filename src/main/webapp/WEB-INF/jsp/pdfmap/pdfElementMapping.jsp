<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script  src="https://code.jquery.com/jquery-3.2.1.min.js" 
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">	

<script>
	$(function(){
		$("span").draggable({
	        revert: "invalid"
	    });
		$("input:text").droppable({				
			drop: function(event, ui){					
	        	$(this).val( ui.draggable.text() );
	          	$(this).droppable({ disabled: true });
	          	ui.draggable.parent().remove();
	        }			
		});
	})
</script>

<style>
	.form-group.required .control-label:after { 
	   content:"*";
	   color:red;
	}
	.error{
		color:red;
	}
</style>
	
	<div class="panel panel-default">        
        <div class="panel-body">
        	<form:form modelAttribute="pdfElementsContainer"  action="pdfElementMapping.html" method="POST">
        	<div class="row" >
        		<c:if test="${not empty availableFields}">	
        			
        			<div class="col-xs-6">		
							<table class="table table table-hover">
								<thead>
									<tr>								
										<th style="text-align: center;">Available Form Fields</th>						
										<th style="text-align: center;">Map To</th>							
									</tr>
								</thead>
								<tbody>	
									<c:set var="count" value="0" scope="page" />									
										<c:forEach items="${pdfElementsContainer.elements}" var="field" varStatus="i">	
										<tr>
											<td><label class="col-sm-8">${field.title}</label></td>
											<td class="col-sm-5">
												<c:choose>
											         <c:when test="${field.type == 'MultipleChoice'}">									         	
											         	<c:forEach items="${field.choices}" var="choice" varStatus="j" begin="0">
											         		<form:input class="form-control" type="text" path="elements[${i.index}].choices[${j.index}].pdfElementName" name="${choice.text}" placeholder="${choice.text}" />									         		
											         	</c:forEach>											            
											         </c:when>
											         
											         <c:otherwise>
											         	<form:input class="form-control" type="text" path="elements[${i.index}].pdfElementName" name="${field.id}" />													    
											         </c:otherwise>
										      	</c:choose>										      	
										      	
											</td>
										</tr>																	      							
									</c:forEach>																						
								</tbody>
							</table>							
											
					</div>
				
					<div class="col-xs-6">				
						<ul>
							<c:forEach items="${availableFields}" var="field" varStatus="i" begin="0">							
								<li><span>${field.key}</span></li>							        								
							</c:forEach>																											
						</ul>				
					</div>			
				</c:if>
			</div>
			<hr>
			<div class="row">
				<div class="col-xs-6">
					<div class="form-group required">
					    <label for=user class="col-sm-5 control-label">For Member: </label>
					    <div class="col-sm-5">
					      	<select id= "memberId" class="selectpicker form-control show-tick" data-width="auto" name="memberId" autofocus="autofocus">
							    <c:forEach items="${members}" var="member" >
							    	<option value="${member.id}">${member.username}</option>
							    </c:forEach>							    
							</select>				
					   </div>
					</div>
				</div>
				<div class="col-xs-6">
				
					<div class="form-group">					    
					    <div class="col-sm-5">
					      	<input type="hidden" value="${desc}" name="desc" />
							<input type="hidden" value="${formId}" name="formId" />							
							<button type="submit" class="btn btn-primary" >
								<span class="glyphicon"></span> Download Filled PDF!
							</button>				
					   </div>
					</div>				
					
				</div>
			</div>
			</form:form>        	
        </div>
     </div>