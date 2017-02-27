/*
 * The java class Answer is used to hold all of our answers that we get from the form elements.
 * 
 * id: a unique number which helps us identify between different answers
 * user: a reference to a Member object that created the answer
 * form: a reference to the form where the answer belongs
 * formElements: a reference to all the form elements where the answer is in
 */
package com.object.form.model;

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
