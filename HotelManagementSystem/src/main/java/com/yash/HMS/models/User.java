package com.yash.HMS.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="users")
public class User {
	@Id
private int id;
	 @Column(name = "f_name")
private String fName;
	 @Column(name = "l_name")
private String lName;
public User() {
		super();
	}
public User(int id, String fName, String lName, String user, String pass, String role) {
	super();
	this.id = id;
	this.fName = fName;
	this.lName = lName;
	this.user = user;
	this.pass = pass;
	this.role = role;
}
private String user;
private String pass;
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getfName() {
	return fName;
}
public void setfName(String fName) {
	this.fName = fName;
}
public String getlName() {
	return lName;
}
public void setlName(String lName) {
	this.lName = lName;
}
public String getUser() {
	return user;
}
public void setUser(String user) {
	this.user = user;
}
public String getPass() {
	return pass;
}
public void setPass(String pass) {
	this.pass = pass;
}
public String getRole() {
	return role;
}
public void setRole(String role) {
	this.role = role;
}
private String role;
}
