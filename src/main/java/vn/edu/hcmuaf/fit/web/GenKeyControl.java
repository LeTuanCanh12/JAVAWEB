package vn.edu.hcmuaf.fit.web;

import vn.edu.hcmuaf.fit.dao.KeyDao;
import vn.edu.hcmuaf.fit.dao.LoginDao;
import vn.edu.hcmuaf.fit.dao.SignatureDao;
import vn.edu.hcmuaf.fit.model.Key;
import vn.edu.hcmuaf.fit.model.UserModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "tao-chu-ky", value = "/tao-chu-ky")
public class GenKeyControl extends HttpServlet {
    LoginDao loginDao = new LoginDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.getRequestDispatcher("/views/web/genkey.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset-UTF-8");
        try {
            String privatekey = request.getParameter("private-key");
            String signatureText= request.getParameter("signature-text");
            if (privatekey != null && signatureText != null) {
                SignatureDao dao = new SignatureDao();
                String signature = dao.encryptRSA(privatekey,dao.sha256Hash(signatureText));
                dao.updateSignature(privatekey,signature);
                request.getSession().setAttribute("signature", signature);
                response.sendRedirect("/views/web/SignatureNoti.jsp");
            }
        }catch (Exception e) {

        }
    }
}
