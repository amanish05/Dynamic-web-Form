package com.object.form.model.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.object.form.model.Textbox;
import com.object.form.model.dao.TextboxDao;

@Repository
public class TextboxDaoImpl implements TextboxDao{
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Textbox getbox(Integer id) {
		
		return entityManager.find(Textbox.class, id);
	}

	@Override
	@Transactional
	public void delete(Textbox box) {
		
		entityManager.remove(box);		
	}
	
	@Override
	@Transactional
	public Textbox saveFormElement(Textbox element) {
		
		return entityManager.merge(element);
	}

}
