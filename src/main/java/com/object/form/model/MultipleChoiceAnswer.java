/*
 * MultipleChoiceAnswer is a class that handles getting answers from multiple choices.
 * 
 * choiceAnswers: the list of choice objects which are the answers
 */
package com.object.form.model;

import java.io.Serializable;
import java.util.List;

//class to hold multiple choice answers
public class MultipleChoiceAnswer implements Serializable{
	
	private static final long serialVersionUID = 1L;	
	private List<Choice> choiceAnswers;

	public List<Choice> getChoiceAnswers() {
		return choiceAnswers;
	}

	public void setChoiceAnswers(List<Choice> choiceAnswers) {
		this.choiceAnswers = choiceAnswers;
	}

}
