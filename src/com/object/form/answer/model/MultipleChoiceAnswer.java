package com.object.form.answer.model;

import java.util.List;

import com.object.form.model.Choice;

public class MultipleChoiceAnswer {
	
	private List<Choice> choiceAnswers;

	public List<Choice> getChoiceAnswers() {
		return choiceAnswers;
	}

	public void setChoiceAnswers(List<Choice> choiceAnswers) {
		this.choiceAnswers = choiceAnswers;
	}

}
