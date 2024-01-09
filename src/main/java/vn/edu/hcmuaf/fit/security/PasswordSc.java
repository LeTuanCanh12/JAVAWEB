package vn.edu.hcmuaf.fit.security;
import org.mindrot.jbcrypt.BCrypt;
public class PasswordSc {
    public String hashPassword(String password) {
        // Giai ma mat khau voi salt ngau nhien (co the tu dong tao salt hoac tuy chon)
        String salt = BCrypt.gensalt();
        return BCrypt.hashpw(password, salt);
    }
    public boolean checkPassword(String password, String hashedPassword) {
        // Kiem tra xem password co trung khop voi hashedPassword hay khong
        return BCrypt.checkpw(password, hashedPassword);
    }
    public static void main(String[] args) {
        PasswordSc ps = new PasswordSc();
        String rawPassword = "1";
        String hashedPassword = ps.hashPassword(rawPassword);

        System.out.println("Raw password: " + rawPassword);
        System.out.println("Hashed password: " + hashedPassword);

        boolean passwordMatch = ps.checkPassword(rawPassword, "$2a$10$06nKCaAT96HtTumMFLf4mOcupfO3cy2lN2Uk7xNcgiKxXd43VptNe");

        if (passwordMatch) {
            System.out.println("Password is correct!");
        } else {
            System.out.println("Password is incorrect!");
        }
    }

}