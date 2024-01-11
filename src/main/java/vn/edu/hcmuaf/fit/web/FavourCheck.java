package vn.edu.hcmuaf.fit.web;

import vn.edu.hcmuaf.fit.dao.SignatureDao;
import vn.edu.hcmuaf.fit.dao.TransactionDao;
import vn.edu.hcmuaf.fit.model.Transaction;
import vn.edu.hcmuaf.fit.model.UserModel;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.List;

/**
 * Servlet implementation class FavourCheck
 */
@WebServlet("/danh-sach-don-hang")
public class FavourCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public FavourCheck() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		TransactionDao dao = new TransactionDao();
		List<Transaction> listTrans = new ArrayList<>();
		UserModel user = (UserModel) request.getSession().getAttribute("user");
		listTrans = dao.getAllTransactionById(user.getMail());
		System.out.println(listTrans);
		SignatureDao daoHash = new SignatureDao();
		String textHash = "";
		try {
			for (Transaction s : listTrans) {
				textHash = s.getName() + s.getEmail() + s.getPhone() + s.getAddress() + s.getNote()
						+ s.getTotal() + s.getItems();
				String hashed = daoHash.sha256Hash(textHash);
				if (hashed.equals(s.getHash())) {
					s.setStatus(1);
				}


			}
		} catch (NoSuchAlgorithmException e) {
			throw new RuntimeException(e);
		}


		request.setAttribute("listAllTrans", listTrans);
		request.getRequestDispatcher("/views/web/favour.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}


}
