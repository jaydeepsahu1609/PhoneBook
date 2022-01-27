package com.practise.web.model;

public class NewUser {
	private String userid, fname, lname, password, email;

	public NewUser() {
	}

	public NewUser(String userid, String fname, String lname, String password, String email) {

		this.userid = userid;
		this.fname = fname;
		this.lname = lname;
		this.password = password;
		this.email = email;
	}

	@Override
	public String toString() {
		return "NewUser [userid=" + userid + ", fname=" + fname + ", lname=" + lname + ", password=" + password
				+ ", email=" + email + "]";
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
}
