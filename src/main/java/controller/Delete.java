package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Mutter;
import model.SiteEV;

@WebServlet("/Delete")
public class Delete extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		ServletContext application = this.getServletContext();
		@SuppressWarnings("unchecked")
		List<Mutter> mutterList = (List<Mutter>) application.getAttribute("mutterList");
		@SuppressWarnings("unchecked")
		List<SiteEV> siteEVList = (List<SiteEV>) application.getAttribute("siteEVList");

		request.setCharacterEncoding("UTF-8");
		int i = Integer.parseInt(request.getParameter("num"));

		if(mutterList!=null&&siteEVList!=null) {

		mutterList.remove(i);
		siteEVList.remove(i);

		application.setAttribute("siteEVList", siteEVList);
		application.setAttribute("mutterList", mutterList);
		}
		response.sendRedirect("index.jsp");
	}

}