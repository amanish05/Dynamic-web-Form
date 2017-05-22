/*
 * GroupElement is a java class that groups up form elements. The goal of GroupElement.java is the ability to group up certain form elements
 * to make things easier.
 * 
 * groupFormElements: a list of form elements 
 */
package formgenerator.model;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.ManyToMany;


@Entity
@DiscriminatorValue("Group")
public class GroupElement extends FormElement {

	private static final long serialVersionUID = 1L;

	@Column(name = "group_Id")
	private int groupId;

	@ManyToMany(cascade={CascadeType.ALL},fetch=FetchType.EAGER)	
	private Set<FormElement> groupFormElements;

	public int getGroupId() {
		return groupId;
	}

	public void setGroupId(int groupId) {
		this.groupId = groupId;
	}

	public Set<FormElement> getGroupFormElements() {
		return groupFormElements;
	}

	public void setGroupFormElements(Set<FormElement> groupFormElements) {
		this.groupFormElements = groupFormElements;
	}
}