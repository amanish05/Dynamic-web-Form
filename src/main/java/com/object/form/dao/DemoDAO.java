package com.object.form.dao;

import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.object.form.model.Member;

@Repository
@Scope(BeanDefinition.SCOPE_PROTOTYPE )
public class DemoDAO extends AbstractObjectFormDAO<Member> implements ObjectFormDAOI<Member>{

}
