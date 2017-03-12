package com.object.form.dao;

import java.util.List;

public interface MemberDao {

    Member getMember( Integer id );

    List<Member> getMembers();

}