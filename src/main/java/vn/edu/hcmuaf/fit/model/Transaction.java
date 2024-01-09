package vn.edu.hcmuaf.fit.model;

public class Transaction {
	int id;
	String name;
	String phone;
	String email;
	String address;
	String note;
	double total;
	String items;
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
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getNote() {
		return note;
	}
	public void setNote(String note) {
		this.note = note;
	}
	public double getTotal() {
		return total;
	}
	public void setTotal(double total) {
		this.total = total;
	}
	public String getItems() {
		return items;
	}
	public void setItems(String items) {
		this.items = items;
	}
	@Override
	public String toString() {
		return "Transaction [id=" + id + ", name=" + name + ", phone=" + phone + ", email=" + email + ", address="
				+ address + ", note=" + note + ", total=" + total + ", items=" + items + "]";
	}
	
}
