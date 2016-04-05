package com.myplace.servlets;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ProfileEditServlet
 */
public class ProfileEditServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	public ProfileEditServlet() {
		super();
	}
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String param_no = (String) request.getParameter("param_no");

		// ================================================================================
		// Internationalization
		// ================================================================================

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

		ResourceBundle rb = ResourceBundle.getBundle("resources.content", locale);

		request.setAttribute("about", rb.getString("mnu.about"));
		request.setAttribute("organization", rb.getString("mnu.organization"));
		request.setAttribute("event", rb.getString("mnu.event"));
		request.setAttribute("settings", rb.getString("mnu.settings"));
		request.setAttribute("logout", rb.getString("mnu.btnLogout"));

		request.setAttribute("information", rb.getString("up.information"));
		request.setAttribute("einformation", rb.getString("up.editInfo"));
		request.setAttribute("proPic", rb.getString("up.chgProfPic"));
		request.setAttribute("bacPic", rb.getString("up.chgBackPic"));
		request.setAttribute("facebook", rb.getString("up.facebook"));
		request.setAttribute("twitter", rb.getString("up.twitter"));

		request.setAttribute("txtFN", rb.getString("um.txtFN"));
		request.setAttribute("txtLN", rb.getString("um.txtLN"));
		request.setAttribute("txtEmail", rb.getString("um.txtEmail"));
		request.setAttribute("txtREmail", rb.getString("um.txtREmail"));


		// ================================================================================
		// End Internationalization
		// ================================================================================
	
		//TODO Database DAO
		
		if (param_no == null) {
			request.getRequestDispatcher("User/profileEdit.jsp").forward(request, response);
		} else {
			request.getRequestDispatcher("User/profileEdit.jsp?ID=" + param_no).forward(request, response);
		}
	
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
