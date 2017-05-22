package formgenerator.model.dao.jpa;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import formgenerator.model.PDFElement;
import formgenerator.model.dao.PDFElementDAO;

@Repository
public class PDFElementDaoImpl implements PDFElementDAO{	
	
	@PersistenceContext
	private EntityManager entityManager;	
	
	@Override
	@Transactional
	public boolean savePDFElement (PDFElement pdfelement) {

		entityManager.merge(pdfelement);
		return true;
	}

}
