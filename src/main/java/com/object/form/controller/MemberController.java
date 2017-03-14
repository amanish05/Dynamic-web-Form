package com.object.form.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import com.object.form.model.Member;
import com.object.form.services.MemberService;

@Controller
public class MemberController {

	@Autowired
	private MemberService memberService;

	@RequestMapping(value = "/member/list.html")
	public String memberlList(ModelMap maps) {
		List<Member> members = memberService.getMembers();
		maps.put("members", members);
		return "member/list";
	}

	@RequestMapping(value = "/member/add.html")
	public String add(ModelMap maps) {
		return "member/add";
	}

	@RequestMapping(value = "/member/edit.html")
	public String edit(@RequestParam Integer id, ModelMap maps) {
		Member member = memberService.getMember(id);
		maps.put("member", member);
		return "member/edit";
	}

	@RequestMapping(value = "/member/delete.html")
	public String delete(@RequestParam Integer id) {
		memberService.deleteMember(id);
		return "redirect:/member/list.html";
	}

	@RequestMapping(value = "/member/save.html", method = RequestMethod.POST)
	public String save(@ModelAttribute Member member, SessionStatus status) {
		memberService.saveMember(member);
	
		return "redirect:/member/list.html";
	}
}
