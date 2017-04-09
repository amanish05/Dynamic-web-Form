/*
 * This is a java class that is an enum type which determines what type the MultipleChoice class is.
 */
package com.object.form.model;

public enum MultipleChoiceType {
	
	MultiChecbox("MultiChecbox"), RadioButton("RadioButton"), DropDown("DropDown");
	
	private String value;

	MultipleChoiceType(String value) {
		this.value = value;
	}

	public String getValue() {
		return value;
	}

	public static MultipleChoiceType getKey(String key) {
		return MultipleChoiceType.valueOf(MultipleChoiceType.class, key);
	}

}
