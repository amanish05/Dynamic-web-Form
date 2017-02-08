package com.object.form.model;

import java.util.List;

import com.object.form.enums.Type;

public class MultipleChoice extends  FormElement{
	
	private Integer numberOfAllowedSelect;
	private Type choiceType;
	private List<Choice> choices;

}
