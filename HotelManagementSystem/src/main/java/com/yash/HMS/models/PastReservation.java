package com.yash.HMS.models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="past_reservations")
public class PastReservation {
	@Id
private int res_id;
private int c_id;
private int room;
private Date start;
private Date end;
private String status;
private double total;

public PastReservation(int res_id, int c_id, int room, Date start, Date end, String status, double total) {
	super();
	this.res_id = res_id;
	this.c_id = c_id;
	this.room = room;
	this.start = start;
	this.end = end;
	this.status = status;
	this.total = total;
}
public PastReservation() {
	super();
	// TODO Auto-genetotald constructor stub
}
public int getRes_id() {
	return res_id;
}
public void setRes_id(int res_id) {
	this.res_id = res_id;
}
public int getC_id() {
	return c_id;
}
public void setC_id(int c_id) {
	this.c_id = c_id;
}
public int getRoom() {
	return room;
}
public void setRoom(int room) {
	this.room = room;
}
public Date getStart() {
	return start;
}
public void setStart(Date start) {
	this.start = start;
}
public Date getEnd() {
	return end;
}
public void setEnd(Date end) {
	this.end = end;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public double gettotal() {
	return total;
}
public void settotal(double total) {
	this.total = total;
}
}
