package com.object.form.model.dao;

import java.util.List;

import com.object.form.model.Form;

public interface FormDao {
	Form getForm(Integer id);
	Form saveForm(Form form);
	boolean delete(Form form);
	List<Form> getForms();
}
