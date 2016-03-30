package com.myplace.servlets;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class OrgMainServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public OrgMainServlet() {
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

		request.setAttribute("infoLnT", rb.getString("om.infoLnT"));
		request.setAttribute("infoLn1", rb.getString("om.infoLn1"));
		request.setAttribute("infoLn2", rb.getString("om.infoLn2"));
		request.setAttribute("infoLn3", rb.getString("om.infoLn3"));
		request.setAttribute("infoLn4", rb.getString("om.infoLn4"));
		request.setAttribute("infoLn5", rb.getString("om.infoLn5"));

		/*
		 * request.setAttribute("information", rb.getString("up.information"));
		 * request.setAttribute("einformation", rb.getString("up.editInfo"));
		 * request.setAttribute("proPic", rb.getString("up.chgProfPic"));
		 * request.setAttribute("bacPic", rb.getString("up.chgBackPic"));
		 * request.setAttribute("facebook", rb.getString("up.facebook"));
		 * request.setAttribute("twitter", rb.getString("up.twitter"));
		 * request.setAttribute("attending", rb.getString("up.attending"));
		 * request.setAttribute("interested", rb.getString("up.interested"));
		 * request.setAttribute("attended", rb.getString("up.attended"));
		 * request.setAttribute("hosted", rb.getString("ed.hosted"));
		 */

		// ================================================================================
		// End Internationalization
		// ================================================================================
		
		//TODO Database DAO
		
		request.getRequestDispatcher("Organization/main.jsp").forward(request, response);
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
