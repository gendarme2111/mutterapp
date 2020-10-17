package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.mindrot.jbcrypt.BCrypt;

import model.CheckLogic;
import model.RegisterLogic;

@WebServlet("/Register")
public class RegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		RequestDispatcher dispatcher = request.getRequestDispatcher("/register.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		String name = escape(request.getParameter("name"));
		String pass = escape(request.getParameter("pass"));

		CheckLogic ck = new CheckLogic();
		String nameErr = ck.nameCheck(name);
		String passErr = ck.passCheck(pass);

		if ((nameErr == null && passErr == null) || (nameErr.length() == 0 && passErr.length() == 0)) {

			RegisterLogic registerLogic = new RegisterLogic();
			String hashedPass = BCrypt.hashpw(pass, BCrypt.gensalt());
			boolean flag = registerLogic.executeRegister(name,hashedPass);

			if(flag) {

				request.setAttribute("name", name);
				RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/jsp/registerResult.jsp");
				dispatcher.forward(request, response);
			}else {
				String registerErr ="入力した名前は既に登録されています";
				request.setAttribute("registerErr", registerErr);
				request.setAttribute("nameErr", "");
				request.setAttribute("passErr", "");
				RequestDispatcher dispatcher = request.getRequestDispatcher("/register.jsp");
				dispatcher.forward(request, response);
			}

		} else {
			request.setAttribute("registerErr", "");
			request.setAttribute("nameErr", nameErr);
			request.setAttribute("passErr", passErr);
			RequestDispatcher dispatcher = request.getRequestDispatcher("/register.jsp");
			dispatcher.forward(request, response);
		}
	}
	//エスケープ処理
		private static String escape(String val) {
			if (val == null)
				return "";
			val = val.replaceAll("&", "& amp;");
			val = val.replaceAll("<", "& lt;");
			val = val.replaceAll(">", "& gt;");
			val = val.replaceAll("\"", "&quot;");
			val = val.replaceAll("'", "&apos;");
			return val;
}
}