package com.object.form.services;

import java.util.List;

import com.object.form.model.Question;

public interface QuestionnaireService {
	public List<Question> getQuestionnaire();
	public Question saveQuestion(Question question);
	public Question getQuestion(Integer id);
	public void deleteOptions(Integer id);
	public void deleteQuestion(Integer id);
}
