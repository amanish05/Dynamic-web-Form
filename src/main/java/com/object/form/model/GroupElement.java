/*
 * GroupElement is a java class that groups up form elements. The goal of GroupElement.java is the ability to group up certain form elements
 * to make things easier.
 * 
 * groupFormElements: a list of form elements 
 */
package com.object.form.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class GroupElement {
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	private Integer id;
	
	@OneToMany
	private List<FormElement> groupFormElements;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public List<FormElement> getGroupFormElements() {
		return groupFormElements;
	}

	public void setGroupFormElements(List<FormElement> groupFormElements) {
		this.groupFormElements = groupFormElements;
	}

}
