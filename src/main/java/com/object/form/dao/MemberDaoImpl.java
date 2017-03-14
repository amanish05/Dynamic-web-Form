package com.object.form.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.object.form.model.Member;

@Repository
@Transactional
public class MemberDaoImpl implements MemberDao {

	@PersistenceContext
	private EntityManager entityManager;

	@Override
	public Member saveMember(Member member) {
		Member m = new Member();
		if (member.getId() != null && member.getId() > 0) {
			m = this.getMember(member.getId());
		}
		BeanUtils.copyProperties(member, m);
		entityManager.merge(m);
		return m;
	}

	@Override
	public Member getMember(Integer id) {
		return entityManager.find(Member.class, id);
	}

	@Override
	public void deleteMember(Integer id) {
		Member member = this.getMember(id);
		entityManager.remove(member);
	}

	@Override
	public List<Member> getMembers() {
		return entityManager.createQuery(" from Member order by id ", Member.class).getResultList();
	}
}
