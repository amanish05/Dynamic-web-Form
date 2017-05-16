package formgenerator.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import formgenerator.model.Answer;
import formgenerator.model.FormElement;
import formgenerator.model.Page;
import formgenerator.model.dao.AnswerDAO;

@Repository
public class AnswerDaoImpl implements AnswerDAO {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	@Transactional
	public Answer getAnswer(Integer id){
		return entityManager.find(Answer.class, id);
	}
	
	@Override
	@Transactional	
	public Answer saveAnswer(Answer answer){
		return entityManager.merge(answer);
	}
	
	@Override
	@Transactional
	public boolean delete(Answer answer){
		entityManager.remove(answer);
		return true;
		
	}
	
	@Override
	@Transactional
	public List<Answer> getAnswers(Integer elementId){
		 return entityManager.createQuery( "SELECT a FROM Answer a JOIN a.formElements fe WHERE fe.id=:elementId ORDER BY a.id ASC", Answer.class ).setParameter("elementId", elementId)
		            .getResultList();
	}
	
	@Override
	@Transactional
	public List<Answer> getAnswers(Integer elementId,Integer memberId){
		 return entityManager.createQuery( "SELECT a FROM Answer a JOIN a.formElements fe WHERE a.user.id=:memberId and fe.id=:elementId ORDER BY a.id ASC", Answer.class ).setParameter("elementId", elementId)
				 .setParameter("memberId", memberId).getResultList();
	}
	
	@Override
	@Transactional
	public List<Answer> getMemberAnswers(Integer formId, Integer memberId){
		 return entityManager.createQuery( "SELECT a FROM Answer a WHERE a.user.id=:memberId and a.form.id=:formId ORDER BY a.id ASC", Answer.class ).setParameter("formId", formId)
				 .setParameter("memberId", memberId).getResultList();
		
	}
	
	@Override
	@Transactional
	public List<Answer> getMemberAnswers(Integer formId, Integer memberId,  Integer elementId){
		System.out.println("elementid="+elementId);
		 return entityManager.createQuery( "SELECT a FROM Answer a JOIN a.formElements fe WHERE a.user.id=:memberId and a.form.id=:formId and fe.id=:elementId ORDER BY a.id ASC", Answer.class ).setParameter("formId", formId)
				 .setParameter("memberId", memberId).setParameter("elementId", elementId).getResultList();
		
	}
}
