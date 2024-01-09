package vn.edu.hcmuaf.fit.web;

import vn.edu.hcmuaf.fit.dao.ListProductDao;
import vn.edu.hcmuaf.fit.model.Cart;
import vn.edu.hcmuaf.fit.model.CartProduct;
import vn.edu.hcmuaf.fit.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(urlPatterns = { "/yeu-thich" })
public class AddToFavour extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		ListProductDao dao = new ListProductDao();
		int quantity = 1;
		int id;
		if (req.getParameter("proId") != null) {
			Product pro = dao.inforProduct(req.getParameter("proId"));
			if (pro != null) {
				if (req.getParameter("quantity") != null) {
					quantity = Integer.parseInt(req.getParameter("quantity"));
				}
			}
			HttpSession session = req.getSession();
			if (session.getAttribute("favour") == null) {
				Cart favour = new Cart();
				List<CartProduct> list = new ArrayList<>();
				CartProduct cartp = new CartProduct();
				cartp.setPro(pro);
				cartp.setQuantity(quantity);
				list.add(cartp);
				favour.setList(list);
				session.setAttribute("favour", favour);
				;
			} else {
				Cart favour = (Cart) session.getAttribute("favour");
				List<CartProduct> list = favour.getList();
				boolean exist = false;
				for (CartProduct p : list) {
					if (p.getPro().getPro_id() == pro.getPro_id()) {
						p.setQuantity(p.getQuantity() + quantity);
						exist = true;
					}
					
				}
				if (exist == false) {
					CartProduct p = new CartProduct();
					p.setPro(pro);
					p.setQuantity(quantity);
					list.add(p);
					
				}
				session.setAttribute("favour", favour);
			}
			
			req.getRequestDispatcher("/danh-sach-san-pham").forward(req, resp);

		} else {
			
			req.getRequestDispatcher("/danh-sach-san-pham").forward(req, resp);
		}
	}

	public static void main(String[] args) {

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(req, resp);
	}
}
