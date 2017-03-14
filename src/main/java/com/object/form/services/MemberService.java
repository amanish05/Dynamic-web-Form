package com.object.form.services;

import java.util.List;

import com.object.form.model.Member;

public interface MemberService {

	public Member saveMember(Member member);

	public Member getMember(Integer id);

	public void deleteMember(Integer id);

	public List<Member> getMembers();
}
