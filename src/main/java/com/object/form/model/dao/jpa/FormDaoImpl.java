package com.object.form.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.object.form.model.Form;
import com.object.form.model.dao.FormDao;


@Repository
public class FormDaoImpl implements FormDao {
	
	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public Form getForm(Integer id)
	{
		return entityManager.find(Form.class, id);
	}
	
	@Override
	@Transactional
	public Form saveForm(Form form)
	{
		return entityManager.merge(form);	
	}
	
	@Override
	@Transactional
	public boolean delete(Form form)
	{
		return true;
	}
	
	@Override
	public List<Form> getForms()
	{
		 return entityManager.createQuery( "from Form order by id", Form.class )
		            .getResultList();
	}
}
