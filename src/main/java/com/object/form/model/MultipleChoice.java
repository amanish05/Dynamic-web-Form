/*
 * MultipleChoice class is used to handle radio buttons or check boxes.
 * 
 * numberOfAllowedSelect: an Integer object that tells us how many choices you are able to select
 * choiceType: determines if this object is a radio button or a check box
 * choices: a list of Choice objects from the radio button/check box.
 * 
 */
package com.object.form.model;

import java.util.List;

// Multiple choice questions
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
