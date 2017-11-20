package com.yash.HMS.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "rooms")
public class Room {
	@Id
	@Column(name="room_no")
private int num;
private String status;
@Column(name="rate")
private static double price = 200;
public int getNum() {
	return num;
}
public void setNum(int num) {
	this.num = num;
}
public Room() {
	super();
	// TODO Auto-generated constructor stub
}
public Room(int num, String status) {
	super();
	this.num = num;
	this.status = status;
}
public String getStatus() {
	return status;
}
public void setStatus(String status) {
	this.status = status;
}
public double getPrice() {
	return price;
}
}
