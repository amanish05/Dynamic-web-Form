package com.object.form.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;

import com.object.form.dao.ObjectFormDAOI;
import com.object.form.model.Member;

public class DemoServices {
	
	private final ObjectFormDAOI<Member> memberDao;
	
	@Autowired	
	public DemoServices(@Qualifier("DemoDAO") final ObjectFormDAOI<Member> dao){
		this.memberDao = dao;
	}
	
	public List<Member> getAllUSers(){
		return memberDao.getMembers();
	}

}
