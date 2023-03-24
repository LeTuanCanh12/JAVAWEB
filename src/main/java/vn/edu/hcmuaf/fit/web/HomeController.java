package vn.edu.hcmuaf.fit.web;

import vn.edu.hcmuaf.fit.dao.HomeDao;
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

/**
 * Servlet implementation class HomeController
 */
@WebServlet(urlPatterns = "/trang-chu")
public class HomeController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public HomeController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		RequestDispatcher rd = request.getRequestDispatcher("/views/web/home.jsp");

		HomeDao dao = new HomeDao();
		List<Product> list = dao.getProductCommon();

		ListProductDao daoSale = new ListProductDao();
		List<Product> listSale = daoSale.getProductSales();

		HomeDao daoRating2 = new HomeDao();
		List<Product> listRating2 = daoRating2.getProductRating2();

		request.setAttribute("listCo", list);

		request.setAttribute("listSale", listSale);

		request.setAttribute("listRa", listRating2);

		request.getRequestDispatcher("/views/web/home.jsp");
		rd.forward(request, response);
	}

//	public static void main(String[] args) {
//		HomeDao daoRating2 = new HomeDao();
//		List<Product> listRating2 = daoRating2.getProductCommon();
//
//		for (Product product : listRating2) {
//			System.out.println(product);
//		}
//	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
