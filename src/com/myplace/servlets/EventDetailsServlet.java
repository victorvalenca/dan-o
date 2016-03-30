package com.myplace.servlets;

import java.io.IOException;
import java.util.Locale;
import java.util.ResourceBundle;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class EventDetailsServlet extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EventDetailsServlet() {
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

		String param_no = request.getParameter("param_no");
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

		request.setAttribute("eventInfo", rb.getString("ed.eventInfo"));
		request.setAttribute("eventDetails", rb.getString("ed.eventDetails"));
		request.setAttribute("editInfo", rb.getString("ed.editInfo"));
		request.setAttribute("going", rb.getString("ed.going"));
		request.setAttribute("interested", rb.getString("ed.interested"));
		request.setAttribute("ngoing", rb.getString("ed.ngoing"));
		request.setAttribute("evtPic", rb.getString("ed.chgEvtPic"));
		request.setAttribute("attending", rb.getString("ed.attending"));
		request.setAttribute("interestedI", rb.getString("ed.interestedI"));
		request.setAttribute("description", rb.getString("ed.description"));
		request.setAttribute("date", rb.getString("ed.dateAndTime"));

		// ================================================================================
		// End Internationalization
		// ================================================================================

		//TODO Database DAO
		
		request.getRequestDispatcher("Event/details.jsp?ID=" + param_no).forward(request, response);
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
