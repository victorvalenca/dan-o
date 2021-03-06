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
public class UserProfileServlet extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UserProfileServlet() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String ID = Integer.toString((int) request.getSession().getAttribute("UserID"));

		// ================================================================================
		// Internationalization
		// ================================================================================

		String language = (String) request.getSession().getAttribute("language");
		String country = (String) request.getSession().getAttribute("country");
		Locale locale;

		if ( language != null && (language.equals("fr") && country.equals("FR"))) {
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
		request.setAttribute("attending", rb.getString("up.attending"));
		request.setAttribute("interested", rb.getString("up.interested"));
		request.setAttribute("attended", rb.getString("up.attended"));

		request.setAttribute("hosted", rb.getString("ed.hosted"));
		request.setAttribute("date", rb.getString("ed.dateAndTime"));

		// ================================================================================
		// End Internationalization
		// ================================================================================

		//TODO Database DAO

		if (ID == null) {
			request.getRequestDispatcher("User/profile.jsp?ID=" + request.getSession().getAttribute("UserID")).forward(request, response);
		} else {
			request.getRequestDispatcher("User/profile.jsp?ID=" + ID).forward(request, response);
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
