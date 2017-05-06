package formgenerator.model.dao.jpa;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import formgenerator.model.Form;
import formgenerator.model.dao.FormDAO;


@Repository
public class FormDaoImpl implements FormDAO {
	
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
		entityManager.remove(form);
		return true;
	}
	
	@Override
	public List<Form> getForms()
	{
		 return entityManager.createQuery( "from Form order by id asc", Form.class )
		            .getResultList();
	}
	
	@Override
	public Set<Form> findByNamedQuery(String namedquery, Map<String, String> param) {
		
		TypedQuery<Form> query = entityManager.createNamedQuery(namedquery, Form.class);
		param.forEach((k, v) -> {			
			query.setParameter(k, Integer.parseInt(v));
		});

		Set<Form> results = new HashSet<>(query.getResultList());		
		return results;
	}
}
