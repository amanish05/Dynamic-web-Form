package com.object.form.dao;

import org.springframework.beans.factory.config.BeanDefinition;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Repository;

import com.object.form.model.Form;


@Repository
@Scope(BeanDefinition.SCOPE_PROTOTYPE )
public class FormDAO extends AbstractObjectFormDAO<Form> implements ObjectFormDAOI<Form>{

}
