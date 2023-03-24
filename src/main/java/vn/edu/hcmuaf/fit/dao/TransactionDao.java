package vn.edu.hcmuaf.fit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import vn.edu.hcmuaf.fit.Connection.DBContext;
import vn.edu.hcmuaf.fit.model.Cart;
import vn.edu.hcmuaf.fit.model.CartProduct;
import vn.edu.hcmuaf.fit.model.Transaction;

public class TransactionDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public void createNewTransaction(Cart cart, String name, String address, String phone, String email, String note,
									 double total) {
		try {
			String items = "";
			for (CartProduct pro : cart.getList()) {
				items += pro.getPro().getName() + " (x" + pro.getQuantity() + ")\n";
			}

			conn = new DBContext().getConnection();
			String query = "insert into transaction(name, email, phone, address, note, total,items) values (?,?,?,?,?,?,?)";

			ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, phone);
			ps.setString(4, address);
			ps.setString(5, note);
			ps.setDouble(6, total);
			ps.setString(7, items);
			ps.executeUpdate();
		} catch (Exception e) {
		}

	}

	public List<Transaction> getAllTransaction(){
		List<Transaction> list = new ArrayList<>();
		try {
			conn = new DBContext().getConnection();
			String query = "select trans_id, name, phone, email, address, note, total, items from transaction";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while(rs.next()) {
				Transaction trans = new Transaction();
				trans.setId(rs.getInt("trans_id"));
				trans.setName(rs.getString("name"));
				trans.setPhone(rs.getString("phone"));
				trans.setEmail(rs.getString("email"));
				trans.setAddress(rs.getString("address"));
				trans.setNote(rs.getString("note"));
				trans.setTotal(rs.getDouble("total"));
				trans.setItems(rs.getString("items"));
				list.add(trans);
			}
		}catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}

	public static void main(String[] args) {
		List<Transaction> list= new TransactionDao().getAllTransaction();
		if (list==null) System.out.println("sai");
		for(Transaction s : list) {
			System.out.println(s);
		}
	}


}
