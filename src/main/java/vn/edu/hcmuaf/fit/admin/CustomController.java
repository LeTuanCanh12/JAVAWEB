package vn.edu.hcmuaf.fit.admin;

import vn.edu.hcmuaf.fit.dao.UserDao;
import vn.edu.hcmuaf.fit.model.UserModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "admin-khach-hang", value = "/admin-khach-hang")
public class CustomController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<UserModel> temp = new ArrayList<>();
        UserDao dao = new UserDao();
        temp = dao.getAllUser();

        request.setAttribute("custom",temp);
        request.getRequestDispatcher("/views/admin/custom.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
