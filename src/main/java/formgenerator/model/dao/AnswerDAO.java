package formgenerator.model.dao;

import java.util.List;

import formgenerator.model.Answer;

public interface AnswerDAO {
	Answer getAnswer(Integer id);
	Answer saveAnswer(Answer answer);
	boolean delete(Answer answer);
	List<Answer> getAnswers(Integer elementId);
}
