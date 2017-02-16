package com.object.form.model;

import java.util.List;

//copied to sumanth machine
public abstract class FormElement {
	
	private String id;
	private String title;
	private String name;
	private Boolean isRequired;
	private Boolean isEnabled;
	boolean isMultipleAnswerAllowed;
	private Form form;
	private List<Answer> answers;
	private List<Page> pages;
	private PDFElement pdfElement;
	
	
	public List<Page> getPages() {
		return pages;
	}
	public void setPages(List<Page> pages) {
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
