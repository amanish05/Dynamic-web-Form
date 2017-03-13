package com.object.form.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

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
	
	public  List<T> getMembers(){	
		List<T> results = (List<T>) em.createQuery("from Member order by id", daoType ).getResultList();
		return results;
	}
}
