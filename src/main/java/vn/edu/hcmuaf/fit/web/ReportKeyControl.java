package vn.edu.hcmuaf.fit.web;

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
            String user = request.getParameter("username");
            String pass = request.getParameter("password");
            if (user != null && pass != null) {
                UserModel userModel = loginDao.findByEmailAndPassword(user, pass);
                if (userModel != null) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", userModel);
                    if(userModel.getAuthorities() ==1)
                        request.getRequestDispatcher("trang-chu").forward(request,response);
                    if(userModel.getAuthorities() == 2)
                        request.setAttribute("admin",userModel);
                        request.getRequestDispatcher("/views/admin/home.jsp").forward(request,response);
                    if (userModel.getAuthorities() ==3)
                        request.getRequestDispatcher("views/admin/home.jsp").forward(request,response);

                }else {
                    request.getRequestDispatcher("views/web/login.jsp").forward(request,response);
                }
            }
        }catch (Exception e) {

        }
    }
}
