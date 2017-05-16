package formgenerator.web.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import formgenerator.model.Answer;
import formgenerator.model.ElementsContainer;
import formgenerator.model.Form;
import formgenerator.model.FormElement;
import formgenerator.model.FormFile;
import formgenerator.model.GroupElement;
import formgenerator.model.Member;
import formgenerator.model.MultipleChoice;
import formgenerator.model.MultipleChoiceAnswer;
import formgenerator.model.Page;
import formgenerator.model.Textbox;
import formgenerator.model.TextboxAnswer;
import formgenerator.model.dao.AnswerDAO;
import formgenerator.model.dao.ElementDAO;
import formgenerator.model.dao.FormDAO;
import formgenerator.model.dao.MemberDAO;
import formgenerator.model.dao.PageDAO;

@Controller
@SessionAttributes({"form","elementsContainer"})
public class AnswerController {
	
	@Autowired
	private AnswerDAO answerDao;
	
	@Autowired
	private ElementDAO elementDao;
	
	@Autowired
	private FormDAO formDao;
	
	@Autowired
	private PageDAO pageDao;
	
	@Autowired
	private MemberDAO memberDao;

	@RequestMapping(value = { "/answer/userAnswers.html" }, method = RequestMethod.GET)
	private String getFormsheet(ModelMap model, @RequestParam Integer formId, @RequestParam(required = false) Integer fpId, @RequestParam Integer memberId, Principal principal) {
		
		//List<Answer> answers = answerDao.getMemberAnswers(formId, memberId);
		
		if (fpId == null) {
			fpId = 0;
		}
		
		int counter = 1, defaultPage = 0;
		boolean isValid = false;
		Form curForm = formDao.getForm(formId);
		List<Page> pages = curForm.getPages();
		
		List<String> pageLinks = new ArrayList<>(pages.size());
		for (Page p : pages) {
			if (counter == 1){
				defaultPage = p.getId();
			}
				
			if (fpId == p.getId()){
				isValid = true;
			}				
			pageLinks.add("formsheet.html?fpId=" + p.getId() + "&formId=" + formId);
			counter++;
		}

		Page p;
		if (fpId > 0 && isValid) {
			p = pageDao.getPage(fpId);

		} else {
			p = pageDao.getPage(defaultPage);
		}
		
		Member curMember = memberDao.getMemberbyUserName(principal.getName());
		
		List<FormElement> elements = new ArrayList<>();
		
		for (FormElement e : p.getElements()) {
			
			//if(e.getType().equals("GroupElement")){
			//	Map<String, String> params = new HashMap<>();
			//	params.put("id", e.getId().toString());
			//	GroupElement ge = groupDao.findByCriteria(params, GroupElement.class);
			//	elements.add(ge);				
			//}
		
			
			if(e.getType().equals("Textbox")){
				Textbox ge = (Textbox)elementDao.getElement(e.getId());
				ge.setAnswers(answerDao.getMemberAnswers(formId, memberId,ge.getId()));
				elements.add(ge);							
			}
			
			if(e.getType().equals("MultipleChoice")){
				MultipleChoice ge = (MultipleChoice)elementDao.getElement(e.getId());
				ge.setAnswers(answerDao.getMemberAnswers(formId, memberId,ge.getId()));
				elements.add(ge);								
			}
			
			//if(e.getType().equals("FormFile")){
			//	Map<String, String> params = new HashMap<>();
			//	params.put("id", e.getId().toString());
			//	FormFile ge = formfileDao.findByCriteria(params, FormFile.class);
			//	elements.add(ge);								
			//}
			//System.out.println("The type is: " +e.getType());
			
			
		}
		
		ElementsContainer elementsContainer = new ElementsContainer(elements);
		model.put("elementsContainer", elementsContainer);
		model.addAttribute("form", curForm);
		model.addAttribute("pageLinks", pageLinks);
		
		
		
		
		return "answer/userAnswers";
	}
	

}
