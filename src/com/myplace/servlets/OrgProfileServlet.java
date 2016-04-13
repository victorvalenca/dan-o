package com.myplace.servlets;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrgProfileServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrgProfileServlet() {
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

		request.setAttribute("information", rb.getString("op.information"));
		request.setAttribute("einformation", rb.getString("op.editInfo"));
		request.setAttribute("proPic", rb.getString("op.chgProfPic"));
		request.setAttribute("bacPic", rb.getString("op.chgBackPic"));
		request.setAttribute("facebook", rb.getString("op.facebook"));
		request.setAttribute("twitter", rb.getString("op.twitter"));
		request.setAttribute("event", rb.getString("op.events"));
		request.setAttribute("crevent", rb.getString("op.crEvent"));

		request.setAttribute("hosted", rb.getString("ed.hosted"));
		request.setAttribute("date", rb.getString("ed.dateAndTime"));

		request.setAttribute("going", rb.getString("ed.going"));
		request.setAttribute("interested", rb.getString("ed.interested"));
		request.setAttribute("ngoing", rb.getString("ed.ngoing"));

		// ================================================================================
		// End Internationalization
		// ================================================================================
		
		//TODO Database DAO 

		request.getRequestDispatcher("Organization/profile.jsp?ID=" + param_no).forward(request, response);
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
