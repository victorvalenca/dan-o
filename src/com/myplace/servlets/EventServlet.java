package com.myplace.servlets;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EventServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EventServlet() {
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

		request.setAttribute("title", rb.getString("ei.title"));
		request.setAttribute("commands", rb.getString("ei.commands"));
		request.setAttribute("pagesz", rb.getString("ei.pageSize"));
		request.setAttribute("lblTitle", rb.getString("ei.lblTitle"));
		request.setAttribute("lblNotes", rb.getString("ei.lblNotes"));
		request.setAttribute("search", rb.getString("ei.search"));

		request.setAttribute("hosted", rb.getString("ed.hosted"));
		request.setAttribute("date", rb.getString("ed.dateAndTime"));
		request.setAttribute("going", rb.getString("ed.going"));
		request.setAttribute("interested", rb.getString("ed.interested"));
		request.setAttribute("ngoing", rb.getString("ed.ngoing"));

		// ================================================================================
		// End Internationalization
		// ================================================================================

		//TODO Database DAO
		
		request.getRequestDispatcher("Event/list.jsp").forward(request, response);
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
