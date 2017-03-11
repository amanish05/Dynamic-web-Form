package objectform.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ObjectFormController {
	
	@RequestMapping({"/index.html", "/mainpage.html"})
    public String mainPage() {
        return "mainpage";
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
    public String generatedForms(ModelMap maps) {
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
}
