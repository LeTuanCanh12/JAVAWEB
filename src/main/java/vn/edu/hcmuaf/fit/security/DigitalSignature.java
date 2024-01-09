package vn.edu.hcmuaf.fit.security;
import org.bouncycastle.jce.provider.BouncyCastleProvider;

import java.security.*;
import java.security.spec.PKCS8EncodedKeySpec;
import java.security.spec.X509EncodedKeySpec;
import java.util.Base64;

public class DigitalSignature {
    private KeyPair key;

    static {
        Security.addProvider(new BouncyCastleProvider());
    }

    public static void main(String[] args) throws Exception {
        // Thêm Bouncy Castle Provider

        DigitalSignature DG = new DigitalSignature();
        // Người dùng tạo cặp khóa (khóa riêng và khóa công khai)
        KeyPair keyPair = DG.generateKeyPair();

        // Người dùng tạo thông tin cần ký
        String dataToSign = "Hello, this is the data to sign.";

        // Người dùng ký thông tin
//        byte[] signature = signData(dataToSign.getBytes(), DG.getPrivateKey());

        // Quản trị viên xác nhận chữ ký
//        boolean isVerified = verifySignature(dataToSign.getBytes(), signature, DG.getPublicKey());

//        System.out.println("Chữ ký xác nhận: " + isVerified);

        // Chuyển PrivateKey thành chuỗi
        String privateKeyStr = DG.keyToString(keyPair.getPrivate());

        // Chuyển PublicKey thành chuỗi
        String publicKeyStr = DG.keyToString(keyPair.getPublic());

        // In ra chuỗi PrivateKey và PublicKey
        System.out.println("PrivateKey as string:\n" + privateKeyStr);
        System.out.println("\nPublicKey as string:\n" + publicKeyStr);

        // Chuyển chuỗi PrivateKey thành đối tượng PrivateKey
        PrivateKey loadedPrivateKey = DG.stringToPrivateKey(privateKeyStr);

        // Chuyển chuỗi PublicKey thành đối tượng PublicKey
        PublicKey loadedPublicKey = DG.stringToPublicKey(publicKeyStr);

        // Kiểm tra xem quá trình chuyển đổi đã thành công hay không
        System.out.println("\nLoaded PrivateKey:\n" + loadedPrivateKey);
        System.out.println("\nLoaded PublicKey:\n" + loadedPublicKey);


    }

    // Hàm tạo cặp khóa
    public KeyPair generateKeyPair() throws NoSuchAlgorithmException, NoSuchProviderException {
        KeyPairGenerator keyPairGenerator = KeyPairGenerator.getInstance("RSA", "BC");
        keyPairGenerator.initialize(2048, new SecureRandom());
        return key = keyPairGenerator.generateKeyPair();
    }

    // Hàm ký dữ liệu
    private static byte[] signData(byte[] data, PrivateKey privateKey) throws Exception {
        Signature signature = Signature.getInstance("SHA256withRSA", "BC");
        signature.initSign(privateKey);
        signature.update(data);
        return signature.sign();
    }

    // Hàm xác nhận chữ ký
    private static boolean verifySignature(byte[] data, byte[] signature, PublicKey publicKey) throws Exception {
        Signature verifier = Signature.getInstance("SHA256withRSA", "BC");
        verifier.initVerify(publicKey);
        verifier.update(data);
        return verifier.verify(signature);
    }

    // Phương thức truy xuất khóa công khai từ bên ngoài class
    public String getPublicKey() {
        return Base64.getEncoder().encodeToString(key.getPublic().getEncoded());
    }

    // Phương thức truy xuất khóa riêng từ bên ngoài class
    public String getPrivateKey() {
        return Base64.getEncoder().encodeToString(key.getPrivate().getEncoded());
    }

    // Chuyển khóa thành chuỗi
    public String keyToString(java.security.Key key) {
        return Base64.getEncoder().encodeToString(key.getEncoded());
    }

    // Chuyển chuỗi thành PrivateKey
    private  PrivateKey stringToPrivateKey(String keyStr) throws Exception {
        byte[] keyBytes = Base64.getDecoder().decode(keyStr);
        PKCS8EncodedKeySpec keySpec = new PKCS8EncodedKeySpec(keyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        return keyFactory.generatePrivate(keySpec);
    }

    // Chuyển chuỗi thành PublicKey
    private  PublicKey stringToPublicKey(String keyStr) throws Exception {
        byte[] keyBytes = Base64.getDecoder().decode(keyStr);
        X509EncodedKeySpec keySpec = new X509EncodedKeySpec(keyBytes);
        KeyFactory keyFactory = KeyFactory.getInstance("RSA");
        return keyFactory.generatePublic(keySpec);
    }
}