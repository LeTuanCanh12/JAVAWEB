package vn.edu.hcmuaf.fit.web;

import vn.edu.hcmuaf.fit.dao.LoginDao;
import vn.edu.hcmuaf.fit.model.UserModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "dang-nhap", value = "/dang-nhap")
public class LoginControl extends HttpServlet {
    LoginDao loginDao = new LoginDao();
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
request.getRequestDispatcher("/views/web/login.jsp").forward(request,response);
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
