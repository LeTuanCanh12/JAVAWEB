package vn.edu.hcmuaf.fit.model;

import java.util.ArrayList;
import java.util.List;

public class Rating {
	String pro_id;
	UserModel user_id;
	float point;
	String note;

	public Rating() {
		super();
		// TODO Auto-generated constructor stub
	}

	public int listRate() {
		List<Rating> list = new ArrayList<>();
		Rating ra = new Rating();
		list.add(ra);

		return list.size();

	}

	public Rating(float point) {
		this.point = point;
		// TODO Auto-generated constructor stub
	}

	public String getPro_id() {
		return pro_id;
	}

	public void setPro_id(String pro_id) {
		this.pro_id = pro_id;
	}

	public UserModel getUser_id() {
		return user_id;
	}

	public void setUser_id(UserModel user_id) {
		this.user_id = user_id;
	}

	public float getPoint() {
		return point;
	}

	public void setPoint(float point) {
		this.point = point;
	}

	public String getNote() {
		return note;
	}

	public void setNote(String note) {
		this.note = note;
	}

}
