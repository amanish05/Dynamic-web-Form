/*
 * Text area class handles the text area aspect of forms.
 */
package com.object.form.model;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.OneToOne;
import javax.persistence.Table;

@Entity
@DiscriminatorValue("TextArea")
public class Textarea extends FormElement{
	
	private static final long serialVersionUID = 1L;
	
	@Column(name = "text_value")
	private String textValue;
	
	@Column(name = "default_value")
	private String defaultValue;
	
	@Column(name = "column")
	private Integer column;
	
	@Column(name = "row")
	private Integer row;
	
	@Column(name = "min_length")
	private Integer minLength;
	
	@Column(name = "max_length")
	private Integer maxLength;
	
	public String getTextValue() {
		return textValue;
	}
	public void setTextValue(String textValue) {
		this.textValue = textValue;
	}
	public String getDefaultValue() {
		return defaultValue;
	}
	public void setDefaultValue(String defaultValue) {
		this.defaultValue = defaultValue;
	}
	public Integer getColumn() {
		return column;
	}
	public void setColumn(Integer column) {
		this.column = column;
	}
	public Integer getRow() {
		return row;
	}
	public void setRow(Integer row) {
		this.row = row;
	}
	public Integer getMinLength() {
		return minLength;
	}
	public void setMinLength(Integer minLength) {
		this.minLength = minLength;
	}
	public Integer getMaxLength() {
		return maxLength;
	}
	public void setMaxLength(Integer maxLength) {
		this.maxLength = maxLength;
	}
	
}
