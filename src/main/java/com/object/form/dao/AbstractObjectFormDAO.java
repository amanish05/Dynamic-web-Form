package com.object.form.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
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

@SuppressWarnings("unchecked")
@Repository
@Transactional
public abstract class AbstractObjectFormDAO<T extends Serializable>  {
	
	@PersistenceContext
	private EntityManager em;
	private Class<T> daoType;
	
	public AbstractObjectFormDAO(){
		Type e = getClass().getGenericSuperclass();
        ParameterizedType pt = (ParameterizedType) e;
        daoType = (Class) pt.getActualTypeArguments()[0];
	}
	
	public T create(T entity) {		
		em.persist(entity);		
		return entity;
	}
	 	
	
	 public T update(T entity) {		
		T updatedEntity = em.merge(entity);		
		return updatedEntity;
	}
		
	
	public void delete(T entity) {
		em.remove(entity);		
	}
	
	public void updateList(List<T> entityList) {
		// TODO Auto-generated method stub		
	}
	
	public List<T> findByCriteria(Map<String, String> params, Class<T> c) {

		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<T> q = cb.createQuery(c);
		List<Predicate> predicates = new ArrayList<Predicate>();
		Root<T> t = q.from(c);

		params.forEach((k, v) -> predicates.add(cb.equal(t.get(k), v)));
		q.select(t).where(predicates.toArray(new Predicate[] {}));
		List<T> results = em.createQuery(q).getResultList();	

		return results;
	}
	
	public  List<T> getMembers(){	
		List<T> results = (List<T>) em.createQuery("from Member order by id", daoType ).getResultList();
		return results;
	}
}
