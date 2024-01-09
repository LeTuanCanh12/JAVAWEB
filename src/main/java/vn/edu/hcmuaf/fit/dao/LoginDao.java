package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.Connection.DBContext;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.UserModel;
import vn.edu.hcmuaf.fit.security.PasswordSc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class LoginDao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    public UserModel findByEmailAndPassword(String email, String password) {
        List<UserModel> userModels = new ArrayList<>();
        PasswordSc p = new PasswordSc();

        String query = "select * from user where mail= ?";

        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            rs = ps.executeQuery();
            while (rs.next()) {
                UserModel user = new UserModel();
                user.setUser_id(rs.getInt(1));
                user.setPassword(rs.getString(2));
                user.setFirst_name(rs.getString(3));
                user.setLast_name(rs.getString(4));
                user.setPhone(rs.getString(5));
                user.setMail(rs.getString(6));
                user.setAuthorities(rs.getInt(7));
                user.setCreate_date(rs.getTimestamp(8));
                user.setBalance(rs.getInt(9));
                userModels.add(user);
            }

            UserModel UM =  userModels.get(0);
            System.out.println(UM.getPassword());
            System.out.println(p.checkPassword(password,UM.getPassword()));

            return p.checkPassword(password,UM.getPassword())?UM:null;
        } catch (Exception e) {
            return null;
        }

    }

    public UserModel check(String email) {
        List<UserModel> userM = new ArrayList<>();
        String query = "seclect * from user where email= ?";


        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);

            rs = ps.executeQuery();
            while (rs.next()) {
                UserModel user = new UserModel();
                user.setUser_id(rs.getInt(1));
                user.setPassword(rs.getString(2));
                user.setFirst_name(rs.getString(3));
                user.setLast_name(rs.getString(4));
                user.setPhone(rs.getString(5));
                user.setMail(rs.getString(6));
                user.setAuthorities(rs.getInt(7));
                user.setCreate_date(rs.getTimestamp(8));
                user.setBalance(rs.getInt(9));
                userM.add(user);
            }
            return userM.isEmpty() ? null : userM.get(0);
        } catch (Exception e) {
            return null;

        }
    }
    public  void singup( String email, String pass, String first_name) {
        PasswordSc p = new PasswordSc();
        System.out.println(p.hashPassword(pass));
        String query = "insert into user(mail, PASSWORD,first_name,authorities) values( ?, ?, ?, 1)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, p.hashPassword(pass));
            ps.setString(3,first_name);

            ps.executeUpdate();



        }catch (Exception e) {

        }
    }
}
