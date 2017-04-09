package com.object.form.model.dao;

import com.object.form.model.Textbox;

public interface TextboxDao {
	
	Textbox getbox(Integer id);	
	
	void delete(Textbox box);
	
	Textbox saveFormElement(Textbox element);

}
