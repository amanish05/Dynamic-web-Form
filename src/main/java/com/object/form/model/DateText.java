package com.object.form.model;

//copied to sumanth machine
import java.util.Date;

public class DateText extends FormElement{
	
	private Date defaultDate;
	private String dateFormat;
	private Form form;
	
	public Date getDefaultDate() {
		return defaultDate;
	}
	public void setDefaultDate(Date defaultDate) {
		this.defaultDate = defaultDate;
	}
	public String getDateFormat() {
		return dateFormat;
	}
	public void setDateFormat(String dateFormat) {
		this.dateFormat = dateFormat;
	}
	public Form getForm() {
		return form;
	}
	public void setForm(Form form) {
		this.form = form;
	}
}
