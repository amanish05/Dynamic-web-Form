/*
 * GroupElement is a java class that groups up form elements .
 * 
 * groupFormElements: a list of form elements which is required for grouping
 */
package com.object.form.model;

import java.util.List;

public class GroupElement extends FormElement{
	
	private List<FormElement> groupFormElements;

	public List<FormElement> getGroupFormElements() {
		return groupFormElements;
	}

	public void setGroupFormElements(List<FormElement> groupFormElements) {
		this.groupFormElements = groupFormElements;
	}
	
	

}
