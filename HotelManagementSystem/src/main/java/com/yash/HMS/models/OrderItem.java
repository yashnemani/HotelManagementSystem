package com.yash.HMS.models;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="order_items")
public class OrderItem {
	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
private int o_id;
private int i_id;
private int qty;
private double amount;
public int getO_id() {
	return o_id;
}
public void setO_id(int o_id) {
	this.o_id = o_id;
}
public int getI_id() {
	return i_id;
}
public void setI_id(int i_id) {
	this.i_id = i_id;
}
public int getQty() {
	return qty;
}
public void setQty(int qty) {
	this.qty = qty;
}
public double getAmount() {
	return amount;
}
public void setPrice(double price) {
	this.amount = price;
}
public OrderItem() {
	super();
	// TODO Auto-generated constructor stub
}
public OrderItem(int o_id, int i_id, int qty, double price) {
	super();
	this.o_id = o_id;
	this.i_id = i_id;
	this.qty = qty;
	this.amount = price;
}

}
