package com.object.form.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;


//using table per concrete class inheritance strategy

@Entity
@Inheritance(strategy = InheritanceType.TABLE_PER_CLASS)
public abstract class Answer implements Serializable{
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private String id;
	
	private Member user;
	
	@ManyToOne
	private Form form;
	
	@ManyToMany
	private List<FormElement> formElements;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Member getUser() {
		return user;
	}
	public void setUser(Member user) {
		this.user = user;
	}
	public Form getForm() {
		return form;
	}
	public void setForm(Form form) {
		this.form = form;
	}
	public List<FormElement> getFormElements() {
		return formElements;
	}
	public void setFormElements(List<FormElement> formElements) {
		this.formElements = formElements;
	}
	
}