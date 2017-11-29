package com.yash.HMS.controllers;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.yash.HMS.models.Customer;
import com.yash.HMS.models.Report;
import com.yash.HMS.models.Room;
import com.yash.HMS.models.User;
import com.yash.HMS.repositories.CustomerRepository;
import com.yash.HMS.repositories.ReportRepository;
import com.yash.HMS.repositories.ReservationRepository;
import com.yash.HMS.repositories.RoomRepository;
import com.yash.HMS.repositories.UserRepository;

@Controller
@RequestMapping("/")
public class MainController {
	@Autowired
	private UserRepository rep;
	@Autowired
	private RoomRepository repr;
	@Autowired
	private CustomerRepository cusrep;
	@Autowired
	private ReservationRepository rrep;
	@Autowired
	private ReportRepository rerep;
	@RequestMapping(value="/home",method=GET)
public String home(Model model){
	model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
	return "index";
}
	@RequestMapping(value="/new",method=GET)
public String newRes(Model model, HttpServletRequest req){
		HttpSession session =  req.getSession(false); 
		if(session==null){
			model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
			model.addAttribute("error", "Login to continue!");
			return "index";	
		}
		else{
		Date date = new Date();
		List<Room> rooms = new ArrayList<>();
		Calendar cal = Calendar.getInstance();
		cal.setTime( date );
		cal.add( Calendar.DATE, 1 );
		System.out.println("Date1: "+date+" Date2: "+cal.getTime());
		repr.getAvailableRooms(date,cal.getTime()).forEach((r)->rooms.add(r));
	model.addAttribute("rooms",rooms);
	return "New";}
}
	@RequestMapping(value="/newReservation",method=POST)
public String newReservation(Model model, HttpServletRequest req){
		HttpSession session =  req.getSession(false); 
		if(session==null){
			model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
			model.addAttribute("error", "Login to continue!");
			return "index";	
		}
		else{
	model.addAttribute("start", req.getParameter("date1"));
	model.addAttribute("end", req.getParameter("date2"));
	model.addAttribute("room", req.getParameter("num"));
	model.addAttribute("customer", req.getParameter("cid"));
	
	return "newReservation";}
}
	@RequestMapping(value="/customers",method=GET)
public String customers(Model model, HttpServletRequest req){
		HttpSession session =  req.getSession(false); 
		if(session==null){
			model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
			model.addAttribute("error", "Login to continue!");
			return "index";	
		}
		else{
		List<Customer> customers = new ArrayList<>();
	cusrep.findAll().forEach((c)->customers.add(c));
	model.addAttribute("customers", customers);
	return "customers";}
}
	@RequestMapping(value="/customerAdd",method=GET)
public String customerAdd(Model model,HttpServletRequest req){
		HttpSession session =  req.getSession(false); 
		if(session==null){
			model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
			model.addAttribute("error", "Login to continue!");
			return "index";	
		}
		else{
	model.addAttribute("cus"," ");
	return "customer";}
}
	@RequestMapping(value="/createCustomer",method=POST)
public String create( Model model, HttpServletRequest req) throws SQLException{
		HttpSession session =  req.getSession(false); 
		if(session==null){
			model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
			model.addAttribute("error", "Login to continue!");
			return "index";	
		}
		/*if(session!=null && session.getAttribute("log").equals("true")){}*/
		else{
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
		cusrep.save(customer);
		model.addAttribute("msg","Customer saved!");
		model.addAttribute("cus",customer);
	return "customer";}
}
	
	@RequestMapping(value="/reports",method=GET)
public String reports(Model model,HttpServletRequest req){
		HttpSession session =  req.getSession(false); 
		if(session==null){
			model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
			model.addAttribute("error", "Login to continue!");
			return "index";	
		}
		else{
			List<Report> reports = new ArrayList<Report>();
	rerep.findAll().forEach((r)->reports.add(r));
			model.addAttribute("reports",reports);
	return "IncomeReports";}
}
	//Login and Logout Control
	@RequestMapping(value="/login",method=POST)
public String login(Model model, HttpServletRequest req){
		HttpSession session = req.getSession(true);
			String user = req.getParameter("user");
			String pass = req.getParameter("pass");
			User u = new User();
				u = rep.verifyLogin(user, pass);
				
			if (u.getfName()!=null){
			session.setAttribute("users", u);
			session.setAttribute("log", "true");
				model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
				return "success";	
			}
			else{
				model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
				model.addAttribute("error", "Login Failed! Username/Password is wrong..");
				return "index";	
			}

}
	
	@RequestMapping(value="/login",method=GET)
	public String log(Model model, HttpServletRequest req){
		HttpSession session = req.getSession(false);
		if(session==null){
			model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
			model.addAttribute("error", "Login to continue..");
			return "index";	
		}
		else{
			if(session.getAttribute("log").equals("true")){
				model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
				return "success";
			}
			else{
				model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
				model.addAttribute("error", "Login to continue..");
				return "index";	
			}
		}
	}
	@RequestMapping(value="/logout",method=GET)
	public String logout(HttpServletRequest req, Model model){
		HttpSession session = req.getSession(false);
		if(session!=null){
			session.invalidate();
		}
		model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
		return "index";	
	}
}
