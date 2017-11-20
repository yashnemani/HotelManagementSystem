package com.yash.HMS.models;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="menu")
public class Menu {
	@Id
private int id;
public Menu() {
		super();
	}
public Menu(int id, String name, String type, double price, String description) {
		super();
		this.id = id;
		this.name = name;
		this.type = type;
		this.price = price;
		this.description = description;
	}
public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public double getPrice() {
		return price;
	}
	public void setPrice(double price) {
		this.price = price;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
private String name;
private String type;
private double price;
private String description;
}
