package vn.edu.hcmuaf.fit.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.security.NoSuchAlgorithmException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import vn.edu.hcmuaf.fit.dao.KeyDao;
import vn.edu.hcmuaf.fit.dao.SignatureDao;
import vn.edu.hcmuaf.fit.dao.TransactionDao;
import vn.edu.hcmuaf.fit.model.Cart;
import vn.edu.hcmuaf.fit.model.UserModel;

@WebServlet(urlPatterns = { "/thanh-toan" })
public class CheckOutController extends HttpServlet {

	/**
	 *
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.getRequestDispatcher("/views/web/checkOut.jsp").forward(req, resp);

	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		resp.setContentType("text/html;charset-UTF-8");
		req.setCharacterEncoding("UTF-8");
		TransactionDao dao = new TransactionDao();
		HttpSession session = req.getSession();

		Cart cart = (Cart) session.getAttribute("cart");
		UserModel user = (UserModel) session.getAttribute("user");

		if (cart == null)
			req.getRequestDispatcher("/views/web/checkOut.jsp").forward(req, resp);
		else {
			String name = req.getParameter("ho") + req.getParameter("ten");
			String address = req.getParameter("diachi") + ", " + req.getParameter("thanhpho") + ", "
					+ req.getParameter("quocgia");
			String phone = req.getParameter("phone");
			String email = user.getMail();
			String note = req.getParameter("note");
			String verify_code = req.getParameter("verify-code");
			String textSig = req.getParameter("textSig");

//			if (cart != null && !name.equals("") && !address.equals("") && !phone.equals("") && !email.equals("")) {
			try {
			if(dao.verifyUserCode(user.getUser_id(), verify_code)) {
				SignatureDao decryptVeriCode = new SignatureDao();

					String temp = decryptVeriCode.decryptRSA(dao.getPublicKey(user.getUser_id()),verify_code);
					String textSigHash = decryptVeriCode.sha256Hash(textSig);
					if(textSigHash.equals(temp)) {
						dao.createNewTransaction(user.getUser_id(), cart, name, address, phone, email, note, cart.tong_tien_gio());
						req.getSession().removeAttribute("cart");
						resp.sendRedirect("./trang-chu");
					}else {
						req.setAttribute("scriptCode", "alert('Không thể tiến hành thanh toán, vui lòng nhập mã xác thực người dùng');");
						req.getRequestDispatcher("/views/web/checkOut.jsp").forward(req, resp);
					}


				} else {
				req.setAttribute("scriptCode", "alert('Không thể tiến hành thanh toán, vui lòng nhập mã xác thực người dùng');");
				req.getRequestDispatcher("/views/web/checkOut.jsp").forward(req, resp);
				}
			} catch (Exception e) {
				throw new RuntimeException(e);
			}
		}
	}
}
