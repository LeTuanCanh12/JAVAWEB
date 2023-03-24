package vn.edu.hcmuaf.fit.model;

public class CartProduct {
	String cart_id;
	Product pro;
	int quantity;

	public CartProduct() {
		
	}
	public int thanh_tien() {
		return pro.getPrice()*quantity;
		
	}
	
	public CartProduct(Product pro, int quantity) {
		this.pro = pro;
		this.quantity = quantity;
	}

	public String getCart_id() {
		return cart_id;
	}

	public void setCart_id(String cart_id) {
		this.cart_id = cart_id;
	}

	public Product getPro() {
		return pro;
	}

	public void setPro(Product pro) {
		this.pro = pro;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
