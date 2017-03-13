package com.object.form.dao;

import java.util.List;
import java.util.Map;

public interface ObjectFormDAOI<T> {
	
	T create(T entity);
	T update(T entity);
	void delete(T entity);
	void updateList(List<T> entityList);
	List<T> findByCriteria(Map<String, String> params, Class<T> c);
	List<T> getMembers();

}
