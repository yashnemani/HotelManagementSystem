package com.yash.HMS.controllers;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.yash.HMS.models.Room;
import com.yash.HMS.repositories.RoomRepository;

@RestController
@RequestMapping("/room")
public class RestRoomController {
@Autowired
private RoomRepository rep;
@RequestMapping(value="/addroom", method=POST)
public void addCustomer(@RequestBody Room room){
	rep.save(room);
}
@RequestMapping(value="/getrooms")
public void getRooms(){
 rep.findAll().forEach((r)->System.out.println(r.getNum()));
}

@RequestMapping(value="/available/{q1}/{q2}/", method=GET)
public @ResponseBody List<Room> getAvailable(@PathVariable(value = "q1") String q1,@PathVariable(value = "q2") String q2){
	 DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
	java.util.Date date1 = new java.util.Date();
	java.util.Date date2 = new java.util.Date();
	try {
		date1 = df.parse(q1);
		date2 = df.parse(q2);
	} catch (ParseException e) {
		e.printStackTrace();
	}
	List<Room> rooms =  new ArrayList<>();
	rep.getAvailableRooms(date1,date2).forEach((r)->rooms.add(r));
	/*List<Room> rooms = new ArrayList<>();
	rep.getAvailableRooms(date).forEach((r)->rooms.add(r));*/
	return rooms;
}
}
