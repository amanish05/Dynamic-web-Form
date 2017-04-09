package com.object.form.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.object.form.model.Form;
import com.object.form.model.FormElement;
import com.object.form.model.MultipleChoice;
import com.object.form.model.Page;
import com.object.form.model.Textbox;
import com.object.form.model.dao.FormDao;
import com.object.form.model.dao.FormElementDao;
import com.object.form.model.dao.PageDao;
import com.object.form.model.dao.TextboxDao;

@Controller
public class ObjectFormController {
	
	private static Logger logger = LoggerFactory.getLogger( ObjectFormController.class );
	
	@Autowired
	private FormDao formdao;
	
	@Autowired
	private PageDao pagedao;
	
	@Autowired
	private FormElementDao elementdao;
	
	@Autowired
	private TextboxDao textboxdao;
	
	@RequestMapping("/Home.html")
	public String mainPage(ModelMap model) {		
		logger.debug("Received request for: /Home.html");
		model.put("forms", formdao.getForms());
	    return "Home";
	 }
	
	@RequestMapping(value = "/NewForm.html", method = RequestMethod.GET)
    public String generateNewForm(ModelMap maps) {
		logger.debug("Received request for: /NewForm.html GET");
		maps.put("form", new Form());
		return "form/NewForm";
    }
	
	@RequestMapping(value = "/NewForm.html", method = RequestMethod.POST)
    public String generateNewForm(@ModelAttribute Form form, ModelMap map) {
		logger.debug("Received request for: /NewForm.html POST");
		formdao.saveForm(form);		
		return "redirect:Home.html";
    }
	
	@RequestMapping(value = "/EditForm.html", method = RequestMethod.GET)
	public String editForm(@RequestParam Integer id, ModelMap model) {
		
		logger.debug("Received request for: /EditForm.html/" +id);		
		model.put("form", formdao.getForm(id));
		model.put("formElement", elementdao.getFormElements(id));
	    return "form/EditForm";
	 }
	
	@RequestMapping(value = "/EditForm.html", method = RequestMethod.POST)
	public String editMainPage(@ModelAttribute Form form) {
		
		logger.debug("Received request for: /EditForm.html/");
		form = formdao.saveForm(form);
		return "redirect:Home.html";  
	 }
	
	@RequestMapping(value = "/AddElement.html", method = RequestMethod.GET)
	public String addElement(@RequestParam Integer formId, ModelMap model) {
		
		logger.debug("Received request for: /AddElement.html/ GET");
		model.put("form", formdao.getForm(formId));
		return "form/AddElement";
	 }	
			
	@RequestMapping(value = "/textbox.html", method = RequestMethod.GET)
    public String addTextBox(@RequestParam Integer formId, ModelMap model) {
		
		logger.debug("Received request for: /textbox.html GET" +formId);
		model.put("formElement", new Textbox());
        return "form/textbox";
    }
	
	@RequestMapping(value = "/textbox.html", method = RequestMethod.POST)
    public String addBox(@RequestParam Integer formId, @ModelAttribute Textbox textbox) {
		
		logger.debug("Received request for: /textbox.html POST" +textbox);
		textbox.setForm(formdao.getForm(formId));
    	elementdao.saveFormElement(textbox);
        return "redirect:EditForm.html?id=" + formId;
    }
	
	@RequestMapping(value = "/EditElement.html", method = RequestMethod.GET)
    public String editElement(@RequestParam Integer elementId, @RequestParam Integer formId, ModelMap map) {
		
		logger.debug("Received request for: /EditElement.html GET" +elementId);				
		FormElement element = elementdao.getElement(elementId);
		
		logger.debug("Received request for: /EditElement.html GET, element.getDecriminatorValue()=" +element.getDecriminatorValue().equals("TextBox"));	
		if(element.getDecriminatorValue().equals("TextBox")){
			Textbox textbox = textboxdao.getbox(elementId);
			map.put("textbox", textbox);
			map.put("formId", formId);
			map.put("elementId", elementId);
			logger.debug("Indside of  /EditElement.html GET, Id=" +textbox.getId());
			return "form/Edittextbox";
		}
		return "redirect:EditForm.html?id=" + formId;
    }
	
