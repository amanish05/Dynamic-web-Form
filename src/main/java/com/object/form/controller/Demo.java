package com.object.form.controller;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.object.form.services.DemoServices;


@Controller
public class Demo {
	
//	@Inject
//	private DemoServices demo;
	
	@RequestMapping(value = "/demo.jsp", method = RequestMethod.GET)
	public String readClient(ModelMap model){
		
//		model.put("members", demo.getAllUSers());
		return "demo";		
		
	}

}
