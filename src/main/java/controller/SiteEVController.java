package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.SiteEV;
import model.SiteEVLogic;
import model.User;

@WebServlet("/SiteEVController")
public class SiteEVController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		ServletContext application = this.getServletContext();
		@SuppressWarnings("unchecked")
		List<SiteEV> siteEVList = (List<SiteEV>) application.getAttribute("siteEVList");

		request.setCharacterEncoding("UTF-8");
		String action = request.getParameter("action");
		int i = Integer.parseInt(request.getParameter("i"));

		SiteEV siteEV = (SiteEV) application.getAttribute("siteEV");

		HttpSession session = request.getSession();
		User loginUser = (User) session.getAttribute("loginUser");

		if (siteEV != null) {
			siteEV = new SiteEV();
		}

		SiteEVLogic siteEVLogic = new SiteEVLogic();

		if (action != null && action.equals("like")) {
			siteEVLogic.like(siteEVList.get(i),loginUser);

		} else if (action != null && action.equals("dislike")) {
			siteEVLogic.dislike(siteEVList.get(i),loginUser);
		}

		siteEVList.set(i, siteEVList.get(i));

		application.setAttribute("siteEVList", siteEVList);

		RequestDispatcher dispatcher = request
				.getRequestDispatcher("index.jsp");
		dispatcher.forward(request, response);
	}
}
