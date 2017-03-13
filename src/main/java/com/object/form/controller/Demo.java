package com.object.form.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.object.form.services.DemoServices;


@Controller
public class Demo {
	
	@Autowired
	private DemoServices demo;
	
	@RequestMapping(value = "/demo.html", method = RequestMethod.GET)
	public String readClient(ModelMap model){
		
		model.put("members", demo.getAllUSers());
		return "demo";		
		
	}

}
