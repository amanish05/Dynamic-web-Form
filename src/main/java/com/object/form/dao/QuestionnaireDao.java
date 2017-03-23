package com.object.form.dao;

import java.util.List;

import com.object.form.model.Options;
import com.object.form.model.Question;

public interface QuestionnaireDao {
	public List<Question> getQuestionnaire();
	public Question saveQuestion(Question question);
	public Question getQuestion(Integer id);
	public Options getOptions(Integer id);
	public void deleteOptions(Integer id);
	public void deleteQuestion(Integer id);
}
