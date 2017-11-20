package com.yash.HMS.controllers;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.request.WebRequest;

import com.yash.HMS.models.PastReservation;
import com.yash.HMS.models.Reservation;
import com.yash.HMS.repositories.OrderRepository;
import com.yash.HMS.repositories.PastReservationRepository;
import com.yash.HMS.repositories.ReservationRepository;
import com.yash.HMS.repositories.RoomRepository;

@Controller
@RequestMapping("/reservations")
public class ReservationController {
@Autowired
ReservationRepository rep;
@Autowired
private OrderRepository orep;
@Autowired
PastReservationRepository prep;
@Autowired
RoomRepository rrep;
@RequestMapping(method=GET)
public String getReservations(Model model, HttpServletRequest req){
	HttpSession session =  req.getSession(false); 
	if(session==null){
		model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
		model.addAttribute("error", "Login to continue!");
		return "index";	
	}
	else{
	List<Reservation> reservations =  new ArrayList<>();
	rep.findAll().forEach((r)->reservations.add(r));
	model.addAttribute("reservations", reservations);
	return "reservations";
	}	
}
@RequestMapping(value="/checkout/{id}/",method=GET)
public String checkout(Model model, @PathVariable int id, HttpServletRequest req){
	HttpSession session =  req.getSession(false); 
	if(session==null){
		model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
		model.addAttribute("error", "Login to continue!");
		return "index";	
	}
	else{
	Reservation res = new Reservation();
	res = rep.findOne(id);
	Date d1 = new Date(); d1 = res.getStart(); Date d2 = new Date(); d2 = res.getEnd();
	float days = (d2.getTime()-d1.getTime())/86400000;
	System.out.println("days: "+days);
	double tot = days*res.getRate();
	double mealAmount = orep.getOrdersTotal(res.getRes_id());
	System.out.println("Total Room Charge: "+tot);
	System.out.println("Total Meals Amount: "+mealAmount);
	rep.delete(id);
	PastReservation pas = new PastReservation();
	pas.setRes_id(id);pas.setC_id(res.getC_id());pas.setRoom(res.getRoom());
	pas.setStart(res.getStart());pas.setEnd(res.getEnd());pas.settotal(tot);pas.setStatus("Checked Out");
	prep.save(pas);
	rrep.setStatus(res.getRoom(), "Vacant");
	List<Reservation> reservations =  new ArrayList<>();
	rep.findAll().forEach((r)->reservations.add(r));
	model.addAttribute("reservations", reservations);
	return "reservations";}
}
@RequestMapping(value="/checkin/{id}/",method=GET)
public String checkin(Model model, @PathVariable int id, HttpServletRequest req){
	HttpSession session =  req.getSession(false); 
	if(session==null){
		model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
		model.addAttribute("error", "Login to continue!");
		return "index";	
	}
	else{
		Reservation res = new Reservation();
		res = rep.findOne(id);
		res.setStatus("Active");
		rep.save(res);
		rrep.setStatus(res.getRoom(), "Occupied");
		model.addAttribute("res", res);
		return "reservation";	
	}	
}
@RequestMapping(value="/reservation/{id}",method=GET)
public String getReservation(Model model,@PathVariable int id, HttpServletRequest req){
	HttpSession session =  req.getSession(false); 
	if(session==null){
		model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
		model.addAttribute("error", "Login to continue!");
		return "index";	
	}
	else{
Reservation res = new Reservation();
res = rep.findOne(id);
model.addAttribute("res", res);
	return "reservation";}
}
@RequestMapping(value="/confirmReservation",method=POST)
public String newReservation( HttpServletRequest req, Model model){
	HttpSession session =  req.getSession(false); 
	if(session==null){
		model.addAttribute("hello","Hello Welcome to Adobe Hotels Management System!");
		model.addAttribute("error", "Login to continue!");
		return "index";	
	}
	else{
Reservation res = new Reservation();
DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
res.setC_id(Integer.parseInt(req.getParameter("c_id")));
res.setRate(Double.parseDouble(req.getParameter("rate")));
try {
	res.setStart(df.parse(req.getParameter("start")));
	res.setEnd(df.parse(req.getParameter("end")));
} catch (ParseException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}
res.setStatus(req.getParameter("status"));
res.setRoom(Integer.parseInt(req.getParameter("room")));
rep.save(res);
List<Reservation> reservations =  new ArrayList<>();
rep.findAll().forEach((r)->reservations.add(r));
model.addAttribute("reservations", reservations);
return "reservations";}

}
}
