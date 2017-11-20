package com.yash.HMS.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="customers")
public class Customer {
	@Id
/*	@GeneratedValue(strategy = GenerationType.AUTO)*/
	private int id;
	 @Column(name = "f_name")
	private String fName;
	 @Column(name = "l_name")
	private String lName;
	 @Column(name = "address1")
	private String address1;
	 @Column(name = "address2")
	private String address2;
	 @Column(name = "phone")
	private String phone;
	private String country;
	private Date dob;
	public Customer() {
		super();
	}
	
	public Customer(int id, String fName, String lName, String address1, String phone,String country, Date dob) {
		super();
		this.id = id;
		this.fName = fName;
		this.lName = lName;
		this.address1 = address1;
		this.phone = phone;
		this.country = country;
		this.dob = dob;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public Date getDob() {
		return dob;
	}

	public void setDob(Date dob) {
		this.dob = dob;
	}

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
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
}
