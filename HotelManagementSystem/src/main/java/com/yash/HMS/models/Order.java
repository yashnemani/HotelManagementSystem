package com.yash.HMS.models;

import java.util.Date;

import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name="orders")
public class Order {
@Id
private int id;
private int res_id;
private double total;
@Basic(optional = false)
@Column(insertable = false, updatable = false)
@Temporal(TemporalType.TIMESTAMP)
private Date date_time;
public Order() {
	super();
	// TODO Auto-generated constructor stub
}
public Order(int id, int res_id, double total, Date datetime) {
	super();
	this.id = id;
	this.res_id = res_id;
	this.total = total;
	this.date_time = datetime;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public int getRes_id() {
	return res_id;
}
public void setRes_id(int res_id) {
	this.res_id = res_id;
}
public double getTotal() {
	return total;
}
public void setTotal(double total) {
	this.total = total;
}
public Date getDatetime() {
	return date_time;
}
public void setDatetime(Date datetime) {
	this.date_time = datetime;
}
}
