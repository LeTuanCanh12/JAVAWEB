package vn.edu.hcmuaf.fit.dao;

import java.security.Key;
import java.security.MessageDigest;
import java.util.Arrays;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;
public class VerifyDao {
    private static final String ALGORITHM = "AES";
    private static final String HASH_ALGORITHM = "SHA-256";

    // Mã hóa dữ liệu với key
    public static String encrypt(String data, String key) throws Exception {
        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.ENCRYPT_MODE, generateKey(key));
        byte[] encryptedBytes = cipher.doFinal(data.getBytes());
        return Arrays.toString(encryptedBytes);
    }

    // Giải mã dữ liệu với key
    public static String decrypt(String encryptedData, String key) throws Exception {
        Cipher cipher = Cipher.getInstance(ALGORITHM);
        cipher.init(Cipher.DECRYPT_MODE, generateKey(key));
        byte[] encryptedBytes = parseHexString(encryptedData);
        byte[] decryptedBytes = cipher.doFinal(encryptedBytes);
        return new String(decryptedBytes);
    }

    // Tạo key từ chuỗi key và mã hóa nó với thuật toán SHA-256
    private static Key generateKey(String key) throws Exception {
        MessageDigest sha = MessageDigest.getInstance(HASH_ALGORITHM);
        byte[] keyBytes = key.getBytes("UTF-8");
        keyBytes = sha.digest(keyBytes);
        keyBytes = Arrays.copyOf(keyBytes, 16);
        return new SecretKeySpec(keyBytes, ALGORITHM);
    }

    // Chuyển đổi chuỗi hex thành mảng byte
    private static byte[] parseHexString(String hexString) {
        hexString = hexString.replaceAll("\\[", "").replaceAll("\\]", "").replaceAll("\\s", "");
        String[] hexValues = hexString.split(",");
        byte[] result = new byte[hexValues.length];
        for (int i = 0; i < hexValues.length; i++) {
            result[i] = (byte) Integer.parseInt(hexValues[i]);
        }
        return result;
    }

    public static void main(String[] args) throws Exception {
        String originalData = "Hello, World!";
        String key = "YourSecretKey";

        // Mã hóa dữ liệu
        String encryptedData = encrypt(originalData, key);
        System.out.println("Encrypted: " + encryptedData);

        // Giải mã dữ liệu
        String decryptedData = decrypt(encryptedData, key);
        System.out.println("Decrypted: " + decryptedData);
    }
}
