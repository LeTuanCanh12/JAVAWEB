package vn.edu.hcmuaf.fit.model;

import java.sql.Date;

public class News {
	String titel;
	String infor;
	String link;
	Date date_post;
	
	public String getTitel() {
		return titel;
	}
	public void setTitel(String titel) {
		this.titel = titel;
	}
	public String getInfor() {
		return infor;
	}
	public void setInfor(String infor) {
		this.infor = infor;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public Date getDate_post() {
		return date_post;
	}
	public void setDate_post(Date date_post) {
		this.date_post = date_post;
	}
	
}
