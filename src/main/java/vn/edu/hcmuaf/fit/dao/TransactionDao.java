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
import vn.edu.hcmuaf.fit.model.UserModel;

public class TransactionDao {
	Connection conn = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	public void createNewTransaction(int userId, Cart cart, String name, String address, String phone, String email, String note,
									 double total) {
		try {
			String items = "";
			for (CartProduct pro : cart.getList()) {
				items += pro.getPro().getName() + " (x" + pro.getQuantity() + ")\n";
			}

			conn = new DBContext().getConnection();
			String strToHash = name + email + phone + address + note + total + items;
			//hash gio hang ghi xuong db
			SignatureDao sha256Hash = new SignatureDao();
			String hashCode = sha256Hash.sha256Hash(strToHash);

			String query = "insert into transaction(`name`, email, phone, address, note, total, items, hash) values (?,?,?,?,?,?,?,?)";
			System.out.println(query);
			ps = conn.prepareStatement(query);
			ps.setString(1, name);
			ps.setString(2, email);
			ps.setString(3, phone);
			ps.setString(4, address);
			ps.setString(5, note);
			ps.setDouble(6, total);
			ps.setString(7, items);
			ps.setString(8, hashCode);
			ps.executeUpdate();

		} catch (Exception e) {
		}

	}

	public String getPublicKey(int userId) {
		try {
			conn = new DBContext().getConnection();
			String query = "Select publickey from `key` where user_id = ? and status = 1";
			ps = conn.prepareStatement(query);
			ps.setInt(1, userId);
			rs = ps.executeQuery();
			rs.next();

			return rs.getString("publickey");
		} catch (Exception e) {
			return "bug";
		}
	}

	public static void main(String[] args) {
		TransactionDao dao = new TransactionDao();

		System.out.println(dao.getPublicKey(25));
	}
	public List<Transaction> getAllTransaction() {
		List<Transaction> list = new ArrayList<>();
		try {
			conn = new DBContext().getConnection();
			String query = "select trans_id, `name`, phone, email, address, note, total, items from transaction";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
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
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	public List<Transaction> getAllTransactionById(String email) {
		List<Transaction> list = new ArrayList<>();
		try {
			conn = new DBContext().getConnection();
			String query = "select trans_id, `name`, phone, email, address, note, total, items,`hash` from `transaction` where email='"+email+"'";
			ps = conn.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				Transaction trans = new Transaction();
				trans.setId(rs.getInt("trans_id"));
				trans.setName(rs.getString("name"));
				trans.setPhone(rs.getString("phone"));
				trans.setEmail(rs.getString("email"));
				trans.setAddress(rs.getString("address"));
				trans.setNote(rs.getString("note"));
				trans.setTotal(rs.getDouble("total"));
				trans.setItems(rs.getString("items"));
				trans.setHash(rs.getString("hash"));
				list.add(trans);
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return list;
	}
	public void cancelTransById(int tran_id) throws Exception {
		conn = new DBContext().getConnection();
		String query = "DELETE FROM `transaction` where trans_id="+tran_id;
		ps = conn.prepareStatement(query);
		ps.executeUpdate();
	}



	public boolean verifyUserCode(int userId, String verifyCode) {
		try {
			conn = new DBContext().getConnection();
			String query = "Select signature from `key` where user_id = ? and status = 1";
			ps = conn.prepareStatement(query);
			ps.setInt(1, userId);
			rs = ps.executeQuery();
			rs.next();
			String userSign = rs.getString("signature");
			if (userSign.equals(verifyCode)) {
				return true;
			}
			return false;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}


}
