package com.myplace.servlets;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AccountServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AccountServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String language = (String) request.getSession().getAttribute("language");
		String country = (String) request.getSession().getAttribute("country");
		Locale locale;

		if (language.equals("fr") && country.equals("FR")) {
			language = "fr";
			country = "FR";
		} else {
			language = "en";
			country = "US";
		}

		locale = new Locale(language, country);
		request.getSession().setAttribute("country", locale.getCountry());
		request.getSession().setAttribute("language", locale.getLanguage());

		@SuppressWarnings("unused")
		ResourceBundle rb = ResourceBundle.getBundle("resources.content", locale);

		// ================================================================================
		// Internationalization
		// ================================================================================

		//TODO Internationalization for Account Servlet

		// ================================================================================
		// End Internationalization
		// ================================================================================

		//TODO Database DAO
		
		request.getRequestDispatcher("account.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}
}
