package com.object.form.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.object.form.model.FormElement;
import com.object.form.model.dao.FormElementDao;

@Repository
public class FormElementDaoImpl implements FormElementDao {

	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public FormElement getFormElementById(Integer id) {
		return entityManager.find(FormElement.class, id);
	}

	@Override
	@Transactional
	public FormElement saveFormElement(FormElement element) {
		return entityManager.merge(element);
	}

	@Override
	@Transactional
	public void delete(FormElement element) {
		entityManager.remove(element);
		
	}	
	
	@Override
	public List<FormElement> getFormElements(Integer formId) {
		return entityManager.createQuery( "from FormElement where form_id = :id order by id", FormElement.class )
				.setParameter("id", formId)
	            .getResultList();
	}

	
	@Override
	public FormElement getElement(Integer id) {
		return entityManager.createQuery( "from FormElement where id = :id", FormElement.class )
				.setParameter("id", id)
				.getSingleResult();
	}

}
