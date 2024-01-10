package vn.edu.hcmuaf.fit.web;

import vn.edu.hcmuaf.fit.dao.KeyDao;
import vn.edu.hcmuaf.fit.dao.LoginDao;
import vn.edu.hcmuaf.fit.model.UserModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "bao-cao-chu-ky", value = "/bao-cao-chu-ky")
public class ReportKeyControl extends HttpServlet {
    LoginDao loginDao = new LoginDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.getRequestDispatcher("/views/web/reportkey.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset-UTF-8");
        try {
            String email = request.getParameter("email");
            String pass = request.getParameter("password");
            if(!(email.equals(null))&&!(pass.equals(null))){
                KeyDao key = new KeyDao();
                UserModel userModel = loginDao.findByEmailAndPassword(email, pass);
                //thay doi status cua key cu
                key.updateKey(userModel.getUser_id());

               //tạo key moi gán vào bảng key
                key.addKey(userModel.getUser_id());
                request.getSession().setAttribute("KeyReNew", key.findKeyByUser(userModel.getUser_id()));
                response.sendRedirect("/views/web/keyRenew.jsp");

            }
        }catch (Exception e) {

        }
    }
}
