package com.yash.HMS.controllers;

import static org.springframework.web.bind.annotation.RequestMethod.GET;
import static org.springframework.web.bind.annotation.RequestMethod.POST;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.yash.HMS.models.Reservation;
import com.yash.HMS.repositories.ReservationRepository;


@RestController
@RequestMapping("/reservation")
public class RestReservationController {
@Autowired
ReservationRepository rep;
@RequestMapping(method=GET)
public void getAll(){
	rep.findAll().forEach((r)->System.out.println(r.getRes_id()+" Room Num is "+r.getRoom()));
}
@RequestMapping(method=POST)
public void add(@RequestBody Reservation reservation){
rep.save(reservation);
}
}
