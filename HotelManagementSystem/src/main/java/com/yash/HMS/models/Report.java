package com.yash.HMS.models;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="daily_report")
public class Report {
@Id
private int id;
private Date date;
private int rent_total;
private int order_total;
private int total;
public Report() {
	super();
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public Date getDate() {
	return date;
}
public void setDate(Date date) {
	this.date = date;
}
public int getRent_total() {
	return rent_total;
}
public void setRent_total(int rent_total) {
	this.rent_total = rent_total;
}
public int getOrder_total() {
	return order_total;
}
public void setOrder_total(int order_total) {
	this.order_total = order_total;
}
public int getTotal() {
	return total;
}
public void setTotal(int total) {
	this.total = total;
}
}
