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

@WebServlet(urlPatterns = { "/gio-hang" })
public class AddToCartController extends HttpServlet {

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
			if (session.getAttribute("cart") == null) {
				Cart cart = new Cart();
				List<CartProduct> list = new ArrayList<>();
				CartProduct cartp = new CartProduct();
				cartp.setPro(pro);
				cartp.setQuantity(quantity);
				list.add(cartp);
				cart.setList(list);
				session.setAttribute("cart", cart);
				;
			} else {
				Cart cart = (Cart) session.getAttribute("cart");
				List<CartProduct> list = cart.getList();
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
				session.setAttribute("cart", cart);
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
