package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.Connection.DBContext;
import vn.edu.hcmuaf.fit.model.UserModel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class ContactDao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public  void contact( String user, String phone, String mail,String note) {

        String query = "insert into contact(NAME, phoneNumber,email,content) "+"values( ?, ?, ?, ?)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, user);
            ps.setString(2, phone);
            ps.setString(3,mail);
            ps.setString(4,note);

            ps.executeUpdate();


        }catch (Exception e) {

        }



    }
}
