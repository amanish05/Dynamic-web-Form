package com.object.form.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.object.form.model.Member;
import com.object.form.model.Options;
import com.object.form.model.Question;

@Repository
@Transactional
public class QuestionnaireDaoImpl implements QuestionnaireDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<Question> getQuestionnaire() {
		return entityManager.createQuery(" from Question order by id ", Question.class).getResultList();
	}

	@Override
	public Question saveQuestion(Question question) {

		Question m = new Question();
		if (question.getId() != null && question.getId() > 0) {
			deleteOptionByQuestionId(question.getId());
			m = this.getQuestion(question.getId());
		}
		BeanUtils.copyProperties(question, m);

		entityManager.merge(m);

		return question;
	}

	@Override
	public Question getQuestion(Integer id) {
		return entityManager.find(Question.class, id);
	}

	@Override
	public Options getOptions(Integer id) {
		return entityManager.find(Options.class, id);
	}

	@Override
	public void deleteOptions(Integer id) {
		Options options = this.getOptions(id);
		entityManager.remove(options);
	}

	@Override
	public void deleteQuestion(Integer id) {
		Question question = this.getQuestion(id);
		entityManager.remove(question);
	}

	public void deleteOptionByQuestionId(Integer id) {
		Question question = this.getQuestion(id);
		List options = question.getOptions();
		if (options != null && options.size() > 0) {
			for (int i = 0; i < options.size(); i++) {
				entityManager.remove(options.get(i));
			}
		}
	}
}
