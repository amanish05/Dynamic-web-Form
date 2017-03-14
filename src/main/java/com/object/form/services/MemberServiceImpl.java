package com.object.form.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.object.form.dao.MemberDao;
import com.object.form.model.Member;

@Service
@Transactional
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	public Member saveMember(Member member) {
		return memberDao.saveMember(member);
	}

	public Member getMember(Integer id) {
		return memberDao.getMember(id);
	}

	public void deleteMember(Integer id) {
		memberDao.deleteMember(id);
	}

	public List<Member> getMembers() {
		return memberDao.getMembers();
	}
}
