package com.yash.HMS.controllers;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.context.request.WebRequest;

import com.yash.HMS.models.Customer;
import com.yash.HMS.repositories.CustomerRepository;

@RestController
@RequestMapping("/customer")
public class RestCustomerController {
	@Autowired
	private CustomerRepository rep;
	
	@RequestMapping(value="/add", method=POST) 
	public int create(WebRequest req) throws SQLException{
		Customer customer = new Customer();
		customer.setfName(req.getParameter("fName"));
		customer.setlName(req.getParameter("lName"));
		customer.setAddress1(req.getParameter("address1"));
		customer.setAddress2(req.getParameter("address2"));
		customer.setPhone(req.getParameter("phone"));
		customer.setCountry(req.getParameter("country"));
		 DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		 Date date;
		try {
			date = df.parse(req.getParameter("dob"));
			customer.setDob(date);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		rep.save(customer);
		Customer c = new Customer();
		c = findCustomer(customer.getPhone());
		
		int id = c.getId();
	return id;
}
	@RequestMapping(method=GET) 
public void getCustomers(){
	rep.findAll().forEach((c)->System.out.println(c.getfName()));
	}
	@RequestMapping(value="/available/{phone}/", method=GET) 
public @ResponseBody Customer findCustomer(@PathVariable(value="phone") String phone){
		Customer cus = new Customer();
	cus = rep.findCustomer(phone);
	if(cus!=null)
		System.out.println(cus.getfName());
	else{
		Customer c = new Customer();
		c.setfName("yoyo");
		return c;
	}
	return cus;
	}
/*	@RequestMapping(method=POST)
	public void konda(@ModelAttribute("customer") Customer customer){
		System.out.println(customer.getfName());
	}*/
}
