package vn.edu.hcmuaf.fit.admin;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import vn.edu.hcmuaf.fit.dao.TransactionDao;
import vn.edu.hcmuaf.fit.model.Transaction;

@WebServlet(name = "admin-danh-sach-hoa-don", value = "/admin-danh-sach-hoa-don")
public class ListTransController extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		TransactionDao dao = new TransactionDao();
		List<Transaction> list = dao.getAllTransaction();
		
		req.setAttribute("trans", list);
		req.getRequestDispatcher("/views/admin/transaction.jsp").forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doGet(req, resp);
	}
}
