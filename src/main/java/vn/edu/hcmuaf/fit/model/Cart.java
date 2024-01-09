package vn.edu.hcmuaf.fit.model;

import java.util.List;

public class Cart {
	int id;
	UserModel user;
	List<CartProduct> list;
	int status;

	public int tong_tien_gio() {
		int rs = 0;
		for (CartProduct cartProduct : list) {
			rs += cartProduct.thanh_tien();
		}
		return rs;

	}

	public int tong_so_luong_sp() {

		if (list == null) {
			return 0;
		}
		return list.size();

	}

	public Cart(int id, UserModel user, List<CartProduct> list, int status) {
		super();
		this.id = id;
		this.user = user;
		this.list = list;
		this.status = status;
	}

	public Cart() {

	}

	public void addCartProduct(CartProduct cartPro) {
		list.add(cartPro);
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public UserModel getUser() {
		return user;
	}

	public void setUser(UserModel user) {
		this.user = user;
	}

	public List<CartProduct> getList() {
		return list;
	}

	public void setList(List<CartProduct> list) {
		this.list = list;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
}
