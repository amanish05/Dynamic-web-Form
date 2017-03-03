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

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;
import javax.persistence.OneToMany;

@Entity
@DiscriminatorValue("MultipleChoice")
public class MultipleChoice extends FormElement{
	
	private static final long serialVersionUID = 1L;
	
	@Column(name = "number_of_allowed_select")
	private int numberOfAllowedSelect;
	
	@Column(name = "multiple_choice_type")
	private int choiceType;
	
	@OneToMany
	private List<Choice> choices;
	
  public Integer getNumberOfAllowedSelect() {
		return numberOfAllowedSelect;
	}
	public void setNumberOfAllowedSelect(Integer numberOfAllowedSelect) {
		this.numberOfAllowedSelect = numberOfAllowedSelect;
	}
	public List<Choice> getChoices() {
		return choices;
	}
	public void setChoices(List<Choice> choices) {
		this.choices = choices;
	}
	
}
