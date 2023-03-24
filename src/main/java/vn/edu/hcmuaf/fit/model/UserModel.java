package vn.edu.hcmuaf.fit.model;

import java.sql.Timestamp;

public class UserModel {
	private int user_id;
	private String password;
	private String first_name;
	private String last_name;
	private String phone;
	private String mail;
	private int authorities;
	private Timestamp create_date;
	private int balance;
	public int getUser_id() {
		return user_id;
	}

	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getLast_name() {
		return last_name;
	}
	public void setLast_name(String last_name) {
		this.last_name = last_name;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMail() {
		return mail;
	}
	public void setMail(String mail) {
		this.mail = mail;
	}
	public int getAuthorities() {
		return authorities;
	}
	public void setAuthorities(int authorities) {
		this.authorities = authorities;
	}
	public Timestamp getCreate_date() {
		return create_date;
	}
	public void setCreate_date(Timestamp create_date) {
		this.create_date = create_date;
	}
	public int getBalance() {
		return balance;
	}
	public void setBalance(int balance) {
		this.balance = balance;
	}
	@Override
	public String toString() {
		return "UserModel [user_id=" + user_id + ", password=" + password + ", first_name=" + first_name
				+ ", last_name=" + last_name + ", phone=" + phone + ", mail=" + mail + ", authorities=" + authorities
				+ ", create_date=" + create_date + ", balance=" + balance + "]";
	}
	
}
