package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.Connection.DBContext;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.Rating;
import vn.edu.hcmuaf.fit.model.UserModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class UserDao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public List<UserModel> getAllUser() {
        List<UserModel> list = new ArrayList<>();
        String query = 	"select  * from user";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserModel pro = new UserModel();
                pro.setUser_id(rs.getInt("user_id"));
                pro.setPassword(rs.getString(2));
                pro.setFirst_name(rs.getString(3));
                pro.setLast_name(rs.getString(4));
                pro.setPhone(rs.getString(5));
                pro.setMail(rs.getString(6));
                pro.setAuthorities(rs.getInt(7));
                pro.setCreate_date(rs.getTimestamp(8));
                pro.setBalance(rs.getInt(9));
                list.add(pro);
            }
        } catch (Exception e) {
            // TODO: handle exception
        }
        return list;

    }

}
