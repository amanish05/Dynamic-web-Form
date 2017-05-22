
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<script  src="https://code.jquery.com/jquery-3.2.1.min.js" 
	integrity="sha256-hwg4gsxgFZhOsEEamdOYGBf13FyQuiTwlAQgxVSNgt4=" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<style>
	.form-group.required .control-label:after { 
	   content:"*";
	   color:red;
	}
	.error{
		color:red;
	}
</style>

<div class="center-block">
	<div class="panel panel-default">        
        <div class="panel-body">									
         
          <h4>Select files from your computer</h4>
          <form  action="upload.html?${_csrf.parameterName}=${_csrf.token}" method="POST" enctype="multipart/form-data" id="fileuploadForm">
          	<div class="form-inline">
            	
            	<div class="form-group">
                	<input type="file" name="pdfs" class="form-control-file"  aria-describedby="fileHelp"  multiple>                			
              	</div>
              	
              	<div class="form-group">
				    <label for="formId" class="col-sm-5 ">To Which Form</label>
				    <div class="col-sm-5">
					    <select class="selectpicker  form-control show-tick" data-width="auto" name="formId" id="formId">
					    	<c:forEach items="${forms}" var="form">
								<option value="${form.id}" >${form.title}</option>
							</c:forEach>
					    </select>
				    </div>
				</div>
				
				<div class="form-group">
					<div class="col-sm-offset-2 col-sm-10">							
						<button type="submit" class="btn btn-primary">
							<span class="glyphicon"></span> Upload Files
						</button>
					</div>
				</div>	
              	
            </div>
          </form>
         </div>
	</div>
 </div>