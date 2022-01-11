package com.practise.web.model;

public class Contact {
	private String number, fname, lname, userid=null;

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getLname() {
		return lname;
	}

	public void setLname(String lname) {
		this.lname = lname;
	}

	@Override
	public String toString() {
		return "Contact [number=" + number + ", fname=" + fname + ", lname=" + lname + ", userid=" + userid + "]";
	}
	
}
