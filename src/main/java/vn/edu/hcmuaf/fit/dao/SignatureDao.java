package vn.edu.hcmuaf.fit.dao;

import vn.edu.hcmuaf.fit.Connection.DBContext;
import vn.edu.hcmuaf.fit.model.Key;
import vn.edu.hcmuaf.fit.security.DigitalSignature;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import java.nio.charset.StandardCharsets;
import java.security.*;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

public class SignatureDao {
    Connection conn = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    //Ham ma hoa RSA
    public  String encryptRSA(String privateKeyStr, String plaintext) throws Exception {
        // Chuyển đổi chuỗi private key thành đối tượng PrivateKey
        byte[] privateKeyBytes = java.util.Base64.getDecoder().decode(privateKeyStr);
        PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(privateKeyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PrivateKey privateKey = keyFactory.generatePrivate(keySpec);

        // Mã hóa plaintext bằng RSA
        Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
        cipher.init(Cipher.ENCRYPT_MODE, privateKey);
        byte[] encryptedBytes = cipher.doFinal(plaintext.getBytes());

        // Chuyển đổi mảng byte đã mã hóa thành chuỗi base64
        String encryptedText = java.util.Base64.getEncoder().encodeToString(encryptedBytes);

        return encryptedText;
    }
    //Ham gia ma RSA
    public  String decryptRSA(String publicKeyStr, String encryptedText) throws Exception {
        // Chuyển đổi chuỗi public key thành đối tượng PublicKey
        byte[] publicKeyBytes = java.util.Base64.getDecoder().decode(publicKeyStr);
        X509EncodedKeySpec keySpec = new X509EncodedKeySpec(publicKeyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        PublicKey publicKey = keyFactory.generatePublic(keySpec);

        // Giải mã chuỗi đã mã hóa bằng RSA
        Cipher cipher = Cipher.getInstance("RSA/ECB/PKCS1Padding");
        cipher.init(Cipher.DECRYPT_MODE, publicKey);
        byte[] encryptedBytes = java.util.Base64.getDecoder().decode(encryptedText);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);

        // Chuyển đổi mảng byte đã giải mã thành chuỗi plaintext
        String plaintext = new String(decryptedBytes);

        return plaintext;
    }
    //ham hash
    public  String sha256Hash(String input) throws NoSuchAlgorithmException {
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] encodedHash = digest.digest(input.getBytes(StandardCharsets.UTF_8));

        // Chuyển đổi mảng byte thành chuỗi hex
        StringBuilder hexString = new StringBuilder();
        for (byte b : encodedHash) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }

