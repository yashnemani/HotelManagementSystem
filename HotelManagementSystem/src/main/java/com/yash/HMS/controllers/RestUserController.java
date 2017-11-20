package com.yash.HMS.controllers;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yash.HMS.models.User;
import com.yash.HMS.repositories.UserRepository;

@RestController
@RequestMapping("/user")
public class RestUserController {
	@Autowired
	private UserRepository rep;
	
	@RequestMapping(value="/add", method=POST) 
public void addUser(@RequestBody User user){
rep.save(user);
	}
	@RequestMapping(method=GET) 
public void getUsers(){
rep.findAll().forEach((c)->System.out.println(c.getfName()));
	}
}