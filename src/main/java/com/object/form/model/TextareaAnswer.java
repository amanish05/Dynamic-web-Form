/*
 * TextareaAnswer class stores the answer that was received from the Textarea class.
 * value: The value or answer of the text area as a string.
 */
package com.object.form.model;

//class to get text area answers from the user
public class TextareaAnswer extends Answer{
	
	private String value;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

}
