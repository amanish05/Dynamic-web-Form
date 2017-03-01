package com.object.form.model;

import javax.persistence.Entity;
import javax.persistence.Table;

@Entity
@Table(name = "textboxanswers")
public class TextboxAnswer extends Answer{
	
	private String value;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}
