package com.myplace.servlets;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class LocaleServlet
 */
public class LocaleServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LocaleServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// ================================================================================
		// Internationalization
		// ================================================================================

		String planguage = request.getParameter("submit");

		String language = null;
		String country = null;
		Locale locale;

		if (planguage == null) {
			language = (String) request.getSession().getAttribute("language");
			country = (String) request.getSession().getAttribute("country");

			if (language.equals("fr") && country.equals("FR")) {
				language = "fr";
				country = "FR";
			} else {
				language = "en";
				country = "US";
			}
		} else {
			if (planguage.equals("Francais")) {
				language = "fr";
				country = "FR";
			} else {
				language = "en";
				country = "US";
			}
		}
		locale = new Locale(language, country);
		request.getSession().setAttribute("country", locale.getCountry());
		request.getSession().setAttribute("language", locale.getLanguage());

		ResourceBundle rb = ResourceBundle.getBundle("resources.content", locale);

		request.setAttribute("about", rb.getString("mnu.about"));
		request.setAttribute("guest", rb.getString("mnu.guest"));
		request.setAttribute("user", rb.getString("mnu.user"));
		request.setAttribute("btnLogin", rb.getString("mnu.btnLogin"));
		request.setAttribute("infoLnT", rb.getString("um.infoLnT"));
		request.setAttribute("infoLn1", rb.getString("um.infoLn1"));
		request.setAttribute("infoLn2", rb.getString("um.infoLn2"));
		request.setAttribute("infoLn3", rb.getString("um.infoLn3"));
		request.setAttribute("infoLn4", rb.getString("um.infoLn4"));
		request.setAttribute("infoLn5", rb.getString("um.infoLn5"));
		request.setAttribute("txtFN", rb.getString("um.txtFN"));
		request.setAttribute("txtLN", rb.getString("um.txtLN"));
		request.setAttribute("txtEmail", rb.getString("um.txtEmail"));
		request.setAttribute("txtREmail", rb.getString("um.txtREmail"));
		request.setAttribute("txtPassword", rb.getString("um.txtPassword"));
		request.setAttribute("btnSignIn", rb.getString("um.btnSignIn"));

		// ================================================================================
		// End Internationalization
		// ================================================================================
		
		request.getRequestDispatcher("User/main.jsp").forward(request, response);
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
