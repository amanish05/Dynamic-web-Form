/*
 * FormElement is an abstract class that represents an element of the form
 * 
 * id: a unique identifier
 * title: the title of the element
 * name: the name of the element
 * isRequired: it is a boolean value that determines if the element is mandatory for the form
 * isEnabled:
 * isMultipleAnswerAllowed: this boolean value determines if the element allows multiple values in the element
 * form: a reference to the form object where the element belongs to
 * answers: a list of answer objects that contain the answers to the element
 * pages: a list of page objects
 * pdfElement: a PDFElement object which contains the element in the pdf
 */
package com.object.form.model;

import java.io.Serializable;
import java.util.List;

import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@Table(name = "formelements")
@Inheritance
@DiscriminatorColumn(name = "form_type")

public abstract class FormElement implements Serializable {
	
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue
	private Integer id;
	
	private String title;
	
	private String name;
	
	private Boolean isRequired;
	
	private Boolean isEnabled;
	
	boolean isMultipleAnswerAllowed;
	
	@ManyToOne
	private Form form;
	
	@OneToMany
	private List<Answer> answers;
	
	@OneToMany
	private Page pages;
	
	@OneToOne
	private PDFElement pdfElement;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Page getPages() {
		return pages;
	}
	public void setPages(Page pages) {
		this.pages = pages;
	}
	public PDFElement getPdfElement() {
		return pdfElement;
	}
	public void setPdfElement(PDFElement pdfElement) {
		this.pdfElement = pdfElement;
	}
	public List<Answer> getAnswers() {
		return answers;
	}
	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Boolean getIsRequired() {
		return isRequired;
	}
	public void setIsRequired(Boolean isRequired) {
		this.isRequired = isRequired;
	}
	public Boolean getIsEnabled() {
		return isEnabled;
	}
	public void setIsEnabled(Boolean isEnabled) {
		this.isEnabled = isEnabled;
	}
	public Form getForm() {
		return form;
	}
	public void setForm(Form form) {
		this.form = form;
	}
	public boolean isMultipleAnswerAllowed() {
		return isMultipleAnswerAllowed;
	}
	public void setMultipleAnswerAllowed(boolean isMultipleAnswerAllowed) {
		this.isMultipleAnswerAllowed = isMultipleAnswerAllowed;
	}
	
}
