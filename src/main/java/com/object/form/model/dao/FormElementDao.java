package com.object.form.model.dao;

import java.util.List;

import com.object.form.model.FormElement;

public interface FormElementDao {

	FormElement getFormElementById(Integer id);
	
	FormElement saveFormElement(FormElement element);
	
	void delete(FormElement element);
	
	List<FormElement> getFormElements();
}