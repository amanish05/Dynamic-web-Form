<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<head>
	<style type="text/css">
		 .centerAlignment {
		  left: 50%;
		  right: auto;
		  text-align: center;
		  transform: translate(-50%, 0);
		}
	</style>
</head>

	<div class="center-block">		
		<c:if test="${not empty form}">
					
			<div class="dropdown centerAlignment">
				<button class="btn btn-default dropdown-toggle" type="button" id="Type" data-toggle="dropdown">Element Type: <span class="caret"></span></button>
				<ul class="dropdown-menu centerAlignment" role="menu" aria-labelledby="menu1">
					<li role="presentation"><a role="menuitem" href="textbox.html?formId=${form.id}">Text Box</a></li>
					<li role="presentation"><a role="menuitem" href="checkbox.html?formId=${form.id}">Check Box</a></li>			    
					<li role="presentation" class="divider"></li>
					<li role="presentation"><a role="menuitem" href="#">Text Area</a></li>
				</ul>
			</div>		
				
		</c:if>
					
	</div>