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
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

// Multiple choice questions
@Entity
@Table(name="multiplechoice")
public class MultipleChoice extends FormElement{
	
	private static final long serialVersionUID = 1L;
	
	@Column(name = "number_of_allowed_select")
	private Integer numberOfAllowedSelect;
	
	@Column(name = "multiple_choice_type")
	private MultipleChoiceType choiceType;
	
//	@OneToMany(mappedBy="multiplechoice")
//	@Column(name = "choices")
//	private List<Choice> choices;
	
//	@OneToMany(mappedBy="multiplechoice")
//	@Column(name = "multiple_answers")
//	private List<MultipleChoiceAnswer> multiAnswers;
	
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
//	public List<Choice> getChoices() {
//		return choices;
//	}
//	public void setChoices(List<Choice> choices) {
//		this.choices = choices;
//	}
//	public List<MultipleChoiceAnswer> getMultiAnswers() {
//		return multiAnswers;
//	}
//	public void setMultiAnswers(List<MultipleChoiceAnswer> multiAnswers) {
//		this.multiAnswers = multiAnswers;
//	}
	
}
