package com.object.form.services;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Qualifier;

import com.object.form.dao.ObjectFormDAOI;
import com.object.form.model.Form;

public class HomeServices {
	
	private final ObjectFormDAOI<Form> dao;
	
	public HomeServices(@Qualifier("FormDAO") final ObjectFormDAOI<Form> dao){
		this.dao = dao;
	}
	
	public List<Form> getAllForms(){
		return dao.findByCriteria(new HashMap<String, String>(), Form.class);
	}

}
