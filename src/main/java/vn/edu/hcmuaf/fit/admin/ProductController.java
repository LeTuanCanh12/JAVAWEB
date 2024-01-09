package vn.edu.hcmuaf.fit.admin;

import vn.edu.hcmuaf.fit.dao.ListProductDao;
import vn.edu.hcmuaf.fit.model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "admin-san-pham", value = "/admin-san-pham")
public class ProductController extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        ListProductDao dao = new ListProductDao();
        List<Product> list = dao.getAllProduct();


        List<Product> listSale = dao.getProductSales();

        request.setAttribute("listSale", listSale);

        request.setAttribute("listPro", list);

        request.getRequestDispatcher("/views/admin/product.jsp").forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
