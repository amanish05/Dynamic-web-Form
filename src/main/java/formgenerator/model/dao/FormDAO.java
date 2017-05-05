package formgenerator.model.dao;

import java.util.List;
import java.util.Map;
import java.util.Set;

import formgenerator.model.Form;
import formgenerator.model.FormFile;

public interface FormDAO {
	Form getForm(Integer id);
	Form saveForm(Form form);
	boolean delete(Form form);
	List<Form> getForms();
	Set<Form> findByNamedQuery(String query, Map<String, String> param);
	FormFile saveFormFile(FormFile formFile);
	FormFile getFormFile(Integer fileId);
	FormFile getFormFile(Integer formId, Integer userId);
}
