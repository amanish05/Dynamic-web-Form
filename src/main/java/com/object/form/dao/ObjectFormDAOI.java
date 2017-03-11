package com.object.form.dao;

import java.util.List;

public interface ObjectFormDAOI<T> {
	
	T create(T entity);
	T update(T entity);
	void delete(T entity);
	void updateList(List<T> entityList);
	List<T> getMembers();

}
