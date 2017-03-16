package com.object.form.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.object.form.model.Member;
import com.object.form.model.dao.MemberDAO;

@Controller
@SessionAttributes("member")
public class MemberController {

	@Autowired
	private MemberDAO memberDao;
	
	@RequestMapping("/member/list.html")
	private String list( ModelMap model)
	{
		List<Member> members = memberDao.getMembers();
		
		model.put("members", members);
		
		return "member/list";
	}
	
	@RequestMapping(value="/member/view.html",method = RequestMethod.GET)
	private String view(@RequestParam Integer id,ModelMap model)
	{
		Member member = memberDao.getMember(id);
		
		model.put("member", member);
		
		return "member/view";
	}
	
	@RequestMapping(value="/member/add.html",method = RequestMethod.GET)
	private String add(ModelMap model)
	{
		Member member = new Member();
		
		model.put("member", member);
		
		return "member/add";
	}
	
	@RequestMapping(value="/member/add.html",method = RequestMethod.POST)
	private String add( @ModelAttribute Member member)
	{
		Member savedMember = memberDao.saveMember(member);
		
		return "redirect:list.html";
	}

	@RequestMapping(value="/member/edit.html",method = RequestMethod.GET)
	private String edit(@RequestParam Integer id ,ModelMap model)
	{
		Member member = new Member();
		
		model.put("member", memberDao.getMember(id));
		
		return "member/edit";
	}
	
	@RequestMapping(value="/member/edit.html",method = RequestMethod.POST)
	private String edit( @ModelAttribute Member member, SessionStatus status)
	{
		Member savedMember = memberDao.saveMember(member);
		
		status.setComplete();
		return "redirect:list.html";
	}
	
}
