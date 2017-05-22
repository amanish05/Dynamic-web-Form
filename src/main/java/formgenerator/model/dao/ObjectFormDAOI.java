package formgenerator.model.dao;

import java.util.Map;

public interface ObjectFormDAOI<T> {
	
	T findByCriteria(Map<String, String> params, Class<T> c);
	public T update(T entity);

}