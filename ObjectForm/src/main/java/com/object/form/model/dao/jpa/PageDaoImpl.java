package com.object.form.model.dao.jpa;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.object.form.model.FormElement;
import com.object.form.model.Page;
import com.object.form.model.dao.PageDao;

@Repository
public class PageDaoImpl implements PageDao{

	
	@PersistenceContext
	private EntityManager entityManager;
	
	@Override
	public Page getPage(Integer id) {
		
		return entityManager.find(Page.class, id);
	}

	@Override
	@Transactional
	public Page savePage(Page page) {
		return entityManager.merge(page);
	}

	@Override
	@Transactional
	public void delete(Page page) {
		entityManager.remove(page);
		
	}

	@Override
	public List<Page> getPages() {
		return entityManager.createQuery( "from Page order by id", Page.class )
	            .getResultList();
	}

	@Override
	public List<FormElement> getElementsByPageId(Integer id) {
		
		return this.getPage(id).getElements();
	}

}
