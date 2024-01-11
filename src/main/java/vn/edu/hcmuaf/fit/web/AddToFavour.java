package vn.edu.hcmuaf.fit.web;

import vn.edu.hcmuaf.fit.dao.ListProductDao;
import vn.edu.hcmuaf.fit.dao.SignatureDao;
import vn.edu.hcmuaf.fit.dao.TransactionDao;
import vn.edu.hcmuaf.fit.model.*;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = {"/yeu-thich"})
public class AddToFavour extends HttpServlet {

    /**
     *
     */
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        TransactionDao dao = new TransactionDao();
        List<Transaction> listTrans = new ArrayList<>();
        UserModel user = (UserModel) req.getSession().getAttribute("user");
        listTrans = dao.getAllTransactionById(user.getMail());
        SignatureDao daoHash = new SignatureDao();
        String textHash = "";
        try {
            for (Transaction s : listTrans) {
                textHash = s.getName() + s.getEmail() + s.getPhone() + s.getAddress() + s.getNote()
                        + s.getTotal() + s.getItems();
               			 String hashed = daoHash.sha256Hash(textHash);


            }
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }


        req.setAttribute("listAllTrans", listTrans);
        req.getRequestDispatcher("/views/web/favour.jsp");
    }

    public static void main(String[] args) {

    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // TODO Auto-generated method stub
        super.doPost(req, resp);
    }
}
