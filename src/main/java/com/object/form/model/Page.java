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
