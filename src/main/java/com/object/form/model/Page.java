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

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="page")
public class Page implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name="PAGE_ID")
	private Integer id;
	
	@Column(name="IS_SUBMITTED")
	private Boolean isSubmited;
	
	@Column(name="PAGE_NUMBER")
	private Byte number;
	
	@ManyToOne
	@JoinColumn(name = "FORM_ID")
	private Form form;
	
	//This need to be Implemented. Please add getter and setter with appropriate relationship
	//private List<FormElement> elements;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Boolean isSubmited() {
		return isSubmited;
	}
	public void setSubmited(Boolean isSubmited) {
		this.isSubmited = isSubmited;
	}
	public Byte getNumber() {
		return number;
	}
	public void setNumber(Byte number) {
		this.number = number;
	}
	public Form getForm() {
		return form;
	}
	public void setForm(Form form) {
		this.form = form;
	}		
}
