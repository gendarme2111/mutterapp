package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.CheckLogic;
import model.LoginLogic;
import model.User;

@WebServlet("/Login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		String pass = request.getParameter("pass");

		CheckLogic ck = new CheckLogic();
		String nameErr = ck.nameCheck(name);
		String passErr = ck.passCheck(pass);

		if ((nameErr == null && passErr == null) || (nameErr.length() == 0 && passErr.length() == 0)) {

			LoginLogic loginLogic = new LoginLogic();
			User user = new User(name,pass);
			User loginUser = loginLogic.executeLogin(user);

			if(loginUser !=null) {

				HttpSession session = request.getSession();
			    session.setAttribute("loginUser",loginUser);

				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/loginResult.jsp");
				dispatcher.forward(request, response);

			}else {
				String loginErr ="ユーザ名または名前が正しくありません";
				request.setAttribute("loginErr",loginErr);
				request.setAttribute("nameErr", "");
				request.setAttribute("passErr", "");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
				dispatcher.forward(request, response);
			}

		} else {
			request.setAttribute("loginErr", "");
			request.setAttribute("nameErr", nameErr);
			request.setAttribute("passErr", passErr);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
			dispatcher.forward(request, response);
		}
	}
}
