package com.object.form.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.object.form.model.Form;
import com.object.form.model.Page;
import com.object.form.model.dao.FormDao;
import com.object.form.model.dao.PageDao;

@Controller
public class ObjectFormController {
	
	@Autowired
	private FormDao formdao;
	
	@Autowired
	private PageDao pagedao;
	
	@RequestMapping("/Home.html")
    public String mainPage(ModelMap model) {
		model.put("forms", formdao.getForms());
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
		maps.put("form", new Form());
        return "generatenewform";
    }
	
	@RequestMapping(value = "/generatenewform.html", method = RequestMethod.POST)
    public String generateNewForm(@ModelAttribute Form form) {
		form = formdao.saveForm(form);
		return "redirect:generatedforms.html";
    }
	
	@RequestMapping(value = "/generatedforms.html", method = RequestMethod.GET)
    public String generatedForms(ModelMap model) {
		model.put("forms", formdao.getForms());
        return "generatedforms";
    }
	@RequestMapping(value = "/removeform.html")
    public String removeForm(@RequestParam Integer id) {
		formdao.delete(formdao.getForm(id));
        return "redirect:generatedforms.html";
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
	
	@RequestMapping(value = "/form/editform.html", method = RequestMethod.GET)
    public String editForm( @RequestParam Integer id, ModelMap models) {
		models.put("form", formdao.getForm(id));
        return "form/editform";
    }
	
	@RequestMapping(value = "/form/editform.html", method = RequestMethod.POST)
    public String editForm(@ModelAttribute Form form) {
		form = formdao.saveForm(form);
        return "redirect:../generatedforms.html";
    }
	
	@RequestMapping(value = "/createform.html", method = RequestMethod.GET)
    public String createForm(ModelMap models) {
        models.put("form", new Form());
		return "createform";
    }
	
	@RequestMapping(value = "/createform.html", method = RequestMethod.POST)
    public String createForm(@ModelAttribute Form form) {
		
		form = formdao.saveForm(form);
		return "redirect:generatedforms.html";
    }
	
	@RequestMapping(value = "/page/pagelistview.html", method = RequestMethod.GET)
    public String viewPages(ModelMap models) {
		models.put("pages", pagedao.getPages());
        return "page/pagelistview";
    }
	
	@RequestMapping(value = "page/addpage.html", method = RequestMethod.GET)
    public String addPage(ModelMap models) {
        models.put("page", new Page());
		return "page/addpage";
    }
	
	@RequestMapping(value = "page/addpage.html", method = RequestMethod.POST)
    public String addPage(@ModelAttribute Page page) {
		pagedao.savePage(new Page());
        return "redirect:page/pagelistview";
    }
	
}
