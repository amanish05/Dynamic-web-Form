/*
 * PDFElement is a java class that contains the element of the form.
 * id: a unique identifier for the PDFElement
 * formElement: a reference to the formElement object that is related to the PDFElement
 */

package com.object.form.model;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
@Entity
public class PDFElement implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	@Id
	@GeneratedValue
	@Column(name="pdfElement_Id")
	private Integer id;
	
	@Column(name="name")
	private String name;
	
	@OneToOne
	private FormElement formElement;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public FormElement getFormElement() {
		return formElement;
	}
	public void setFormElement(FormElement formElement) {
		this.formElement = formElement;
	}
  
}
