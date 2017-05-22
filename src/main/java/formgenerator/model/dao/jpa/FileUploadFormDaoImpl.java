package formgenerator.model.dao.jpa;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;

import formgenerator.model.FileUploadForm;
import formgenerator.model.dao.FileUploadFormDAO;

@Repository
public class FileUploadFormDaoImpl implements FileUploadFormDAO{
	
	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public List<FileUploadForm> findByNamedQuery(String namedquery, Map<String, String> param) {
		
		TypedQuery<FileUploadForm> query = entityManager.createNamedQuery(namedquery, FileUploadForm.class);
		param.forEach((k, v) -> {			
			query.setParameter(k, Integer.parseInt(v));
		});

		List<FileUploadForm> results = new ArrayList<>(query.getResultList());		
		return results;
	}

}
