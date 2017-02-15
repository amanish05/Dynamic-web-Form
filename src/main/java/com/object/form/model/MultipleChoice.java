package com.object.form.model;

import java.util.List;

import com.object.form.enums.MultipleChoiceType;

public class MultipleChoice extends  FormElement{
	
	private Integer numberOfAllowedSelect;
	private MultipleChoiceType choiceType;
	private List<Choice> choices;
	public Integer getNumberOfAllowedSelect() {
		return numberOfAllowedSelect;
	}
	public void setNumberOfAllowedSelect(Integer numberOfAllowedSelect) {
		this.numberOfAllowedSelect = numberOfAllowedSelect;
	}
	public MultipleChoiceType getChoiceType() {
		return choiceType;
	}
	public void setChoiceType(MultipleChoiceType choiceType) {
		this.choiceType = choiceType;
	}
	public List<Choice> getChoices() {
		return choices;
	}
	public void setChoices(List<Choice> choices) {
		this.choices = choices;
	}
}
