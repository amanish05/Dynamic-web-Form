/*
 * The Page class is used to contain an individual page of the form.
 * 
 * id: a unique identifier for the page
 * isSubmited: a boolean value that determines if that page has been submitted.
 * number: the page number of the form.
 * form: a reference to the Form object where this page belongs to
 * elements: a list of form elements that are in this page
 */

package com.object.form.model;

import java.io.Serializable;
import java.util.List;

public class Page implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private int id;
	private boolean isSubmited;
	private byte number;
	private Form form;
	private List<FormElement> elements;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public boolean isSubmited() {
		return isSubmited;
	}
	public void setSubmited(boolean isSubmited) {
		this.isSubmited = isSubmited;
	}
	public byte getNumber() {
		return number;
	}
	public void setNumber(byte number) {
		this.number = number;
	}
	public Form getForm() {
		return form;
	}
	public void setForm(Form form) {
		this.form = form;
	}
	public List<FormElement> getElements() {
		return elements;
	}
	public void setElements(List<FormElement> elements) {
		this.elements = elements;
	}
	
	
}
