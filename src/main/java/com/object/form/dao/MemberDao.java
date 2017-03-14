package com.object.form.dao;

import java.util.List;

import com.object.form.model.Member;

public interface MemberDao {

	public Member saveMember(Member member);

	public Member getMember(Integer id);

	public void deleteMember(Integer id);

	public List<Member> getMembers();
}
