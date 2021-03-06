package com.myplace.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.myplace.dao.LoginDao;

public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {}
	
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int ID;
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String n = request.getParameter("lEmail");
		String p = request.getParameter("lPassword");

		HttpSession session = request.getSession(false);
		if (session != null) {
			session.setAttribute("name", n);
		}
		
		if (LoginDao.validate(n, p)) {
			ID = LoginDao.getID(n);
			session.setAttribute("UserID", ID);
			request.getRequestDispatcher("userProfileServlet").forward(request, response);
		} else {
			out.print("<p style=\"color:red\">Sorry email or password error</p>");
			RequestDispatcher rd = request.getRequestDispatcher("localeServlet");
			rd.include(request, response);
		}

		out.close();
	}

}
