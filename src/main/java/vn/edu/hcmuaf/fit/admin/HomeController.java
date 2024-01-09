package vn.edu.hcmuaf.fit.admin;

import vn.edu.hcmuaf.fit.dao.ListProductDao;
import vn.edu.hcmuaf.fit.dao.UserDao;
import vn.edu.hcmuaf.fit.model.Product;
import vn.edu.hcmuaf.fit.model.UserModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "admin-trang-chu", value = "/admin-trang-chu")
public class HomeController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ListProductDao dao = new ListProductDao();
        List<Product> list = dao.getAllProduct();
        request.setAttribute("listPro", list);


        List<UserModel> temp = new ArrayList<>();
        UserDao daoUser = new UserDao();
        temp = daoUser.getAllUser();

        request.setAttribute("custom",temp);
        request.getRequestDispatcher("/views/admin/homeData.jsp").forward(request, response);    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
