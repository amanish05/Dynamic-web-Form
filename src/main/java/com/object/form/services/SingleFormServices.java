package com.object.form.services;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.object.form.model.Form;

@Repository
public class SingleFormServices {
	
	@PersistenceContext
	private EntityManager em;
	
	public Form getSingleForm(Integer id) {
		return em.find(Form.class, id);
	}

	@Transactional
	public Form saveForm(Form form) {
		
		return em.merge(form);
	}

}
