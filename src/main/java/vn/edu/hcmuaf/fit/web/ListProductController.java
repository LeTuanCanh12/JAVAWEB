package vn.edu.hcmuaf.fit.web;

import vn.edu.hcmuaf.fit.dao.ListProductDao;
import vn.edu.hcmuaf.fit.model.Product;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = { "/danh-sach-san-pham" })
public class ListProductController extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		RequestDispatcher rd = req.getRequestDispatcher("/views/web/listProduct.jsp");
		ListProductDao dao = new ListProductDao();
		String indexPage = req.getParameter("indexPage");
		if (indexPage == null)
			indexPage = "1";
		int index = Integer.parseInt(indexPage);
		List<Product> listPaging = dao.paging(index);

		int total = dao.getTotalProduct();
		int endPage = total % 9 == 0 ? total / 9 : total / 9 + 1;

		ListProductDao daoSale = new ListProductDao();
		List<Product> listSale = daoSale.getProductSales();

		req.setAttribute("listPro", listPaging);

		req.setAttribute("listSale", listSale);
		req.setAttribute("endPage", endPage);
		req.setAttribute("tag", index);


		req.getRequestDispatcher("/views/web/listProduct.jsp");

		rd.forward(req, resp);

	}


	

//	public static void main(String[] args) {
//		ListProductDao dao = new ListProductDao();
//		List<Product> listSale = dao.getProductSales();
//		for (Product product : listSale) {
//			System.out.println(product);
//		}
//	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
