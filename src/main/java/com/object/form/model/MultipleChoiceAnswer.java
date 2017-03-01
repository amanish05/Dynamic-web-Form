package com.object.form.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "multiplechoiceanswers")
public class MultipleChoiceAnswer extends Answer{
	
	private static final long serialVersionUID = 1L;
	
	@OneToMany
	private List<Choice> choiceAnswers;

	public List<Choice> getChoiceAnswers() {
		return choiceAnswers;
	}

	public void setChoiceAnswers(List<Choice> choiceAnswers) {
		this.choiceAnswers = choiceAnswers;
	}

}