package com.object.form.dao;

package springmvc.model.dao;

import java.util.List;

import com.object.form.model.User;

public interface UserDao {

    User getUser( Integer id );

    List<User> getUsers();

}