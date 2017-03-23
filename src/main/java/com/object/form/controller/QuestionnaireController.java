package com.object.form.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.object.form.model.Question;
import com.object.form.services.QuestionnaireService;

@Controller
public class QuestionnaireController {
	@Autowired
	private QuestionnaireService questionnaireService;

	@RequestMapping(value = "/questionnaire/list.html")
	public String memberlList(ModelMap maps) {
		List<Question> question = questionnaireService.getQuestionnaire();
		maps.put("question", question);
		return "questionnaire/list";
	}

	@RequestMapping(value = "/questionnaire/add.html")
	public String add(ModelMap maps) {
		return "questionnaire/add";
	}

	@RequestMapping(value = "/questionnaire/save.html", method = RequestMethod.POST)
	public String save(@ModelAttribute Question question, SessionStatus status) {
		System.out.println(status);
		questionnaireService.saveQuestion(question);
		return "redirect:/questionnaire/list.html";
	}

	@RequestMapping(value = "/questionnaire/edit.html")
	public String edit(@RequestParam Integer id, ModelMap maps) {
		Question question = questionnaireService.getQuestion(id);
		maps.put("question", question);
		return "questionnaire/edit";
	}

	@RequestMapping(value = "/questionnaire/delete.html")
	public String delete(@RequestParam Integer id) {
		questionnaireService.deleteQuestion(id);
		return "redirect:/questionnaire/list.html";
	}

	@RequestMapping(value = "/questionnaire/page.html")
	public ModelAndView page() {
		ModelAndView mv = new ModelAndView("/questionnaire/page");
		List questions = questionnaireService.getQuestionnaire();
		mv.addObject("questions", questions);
		return mv;
	}
}
