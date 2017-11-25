package com.yash.HMS.controllers;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yash.HMS.models.User;
import com.yash.HMS.repositories.UserRepository;

@RequestMapping("/users")
@Controller
public class UserController {
	@Autowired
	UserRepository rep;
	@RequestMapping(method=GET)
public String getUsers(Model model, HttpServletRequest req){
		HttpSession session =  req.getSession(false); 
		if(session==null){
			model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
			model.addAttribute("error", "Login to continue!");
			return "index";	
		}
		else{
		List<User> users = new ArrayList<>();
	rep.findAll().forEach((u)->users.add(u));
	model.addAttribute("endusers", users);
	return "users";}
}
	@RequestMapping(value="/userAdd",method=GET)
	public String addUser(Model model, HttpServletRequest req){
		HttpSession session =  req.getSession(false); 
		if(session==null){
			model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
			model.addAttribute("error", "Login to continue!");
			return "index";	
		}
		else{
			User user = new User();
			user = null;
			model.addAttribute("user", user);
		return "newUser";}
	}
	@RequestMapping(value="/addUser",method=POST)
	public String addUser1(Model model, HttpServletRequest req){
		HttpSession session =  req.getSession(false); 
		if(session==null){
			model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
			model.addAttribute("error", "Login to continue!");
			return "index";	
		}
		else{
			User user = new User();
			user.setfName(req.getParameter("fName"));
			user.setlName(req.getParameter("lName"));
			user.setUser(req.getParameter("user"));
			user.setPass(req.getParameter("pass"));
			user.setRole(req.getParameter("role"));
			rep.save(user);
			List<User> users = new ArrayList<>();
			rep.findAll().forEach((u)->users.add(u));
			model.addAttribute("endusers", users);
			return "users";}
	}
	@RequestMapping(value="/userEdit/{id}/",method=GET)
	public String editUser(Model model, HttpServletRequest req, @PathVariable int id){
		HttpSession session =  req.getSession(false); 
		if(session==null){
			model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
			model.addAttribute("error", "Login to continue!");
			return "index";	
		}
		else{
			User user = new User();
			user = rep.findOne(id);
			model.addAttribute("action", "edit");
			model.addAttribute("user", user);
		return "newUser";}
	}
	@RequestMapping(value="/editUser/{id}/",method=POST)
	public String editUser1(Model model, HttpServletRequest req, @PathVariable int id){
		HttpSession session =  req.getSession(false); 
		if(session==null){
			model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
			model.addAttribute("error", "Login to continue!");
			return "index";	
		}
		else{
			User user = new User();
			user.setId(id);
			user.setfName(req.getParameter("fName"));
			user.setlName(req.getParameter("lName"));
			user.setUser(req.getParameter("user"));
			user.setPass(req.getParameter("pass"));
			user.setRole(req.getParameter("role"));
			rep.save(user);
			List<User> users = new ArrayList<>();
			rep.findAll().forEach((u)->users.add(u));
			model.addAttribute("endusers", users);
			return "users";}
	}
	@RequestMapping(value="/delete/{id}/",method=GET)
	public String deleteUser(Model model, HttpServletRequest req, @PathVariable int id){
		HttpSession session =  req.getSession(false); 
		if(session==null){
			model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
			model.addAttribute("error", "Login to continue!");
			return "index";	
		}
		else{
			User user = new User();
			user = rep.findOne(id);
			model.addAttribute("user", user);
			model.addAttribute("action", "delete");
		return "newUser";}
	}
	@RequestMapping(value="/delete/{id}/",method=POST)
	public String delete(Model model, HttpServletRequest req, @PathVariable int id){
		HttpSession session =  req.getSession(false); 
		if(session==null){
			model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
			model.addAttribute("error", "Login to continue!");
			return "index";	
		}
		else{
			rep.delete(id);
			List<User> users = new ArrayList<>();
			rep.findAll().forEach((u)->users.add(u));
			model.addAttribute("endusers", users);
			return "users";}
	}
}
