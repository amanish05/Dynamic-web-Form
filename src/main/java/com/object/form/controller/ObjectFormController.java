package com.object.form.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.object.form.model.Form;
import com.object.form.services.HomeServices;
import com.object.form.services.SingleFormServices;

@Controller
@SessionAttributes({"form"})
public class ObjectFormController {
	
	@Autowired
	private HomeServices home;
	
	@Autowired
	private SingleFormServices singleForm;
	
	@RequestMapping("/Home.html")
    public String mainPage(ModelMap model) {
		model.put("forms", home.getAllForms());
        return "Home";
    }
	
	@RequestMapping(value = "/adminpage.html", method = RequestMethod.GET)
    public String adminLogin(ModelMap maps) {
        return "adminpage";
    }
	
	@RequestMapping(value = "/adminpage.html", method = RequestMethod.POST)
    public String adminLogin() {
        return "adminpage";
    }
	
	@RequestMapping(value = "/userpage.html", method = RequestMethod.GET)
    public String userLogin(ModelMap maps) {
        return "userpage";
    }
	
	@RequestMapping(value = "/userpage.html", method = RequestMethod.POST)
    public String userLogin() {
        return "userpage";
    }
	
	@RequestMapping(value = "/registernewuser.html", method = RequestMethod.GET)
    public String registerNewUser(ModelMap maps) {
        return "registernewuser";
    }
	
	@RequestMapping(value = "/generatenewform.html", method = RequestMethod.GET)
    public String generateNewForm(ModelMap maps) {
        return "generatenewform";
    }
	
	@RequestMapping(value = "/generatenewform.html", method = RequestMethod.POST)
    public String generateNewForm() {
        return "adminpage";
    }
	
	@RequestMapping(value = "/generatedforms.html", method = RequestMethod.GET)
    public String generatedForms(ModelMap model) {
		model.put("forms", home.getAllForms());
        return "generatedforms";
    }
	
	@RequestMapping(value = "/addformelements.html", method = RequestMethod.POST)
    public String addFormElements() {
        return "addformelements";
    }
	
	@RequestMapping(value = "/userfillform.html", method = RequestMethod.GET)
    public String userFillForm() {
        return "userfillform";
    }
	
	@RequestMapping(value = "/registeredusers.html", method = RequestMethod.GET)
    public String registeredUser() {
        return "registeredusers";
    }
	
	@RequestMapping(value = "/EditForm.html", method = RequestMethod.GET)
    public String editForm( @RequestParam Integer id, ModelMap models) {
		models.put("form", singleForm.getSingleForm(id));
        return "EditForm";
    }
	
	@RequestMapping(value = "/CreateForm.html", method = RequestMethod.GET)
    public String createForm(ModelMap models) {
        models.put("form", new Form());
		return "CreateForm";
    }
	
	@RequestMapping(value = "/CreateForm.html", method = RequestMethod.POST)
    public String createForm(@ModelAttribute Form form, BindingResult result, SessionStatus sessionStatus) {
		
		form = singleForm.saveForm(form);
		sessionStatus.setComplete();
		return "redirect:Home.html";
    }
	
	
	
}
