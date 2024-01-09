package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.Connection.DBContext;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.Rating;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CartDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public Product addCart(String id) {

		String query = "select pro_id, NAME, price from product where pro_id = ?";
		Product pro = new Product();
		try {
			conn = new DBContext().getConnection();
			ps = conn.prepareStatement(query);
			ps.setString(1, id);
			rs = ps.executeQuery();
			
			while (rs.next()) {

				pro.setPro_id(rs.getInt("pro_id"));
				pro.setName(rs.getString("name"));
				pro.setPrice(rs.getInt("price"));
				pro.setRate(new Rating(rs.getFloat("pro_point")));
				pro.setPer_discount(rs.getDouble("per_discount"));

			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return pro;

	}

	public static void main(String[] args) {
		CartDao dao = new CartDao();
		List<Product> listCartPro = new ArrayList<>();
		listCartPro.add(dao.addCart("20"));
		System.out.println(listCartPro);
	}
}
