package com.practise.web.model;

public class Contact {
	private int contactid;
	private String userid = null, fname, lname, number, email, about;

	public String getUserid() {
		return userid;
	}

	public Contact() {
	}

	public Contact(int contactid, String userid, String fname, String lname, String number, String email,
			String about) {
		this.contactid = contactid;
		this.userid = userid;
		this.fname = fname;
		this.lname = lname;
		this.number = number;
		this.email = email;
		this.about = about;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getContactid() {
		return contactid;
	}

	public void setContactid(int contactid) {
		this.contactid = contactid;
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

	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAbout() {
		return about;
	}

	public void setAbout(String about) {
		this.about = about;
	}

	@Override
	public String toString() {
		return "Contact [contactid=" + contactid + ", userid=" + userid + ", fname=" + fname + ", lname=" + lname
				+ ", number=" + number + ", email=" + email + ", about=" + about + "]";
	}

}
