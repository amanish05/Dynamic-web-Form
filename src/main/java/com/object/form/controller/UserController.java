package com.object.form.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import springmvc.model.dao.UserDao;
// import annotation needed

@Controller
@SessionAttributes("user")
public class UserController {

    @Autowired
    private UserDao userDao;

    @RequestMapping("/user/list.html")
    public String users( ModelMap models )
    {
    		List<User> users = userDao.getUsers();
    		model.put("users", users);
       // models.put( "users", userDao.getUsers() );
    	
        return "user/list";
    }
 
//    @RequestMapping("/user/view.html")
//    public String view( @RequestParam Integer id, ModelMap models  )
//    {
//    		
//    		models.put( "user", userDao.getUsers(id));
//    	
//        return "user/view";
//    }
//
//    @RequestMapping("/user/view/{id}.html")
//    public String view1( @RequestParam Integer id, ModelMap models  )
//    {
//    		
//    		//models.put( "users", userDao.getUsers(id));
//    	
//        return view(id, models);
//    }
    
    @RequestMapping("/user/add.html", method = RequestMethod.GET)
    public String add(ModelMap models)
    {    	
    	models.put("user", new User());
        return "user/add";
    }
    
    @RequestMapping(value="/user/add.html", method=RequestMethod.POST)
    public String add(@ModelAttribute User user)
    {
//    	User user = new User();
//    	user.setUsername( username);
//    	user.setPassword( password);
    	
    	user = userDao.saveUser(user);
    	
    	return "redirect:list.html";
    }
    
    @RequestMapping(value="/user/edit.html", method=RequestMethod.GET)
    public String edit(@RequestParam Integer id, ModelMap models )
    {

    	models.put("user", userDao.getUser(id));
    	
    	return "user/edit";
    }
    
    @RequestMapping(value="/user/edit.html", method=RequestMethod.POST)
    public String edit(@ModelAttribute User user, SessionStatus status)
    {
    	//save urser database
    	user = userDao.saveUser(user);
    	
    	status.setComplete();
    	return "redirect:list.html";
    }
    
    
    @RequestMapping(value="/user/delete.html", method=RequestMethod.POST)
    public String delete(@ModelAttribute User user, SessionStatus status)
    {
    	
    	user = userDao.deleteUser(user);
    	
    	status.setComplete();
    	return "redirect:delete.html";
    }
}






















































