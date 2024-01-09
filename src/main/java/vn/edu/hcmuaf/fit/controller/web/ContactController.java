package vn.edu.hcmuaf.fit.controller.web;

import vn.edu.hcmuaf.fit.dao.ContactDao;
import vn.edu.hcmuaf.fit.model.UserModel;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.*;
import java.io.IOException;

@WebServlet(name = "/gui-lien-he", value = "/gui-lien-he")
public class ContactController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/views/web/contact.jsp").forward(request,response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset-UTF-8");
		try {
			String user = request.getParameter("name");
			String phone = request.getParameter("phone");
			String mail = request.getParameter("email");
			String note = request.getParameter("note");

			if (!user.equals("") && !phone.equals("") && !mail.equals("") && !note.equals("")) {
				ContactDao contactDao = new ContactDao();
				contactDao.contact(user,phone,mail,note);
				response.sendRedirect("/gui-lien-he");

			}else {
				response.sendRedirect("/gui-lien-he");
			}

		}catch (Exception e) {

		}
	}
}
