package com.object.form.dao;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

@Repository
@Transactional
public class AbstractObjectFormDAO<T extends Serializable>  {
	
	@PersistenceContext
	private EntityManager em;
	 
	
	public T create(T entity) {
		
		em.getTransaction().begin();
		em.persist(entity);
		em.getTransaction().commit();
		em.close();
		return entity;
	}
	 	
	
	 public T update(T entity) {
		
		em.getTransaction().begin();
		T updatedEntity = em.merge(entity);
		em.getTransaction().commit();
		em.close();
		return updatedEntity;
	}
		
	
	public void delete(T entity) {
		
		em.getTransaction().begin();
		em.remove(entity);
		em.getTransaction().commit();
		em.close();
	}
	
	public List<T> findByCriteria(Map<String, String> params, Class<T> c) {

		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<T> q = cb.createQuery(c);
		List<Predicate> predicates = new ArrayList<Predicate>();
		Root<T> t = q.from(c);

		params.forEach((k, v) -> predicates.add(cb.equal(t.get(k), v)));
		q.select(t).where(predicates.toArray(new Predicate[] {}));
		List<T> results = em.createQuery(q).getResultList();
		em.close();

		return results;
	}

	
	public void updateList(List<T> entityList) {
		// TODO Auto-generated method stub
		
	}
	
	@SuppressWarnings("unchecked")
	public  List<T> getMembers(){
	
		List<T> results = em.createQuery("Select * from Members").getResultList();
		return results;
	};
}
