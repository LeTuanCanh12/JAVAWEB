package vn.edu.hcmuaf.fit.web;

import vn.edu.hcmuaf.fit.dao.KeyDao;
import vn.edu.hcmuaf.fit.dao.LoginDao;
import vn.edu.hcmuaf.fit.model.UserModel;
import vn.edu.hcmuaf.fit.security.DigitalSignature;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.security.KeyPair;
import java.security.NoSuchAlgorithmException;
import java.security.NoSuchProviderException;

@WebServlet(name = "dang-ky", value = "/dang-ky")
public class RegisterControl extends HttpServlet {
    LoginDao loginDao = new LoginDao();


    public RegisterControl() throws NoSuchAlgorithmException, NoSuchProviderException {
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("views/web/register.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset-UTF-8");
        request.setCharacterEncoding("UTF-8");
        try {
            String user = request.getParameter("username");
            String email = request.getParameter("email");
            String pass = request.getParameter("password");
            String passnew = request.getParameter("passwordnew");


            if(!user.equals("") && !pass.equals("") && !email.equals("")) {
                if(!pass.equals(passnew)) {
                    response.sendRedirect("/RegisterControl?massger=Sai Mật Khẩu");
//                    response.sendRedirect("/RegisterControl");
//                    request.setAttribute(" massger", "Sai Mật Khẩu");
//                    request.getRequestDispatcher("/views/web/register.jsp").forward(request,response);
                }else {

                    LoginDao dao = new LoginDao();
                    UserModel a = dao.check(email);
                    if (a == null) {

                        dao.singup(email,pass,user);
                        KeyDao key = new KeyDao();
                        UserModel userModel = loginDao.findByEmailAndPassword(email, pass);
//                        System.out.println(userModel.getUser_id());
                        key.addKey(userModel.getUser_id());
                        request.getSession().setAttribute("Key", key.findKeyByUser(userModel.getUser_id()));
//                        System.out.println(key.findKeyByUser(userModel.getUser_id()).toString());
                        response.sendRedirect("/views/web/key.jsp");
//                        response.sendRedirect("/dang-nhap");
                    }else  {
                        response.sendRedirect("/dang-ky?massger=Email đã tồn tại");
//                        response.sendRedirect("/RegisterControl");
//                        request.setAttribute(" massger", "Email đã tồn tại");
//                      request.getRequestDispatcher("/views/web/register.jsp").forward(request,response);

                    }
                }
            }else {
                response.sendRedirect("/dang-ky?massger=Nhập dữ liệu");
//                response.sendRedirect("/RegisterControl");
//                request.setAttribute(" massger", "123");
//                request.getRequestDispatcher("views/web/register.jsp").forward(request,response);
            }


        } catch (Exception e) {
            throw new RuntimeException(e);
        }

    }
}
