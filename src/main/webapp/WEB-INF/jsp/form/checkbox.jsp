<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
 
<%@page contentType="text/html" pageEncoding="UTF-8"%>

    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="js/dynamic_list_helper.js" type="text/javascript"></script>       
    </head>
    
         
        <form:form modelAttribute="formElement" class="form-horizontal"	method="post" id="personListForm">
            <div class="form-group">
				<label for="elementTitle" class="col-sm-2 control-label">Element Title:</label>
				<div class="col-sm-5">
					<form:input path="title" type="text" class="form-control" id="elementTitle" placeholder="Enter Element Title" name="elementTitle" />
				</div>
			</div>
						
						
			<div class="form-group">
				<label class="col-sm-2 control-label">Get Element type:</label>
				<div style="margin-right: 4px;">
					<label class="radio-inline"><form:radiobutton path="choiceType" value="MultiChecbox" /> MultiChecbox</label>
					<label class="radio-inline"><form:radiobutton path="choiceType" value="RadioButton" />	RadioButton</label>
					<label class="radio-inline"><form:radiobutton path="choiceType" value="DropDown"  /> DropDown</label>
				</div>
			</div>
							
                  
            <div class="form-group">
				<label class="col-sm-2 control-label">Is Required:</label>
				<div class="col-sm-10">
					<form:checkbox class="checkbox" path="isRequired" />
				</div>
			</div>
			
			<table>
                <thead>
                    <tr>
                        <th>Options</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody id="formElement">
                    <c:forEach items="${formElement.choices}" var="choices" varStatus="i" begin="0" >
                        <tr class="person">    
                            <td><form:input path="personList[${i.index}].option" id="option${i.index}" /></td>                            
                            <td><a href="#">Remove Person</a></td>
                        </tr>
                    </c:forEach>
                    
                    <%-- 
                        IMPORTANT 
                        There must always be one row.
                        This is to allow the JavaScript to clone the row.
                        If there is no row at all, it cannot possibly add a new row.
 
                        If this 'default row' is undesirable 
                            remove it by adding the class 'defaultRow' to the row
                        I.e. in this case, class="person" represents the row.
                        Add the class 'defaultRow' to have the row removed.
                        This may seem weird but it's necessary because 
                        a row (at least one) must exist in order for the JS to be able clone it.  
                        <tr class="person"> <!-- : The row will be present -->
                        <tr class="person defaultRow"> <!-- : The row will not be present --> --%>
                  
                   
                    <c:if test="${formElement.choices.size() == 0}">
                        <tr class="person defaultRow">    
                            <td><input type="text" name="choices.option" value="" /></td>
                            <td><a href="#" class="removePerson">Remove Person</a></td>
                        </tr>
                    </c:if>
                </tbody>
            </table>
            
            <a href="#" id="addPerson">Add Option</a>&nbsp;&nbsp;
            <a href="?formId=${formId}">Reset</a>
            
            <div class="form-group">
				<div class="col-sm-offset-2 col-sm-10">
					<input type="submit" name="add" value="Add Element"	class="btn btn-default">
				</div>
			</div>&nbsp;&nbsp;
            
        </form:form>
 
        <script type="text/javascript">
            function rowAdded(rowElement) {
               
                $(rowElement).find("input").val('');                
                saveNeeded();
            }
            function rowRemoved(rowElement) {
                saveNeeded();
                alert( "Removed Row HTML:\n" + $(rowElement).html() );
            }
 
            function saveNeeded() {
                $('#submit').css('color','red');
                $('#submit').css('font-weight','bold');
                if( $('#submit').val().indexOf("!") != 0 ) {
                    $('#submit').val( '!' + $('#submit').val() );
                }
            }
 
            function beforeSubmit() {
                alert('submitting....');
                return true;
            }
 
            $(document).ready( function() {
                var config = {
                    rowClass : 'person',
                    addRowId : 'addPerson',
                    removeRowClass : 'removePerson',
                    formId : 'personListForm',
                    rowContainerId : 'formElement',
                    indexedPropertyName : 'personList',
                    indexedPropertyMemberNames : 'option',
                    rowAddedListener : rowAdded,
                    rowRemovedListener : rowRemoved,
                    beforeSubmit : beforeSubmit
                };
                new DynamicListHelper(config);
            });
        </script>