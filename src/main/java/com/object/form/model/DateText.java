/*
 * DateText is a java class that extends form element and is specialized to handle date input.
 * 
 * defaultDate: a date object created from the input
 * dateFormat: the format of the date ex: mm/dd/yyyy
 * form: a reference to the form where this date text belongs to
 */
package com.object.form.model;

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
