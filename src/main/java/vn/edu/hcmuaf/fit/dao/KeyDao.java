package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.Connection.DBContext;
import vn.edu.hcmuaf.fit.model.Key;
import vn.edu.hcmuaf.fit.security.DigitalSignature;

import java.security.KeyPair;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class KeyDao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    public void  addKey(int id_user) throws NoSuchAlgorithmException, NoSuchProviderException {
        DigitalSignature DG = new DigitalSignature();
        KeyPair keyPair = DG.generateKeyPair();

        String query = "INSERT INTO `key` (User_id, publickey, privatekey,`status`) VALUES ( ?, ?, ?, 1)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id_user);
            ps.setString(2, DG.keyToString(keyPair.getPublic()));
            ps.setString(3,DG.keyToString(keyPair.getPrivate()));

            ps.executeUpdate();

        }catch (Exception e) {

        }
    }
    public void updateKey(int id_user) throws Exception {
        String query = "UPDATE `key` SET status = 0 WHERE User_id ="+id_user;
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        ps.executeUpdate();
    }
    public void  addKey(int id_user,String publickey,String privatekey,String signature) {
        String query = "INSERT INTO `key` (User_id, publickey, privatekey, signature,`status`) VALUES ( ?, ?, ?, ?, 1)";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id_user);
            ps.setString(2, publickey);
            ps.setString(3,privatekey);
            ps.setString(4,signature);

            ps.executeUpdate();

        }catch (Exception e) {

        }
    }
    public Key findKeyByUser(int id_user) {
        List<Key> keyM = new ArrayList<>();
        String query = "SELECT id, User_id, publickey, privatekey, signature, `status`\n" +
                "FROM `key`\n" +
                "WHERE User_id = ? AND `status` = 1;";
        try {
            conn = new DBContext().getConnection();
            ps = conn.prepareStatement(query);
            ps.setInt(1, id_user);
            rs = ps.executeQuery();
            while (rs.next()) {
                Key keys = new Key();
                keys.setId(rs.getInt(1));
                keys.setUser_id(rs.getInt(2));
                keys.setPrivatekey(rs.getString(3));
                keys.setPublickey(rs.getString(4));
                keys.setSignature(rs.getString(5));
                keys.setStatus(rs.getInt(6));

                keyM.add(keys);
            }
            return keyM.isEmpty() ? null : keyM.get(0);
        }catch (Exception e) {

        }
        return null;
    }
    public static void main(String[] args) throws Exception {
        KeyDao dao = new KeyDao();
        DigitalSignature DG = new DigitalSignature();
        KeyPair keyPair = DG.generateKeyPair();

//        dao.addKey(2,DG.getPrivateKey(),DG.getPrivateKey(),"ád");
        dao.updateKey(18);
        dao.addKey(18);

        System.out.println(dao.findKeyByUser(Integer.parseInt("2")));

    }
}
