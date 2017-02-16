package com.object.form.model;

//copied to sumanth machine
public abstract class Answer {
	
	private String id;
	private Member user;
	private Form form;
	private FormElement formElements;
	
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
	public FormElement getFormElements() {
		return formElements;
	}
	public void setFormElements(FormElement formElements) {
		this.formElements = formElements;
	}
}