        return hexString.toString();
    }
    //ghi db
    public void updateSignature(String privatekey,String signature) throws Exception {
        String query = "UPDATE `key` SET signature ='"+signature+"' WHERE privatekey ='"+privatekey+"'AND status =1";
        System.out.println(query);
        conn = new DBContext().getConnection();
        ps = conn.prepareStatement(query);
        ps.executeUpdate();
    }
    public static void main(String[] args) throws Exception {
    SignatureDao dao  = new SignatureDao();
//    String encode = encryptRSA("MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDAeTOSZV4HuC2BObmUGTGyCmwffucUr1w9BgR2k7NnhM3G9ZnJdYK//FB70vx9Ofe3DzUjiw7wafQ1DU0q78Vf5O1mucuqAqW6UAT328+B23I0KNouJ5xto0WkNG0LAsrNkqOIVnVIAYvC8glXWtrqmttmDQJQWlNLEHtIcR5aaCSOUSeXmzPox43/91V4YnbI5X7LF2XGaK0+rknxZrFr95SH8ysOx8YlirN3644RW9V/lkr1LuS8AjMOtwCpTpWp0Er8rxQCaekLz4kVi10ymaciWtbBf0bXS0u4Z4//GEnba+3Bc6NltWyiklVHPV5O+mIpGktuZT7z2z2u2NfFAgMBAAECggEACqm8SnA8txtERBw9VH/X0bgDmPQYG7yCVOwkK6iPoBzKpKrfF/rfYUD6eX2tGMfxGg5o4Hz3+Sg5jAXeYFJTwjYF0/LXnmXSpiGAQPYHxzcv2sVnnvZ5U1agCVKRNvKy5xQoZKl7il9xjX2IuHLzXVtya7MtTWPPqQEy/0arCpGRTrSKf3/nedlNrQ9pqwdoBCPRC+5/cFGKGj2LgG84nasXtA46hKMyExtPrGgLU5L966HlaGtV10eUsDgPYrF9/N3vLOZSAS4FsYjLtkFWWFyGPwhqaAMNcrZceaqs4nfSMrsw3n+Rhk0IxWt7Ckk8EXhtqTDEL9IhOxef/yNaOQKBgQDr++0xd4c63Shgs/y0fKZ1ghIu0DpSxCl/47eLbvLTurQ5KRIukjaSbVEWhHb5Z0lBisfNwcGjinpyzp0S+Ksi/oUHyQC1MevKjokt+SmavryJ0GLSXRp7kDvqZaDQo/bdhTEgG7n2cicqtYkow8/ForZ584MRaWdwZdxzExBjeQKBgQDQzIAdiXFYjKahqeP6ukL9sfCvD62dAe5YJu9//MCKcmhLg2hAlwc4CNwmx8uJdnSM5YlnufDFRB1ohCj5iQVoPmYJBrJg5Pk8ii2/oqCTbUNBst8vSMZYin9jS636Rg0xbEoGsXyvDuiymjAUd/x+Ki06rb4xAX8dzv850VPXrQKBgCZy96SVqwzmN8v5x3TI0n5W4QuLldUibPiPa7pmK15gDzk4/eNko0ucUBfxIUllkMQDDqbxqNEyoNzP2TvcFFYxTg+Eqn7bUWXBb4x0CllSNnnl4BQSY1w6leiNAnS8Il7ZcrWejuAenU8SIPTpYpL6/exExtgxak8f6Zk+Q+9RAoGBAKTa0cyAWB2x71505KtxpLLpaz7NAiaU/7paA37p8Jte+Tml5woYNHrpg+ialvlRrXQRRwu+o3sc7Js4vaFHrh1AJw+5Wd1m6+IAt1426NF90zxsHgsXSoNd1nZvqk2QQZpkBY6DVA5jlxZs5slCcviqFEvgIepPZC4E4T6lJ62BAoGAYRBJVAqE46NOxifiHiMBG19yMR69Ldrj5piTEEVaaYPDZ2pdmqsGFHD++nv8+7REAiDlwCdvhoq6+oe8HdUaAUujQlYbplHmaDbSGOTpFZonjmnMniZKdQv49O0qxRIg9u5rwKZ9k/SJ4HzSyF97MnS1ILstVSQLEeiRoC6m0g0=","hello");
//    String decode = decryptRSA("MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwHkzkmVeB7gtgTm5lBkxsgpsH37nFK9cPQYEdpOzZ4TNxvWZyXWCv/xQe9L8fTn3tw81I4sO8Gn0NQ1NKu/FX+TtZrnLqgKlulAE99vPgdtyNCjaLiecbaNFpDRtCwLKzZKjiFZ1SAGLwvIJV1ra6prbZg0CUFpTSxB7SHEeWmgkjlEnl5sz6MeN//dVeGJ2yOV+yxdlxmitPq5J8Waxa/eUh/MrDsfGJYqzd+uOEVvVf5ZK9S7kvAIzDrcAqU6VqdBK/K8UAmnpC8+JFYtdMpmnIlrWwX9G10tLuGeP/xhJ22vtwXOjZbVsopJVRz1eTvpiKRpLbmU+89s9rtjXxQIDAQAB",encode);
//    System.out.println(encode);
//    System.out.println(decode);
String sig = dao.encryptRSA("MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDd3wKFLhI3T1EBJA0yS7YmVR9Ts0H9183mFQsZ8ZqhL+XbXoYm457miOwaiMwPifdf4uRo9cs43Qa2tPGlpqrqgs/nXwnSbnBcOJmqeiaEhf0Ng/VtohpzIB4YvZOnnsAEelN2UXvnZIULrqah0HRYlOozxCy8YEk1thh9u9Xen68rdlYAlA9LPhmaPFQxZGy+IgTSTFhhgzJrSz0Z0SeUgxvLrEfWUB697zmFrpMTCmWdxB9o55Co6VqoYalYw+asHftx3XPxdLIpbVSDGWBWU/HYY3MtqN+xfITH2GuFFPWdgRKytIGHNuE/Nl72wAmGtRpehjORZ9PqgIgTHu7XAgMBAAECggEAYBOvuDNEoR3gMpHFgyelB4Fp8OlZpM48M6ueJIxqjO08aJvMlO+Rgjv9ndnqH7p7XFLY3Ri++W9A9oJxd+2t6qJd3E/b5Xt8fXrnFBsULeQFukIP1/tP39WjIsyJMZc9iFLebIiJkqCFOpNVRhIKJ8fIiUUkqCg7253wihX6XY3Sw+66h5v7Cc7w6NY2p+Ci59fPT/1Rys4AbwgPcLxwPErlfuQUTD7wTA3Jx5YQvL45M8kWuLU7gocAe5l8PGPpvcjVMtWgkJBVIxRHdPbJgRGVy2qpe5DhoLcr2Ng66MnbZui/EkAXlp3jJWkSaFEuMbfqZ2Fma3mXat5zDjXNGQKBgQD+vtN19Ob3W59+1ESEQgTEoIiYubDiwGe2yt6trxhNSOxt0xWg0s6cxmnFKTFXT8Uv/TZBBZjTBfvIPaOkjKdOkucRENnK9tlh4uNONnqaV7XnBGseb7cMJOiv/s9hRIx+oSeqoV8sSRXQdAU4B741+GZpk7gLuLhIxKIjzcFP7wKBgQDe9ryybOeQTLr2n357FP3NoMG/VwmhR2PvJzNqPYaFxlN91/Svlt+MCK/NoC+G8TCm69eKM1YivKeXDqD0s4CN/4cXO3xVgU/q6XKGj5reJy6ieSWFRnWEK+j53UNn0EPMXP/Dt4zEGEwIaAkf9QqG0rbOIi9gfg0aBDf1NmNnmQKBgBim0sPJbUhmn2qgk/jQgrGcb1uILKvkvqSbwSzBkvJ3qhl+ocssWz4knTutHs86MvTP5h4osn9JRvI7tMhJrC8YXC/0l37ioGqukByTfQ3OixXOAaeyW95a/AF8AQmCnq3qXnJOp20brXa8o3ymkyuZ3B8/YkIQIBU6og4g7SIVAoGAFuOtq4OSojW+W+Mz0N7uz1VZjpMY4f26PKsBlD6MuN8LYzfwXrZWbMHXinyPZIMOQ5SipAVxKk/DxLYzv+tNn0ZEUBZDRWPpGGyu3TGQ7I2JNBTLzUrWdaMsX7pfWSEAVNKXTzhgsyDrbVGA3k8BraWkLrVDt9w47BrSw9G5ksECgYEA2gyygFbQ9UyYofmEr6Wg61zWf7TLdipgB2BB89vSeLbQRGaKuc+vxz7GhTnobhqzfBszNItJolDZYgCBOixaZotX262Ek6K4ekXmT3HYKil7OG5F3xeezH+b50YeOdyPiemeXNgbs5xxM65RmDBxPFYoTYD4hmxvAjCQLUjM3EQ=", dao.sha256Hash("LTC"));
       dao.updateSignature("MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQDd3wKFLhI3T1EBJA0yS7YmVR9Ts0H9183mFQsZ8ZqhL+XbXoYm457miOwaiMwPifdf4uRo9cs43Qa2tPGlpqrqgs/nXwnSbnBcOJmqeiaEhf0Ng/VtohpzIB4YvZOnnsAEelN2UXvnZIULrqah0HRYlOozxCy8YEk1thh9u9Xen68rdlYAlA9LPhmaPFQxZGy+IgTSTFhhgzJrSz0Z0SeUgxvLrEfWUB697zmFrpMTCmWdxB9o55Co6VqoYalYw+asHftx3XPxdLIpbVSDGWBWU/HYY3MtqN+xfITH2GuFFPWdgRKytIGHNuE/Nl72wAmGtRpehjORZ9PqgIgTHu7XAgMBAAECggEAYBOvuDNEoR3gMpHFgyelB4Fp8OlZpM48M6ueJIxqjO08aJvMlO+Rgjv9ndnqH7p7XFLY3Ri++W9A9oJxd+2t6qJd3E/b5Xt8fXrnFBsULeQFukIP1/tP39WjIsyJMZc9iFLebIiJkqCFOpNVRhIKJ8fIiUUkqCg7253wihX6XY3Sw+66h5v7Cc7w6NY2p+Ci59fPT/1Rys4AbwgPcLxwPErlfuQUTD7wTA3Jx5YQvL45M8kWuLU7gocAe5l8PGPpvcjVMtWgkJBVIxRHdPbJgRGVy2qpe5DhoLcr2Ng66MnbZui/EkAXlp3jJWkSaFEuMbfqZ2Fma3mXat5zDjXNGQKBgQD+vtN19Ob3W59+1ESEQgTEoIiYubDiwGe2yt6trxhNSOxt0xWg0s6cxmnFKTFXT8Uv/TZBBZjTBfvIPaOkjKdOkucRENnK9tlh4uNONnqaV7XnBGseb7cMJOiv/s9hRIx+oSeqoV8sSRXQdAU4B741+GZpk7gLuLhIxKIjzcFP7wKBgQDe9ryybOeQTLr2n357FP3NoMG/VwmhR2PvJzNqPYaFxlN91/Svlt+MCK/NoC+G8TCm69eKM1YivKeXDqD0s4CN/4cXO3xVgU/q6XKGj5reJy6ieSWFRnWEK+j53UNn0EPMXP/Dt4zEGEwIaAkf9QqG0rbOIi9gfg0aBDf1NmNnmQKBgBim0sPJbUhmn2qgk/jQgrGcb1uILKvkvqSbwSzBkvJ3qhl+ocssWz4knTutHs86MvTP5h4osn9JRvI7tMhJrC8YXC/0l37ioGqukByTfQ3OixXOAaeyW95a/AF8AQmCnq3qXnJOp20brXa8o3ymkyuZ3B8/YkIQIBU6og4g7SIVAoGAFuOtq4OSojW+W+Mz0N7uz1VZjpMY4f26PKsBlD6MuN8LYzfwXrZWbMHXinyPZIMOQ5SipAVxKk/DxLYzv+tNn0ZEUBZDRWPpGGyu3TGQ7I2JNBTLzUrWdaMsX7pfWSEAVNKXTzhgsyDrbVGA3k8BraWkLrVDt9w47BrSw9G5ksECgYEA2gyygFbQ9UyYofmEr6Wg61zWf7TLdipgB2BB89vSeLbQRGaKuc+vxz7GhTnobhqzfBszNItJolDZYgCBOixaZotX262Ek6K4ekXmT3HYKil7OG5F3xeezH+b50YeOdyPiemeXNgbs5xxM65RmDBxPFYoTYD4hmxvAjCQLUjM3EQ=",sig);
    System.out.println(dao.sha256Hash("abc"));


    }
}
