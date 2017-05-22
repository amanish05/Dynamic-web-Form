package formgenerator.model.dao;

import java.util.List;
import java.util.Map;

import formgenerator.model.FileUploadForm;

public interface FileUploadFormDAO {
	
	List<FileUploadForm> findByNamedQuery(String query, Map<String, String> param);

}
