package vn.edu.hcmuaf.fit.model;

public class Key {
    int id;
    int User_id;
    String publickey;
    String privatekey;
    String signature;
    int status;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return User_id;
    }

    public void setUser_id(int user_id) {
        User_id = user_id;
    }

    public String getPublickey() {
        return publickey;
    }

    public void setPublickey(String publickey) {
        this.publickey = publickey;
    }

    public String getPrivatekey() {
        return privatekey;
    }

    public void setPrivatekey(String privatekey) {
        this.privatekey = privatekey;
    }

    public String getSignature() {
        return signature;
    }

    public void setSignature(String signature) {
        this.signature = signature;
    }

    public int getStatus() {
        return status;
    }

    public void setStatus(int status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "Key{" +
                "id=" + id +
                ", User_id=" + User_id +
                ", publickey='" + publickey + '\'' +
                ", privatekey='" + privatekey + '\'' +
                ", signature='" + signature + '\'' +
                ", status=" + status +
                '}';
    }
}
