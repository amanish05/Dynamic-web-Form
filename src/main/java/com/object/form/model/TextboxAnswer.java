/*
 * TextboxAnswer.java is a object that stores the input received from the Textbox class.
 * value: The value of the answer of the Textbox as a string
 */
package com.object.form.model;

public class TextboxAnswer extends Answer{
	
	private String value;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}
