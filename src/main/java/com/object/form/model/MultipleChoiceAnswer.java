package com.object.form.model;

import java.util.List;

//class to hold multiple choice answers
public class MultipleChoiceAnswer {
	
	private List<Choice> choiceAnswers;

	public List<Choice> getChoiceAnswers() {
		return choiceAnswers;
	}

	public void setChoiceAnswers(List<Choice> choiceAnswers) {
		this.choiceAnswers = choiceAnswers;
	}

}
