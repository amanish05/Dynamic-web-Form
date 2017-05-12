<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>

<script  src="https://code.jquery.com/jquery-3.2.1.min.js" integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
	.upload-drop-zone {
	  height: 200px;
	  border-width: 2px;
	  margin-bottom: 20px;
	}	
	
	.upload-drop-zone {
	  color: #ccc;
	  border-style: dashed;
	  border-color: #ccc;
	  line-height: 200px;
	  text-align: center
	}
	.upload-drop-zone.drop {
	  color: #222;
	  border-color: #222;
	}
</style>

<div class="center-block">
	<div class="panel panel-primary">
		<div class="panel-heading">
			<h2>${form.title} - Preview</h2>
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
			<c:if test="${empty elements}">
				<div class="jumbotron">
					<h1>
						Uh-Oh! <small>There are no Elements to display.</small>
					</h1>
				</div>
			</c:if>
			<c:if test="${not empty elements}">					
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
							<c:if test="${element.type == 'FormFile'}">
								<tr>
									<td>
										<div class="panel panel-default">
									        <div class="panel-heading"><strong>${element.title}</strong> <small>Files upload</small></div>
									        <div class="panel-body">									
									         
									          <h4>Select files from your computer</h4>
									          <form  action="upload.html?${_csrf.parameterName}=${_csrf.token}" method="post" enctype="multipart/form-data" id="fileuploadForm">
									            <div class="form-inline">
									              <div class="form-group">
									                <input type="file" name="files" class="form-control-file"  aria-describedby="fileHelp"  multiple>
													<input type="hidden" name="formId" value="${form.id}">
													<input type="hidden" name="elementId" value="${element.id}">
									              </div>
									              <button type="submit" class="btn btn-sm btn-primary" id="js-upload-submit">Upload Files</button>
									            </div>
									          </form>
									          
									          <h4>Or drag and drop files below</h4>
									          <div class="upload-drop-zone" id="drop-zone">
									            Just drag and drop files here
									            <input type="hidden" class="form-control-file"  aria-describedby="fileHelp"  multiple>
									          </div>
									          
									          <!-- Upload Finished -->
									          <c:if test="${not empty message}">
									          	<div class="js-upload-finished">
										            <h3>Processed files</h3>
										            <div class="list-group">
										              <a href="#" class="list-group-item list-group-item-success" id="result"><span class="badge alert-success pull-right">"${message}"</span></a>									             
										            </div>
										          </div>
									          </c:if>
									          
									        </div>
									      </div>
									</td>
								</tr>
							</c:if>									
						</c:forEach>
					</tbody>
				</table>				
			</c:if>
		</div>
	</div>
</div>

<script>
	$( function() {
		$('tbody').sortable();
	    $('tbody').disableSelection();
	 });
	
	$(function() {
	    'use strict';    
	    var dropZone = document.getElementById('drop-zone');	   

	    var startUpload = function(files) {	  
	    	console.log(files)
	    	
	        var formData = new FormData(files);	
	    	console.log("before 1")
	    	$("form#fileuploadForm").submit(function() {
	    		console.log("Inside Call1")
	    	    $.post($(this).attr("action"), formData, function(data) {
	    	        alert(data);
	    	    });
	    	    console.log("Inside Call")
	    	    return false;
	    	});
	    	/* $.ajax({
	    	    url: 'upload?${_csrf.parameterName}=${_csrf.token}&formId=${form.id}&elementId=${element.id}',
	    	    data: files,
	    	    enctype: 'multipart/form-data',
	    	    type: 'POST',
	    	    processData: false,
	    	    contentType: false,
	    	    success: function(data){
	    	      $('#result').html(data);
	    	    }
	    	    
	    	  }); */
	    }
	    
	    /* $('#dropZone').on(
	    	    'drop',
	    	    function(e){
	    	        if(e.originalEvent.dataTransfer){
	    	            if(e.originalEvent.dataTransfer.files.length) {
	    	                e.preventDefault();
	    	                e.stopPropagation();	    	               
	    	                
	    	                var uploadFiles = document.getElementById('js-upload-files').files;
	    	                var formData = new FormData(uploadFiles);
	    	     	        startUpload(formData)
	    	            }   
	    	        }
	    	    }
	    	);

	    uploadForm.addEventListener('submit', function(e) {
	        
	        e.preventDefault()
			var uploadFiles = document.getElementById('js-upload-files').files;
	        var formData = new FormData(uploadFiles);
	        startUpload(formData)
	    }) */

	    dropZone.ondrop = function(e) {
	        e.preventDefault();
	        this.className = 'upload-drop-zone';

	        startUpload(e.dataTransfer.files)
	    }

	    dropZone.ondragover = function() {
	        this.className = 'upload-drop-zone drop';
	        return false;
	    }

	    dropZone.ondragleave = function() {
	        this.className = 'upload-drop-zone';
	        return false;
	    }

	});
</script>