package com.object.form.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.object.form.dao.QuestionnaireDao;
import com.object.form.model.Question;

@Service
@Transactional
public class QuestionnaireServiceImpl implements QuestionnaireService {
	@Autowired
	private QuestionnaireDao questionnaireDao;
	public List<Question> getQuestionnaire() {
		return questionnaireDao.getQuestionnaire();
	}
	public Question saveQuestion(Question question) {
		return questionnaireDao.saveQuestion(question);
	}
	public Question getQuestion(Integer id) {
		return questionnaireDao.getQuestion(id);
	}
	public void deleteOptions(Integer id) {
		questionnaireDao.deleteOptions(id);
	}
	public void deleteQuestion(Integer id) {
		questionnaireDao.deleteQuestion(id);
	}
}