	@RequestMapping(value = "/EditElement.html", method = RequestMethod.POST)
    public String editElement(@RequestParam Integer formId, @RequestParam Integer elementId, @ModelAttribute Textbox textbox) {
		
		logger.debug("Received request for: /EditElement.html POST" +textbox.getId());		
		textbox.setForm(formdao.getForm(formId));
		textbox.setId(elementId);
    	textboxdao.saveFormElement(textbox);
        return "redirect:EditForm.html?id=" + formId;
    }
	
	
	@RequestMapping(value = "/DeleteElement.html", method = RequestMethod.GET)
    public String deleteElement(@RequestParam Integer elementId, @RequestParam Integer formId, ModelMap map) {
		
		logger.debug("Received request for: //DeleteElement.html GET" +elementId);				
		elementdao.delete(elementdao.getElement(elementId));		
		return "redirect:EditForm.html?id=" + formId;
    }
	
	
	@RequestMapping(value = "/checkbox.html", method = RequestMethod.GET)
    public String checkBox(@RequestParam Integer formId, ModelMap model) {
		
		logger.debug("Received request for: /checkbox.html GET" +formId);
		model.put("formElement", new MultipleChoice());
		model.put("formId", formId);
        return "form/checkbox";
    }
	
	@RequestMapping(value = "/checkbox.html", method = RequestMethod.POST)
    public String checkBox(@RequestParam Integer formId, @ModelAttribute MultipleChoice choices) {
		
		logger.debug("Received request for: /checkbox.html POST" +formId);
		
		choices.setForm(formdao.getForm(formId));
    	elementdao.saveFormElement(choices);
        return "redirect:EditForm.html?id=" + formId;
    }
	
	
	
	
	
	
	
	@RequestMapping(value = "/adminpage.html", method = RequestMethod.GET)
    public String adminLogin(ModelMap maps) {
		logger.debug("Received Request at controller: /adminpage.html");
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
	
	@RequestMapping(value = "/userfillform.html", method = RequestMethod.GET)
    public String userFillForm() {
        return "userfillform";
    }
	
	@RequestMapping(value = "/registeredusers.html", method = RequestMethod.GET)
    public String registeredUser() {
        return "registeredusers";
    }	
	
	
	@RequestMapping(value = "/form/editform.html", method = RequestMethod.POST)
    public String editForm(@ModelAttribute Form form) {
		form = formdao.saveForm(form);
        return "redirect:../generatedforms.html";
    }
	
	@RequestMapping(value = "/page/pagelistview.html", method = RequestMethod.GET)
    public String viewPages(ModelMap models) {
		models.put("pages", pagedao.getPages());
        return "page/pagelistview";
    }
	
	@RequestMapping(value = "/page/addpage.html", method = RequestMethod.GET)
    public String addPage(ModelMap models) {
        models.put("page", new Page());
		return "page/addpage";
    }
	
	@RequestMapping(value = "/page/addpage.html", method = RequestMethod.POST)
    public String addPage(@ModelAttribute Page page) {
		pagedao.savePage(page);
        return "redirect:pagelistview.html";
    }
	
	@RequestMapping(value = "/page/deletepage.html")
    public String addPage(@RequestParam Integer id) {
		pagedao.delete(pagedao.getPage(id));
        return "redirect:pagelistview.html";
    }
	
	@RequestMapping(value = "/page/editpage.html", method = RequestMethod.GET)
    public String editPage(@RequestParam Integer id, ModelMap models) {
		models.put("page", pagedao.getPage(id));
        return "page/editpage";
    }
	
	@RequestMapping(value = "/page/editpage.html", method = RequestMethod.POST)
    public String editPage(@ModelAttribute Page page) {
		pagedao.savePage(page);
        return "redirect:pagelistview.html";
    }
	
	@RequestMapping(value = "/form/formelementlist.html", method = RequestMethod.GET)
    public String displayElements(@RequestParam Integer id, ModelMap models) {
		models.put("elements", pagedao.getElementsByPageId(id));
		models.put("page", pagedao.getPage(id));
		 return "/form/formelementlist";
    }
	
	@RequestMapping(value = "/form/multiplechoice.html", method = RequestMethod.GET)
    public String addFormElements(ModelMap models) {
		models.put("element", new MultipleChoice());
        return "form/addformelements";
    }
	
	@RequestMapping(value = "/form/multiplechoice.html", method = RequestMethod.POST)
    public String addFormElements(@ModelAttribute MultipleChoice element) {
        elementdao.saveFormElement(element);
		return "redirect:formelementlist";
    }
	
	
}
