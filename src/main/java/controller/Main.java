package controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Mutter;
import model.PostMutterLogic;
import model.SiteEV;
import model.TimeLogic;
import model.User;

@WebServlet("/Main")
public class Main extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		// メイン画面にフォワード
		RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response)
			throws ServletException, IOException {

		//ServletContextインスタンスを取得
		ServletContext application = this.getServletContext();
		//アプリケーションスコープからmutterListインスタンスを取得
		@SuppressWarnings("unchecked")
		List<Mutter> mutterList = (List<Mutter>) application.getAttribute("mutterList");

		// 取得できなかった場合は、つぶやきリストを新規作成して
		// アプリケーションスコープに保存
		if (mutterList == null) {
			mutterList = new ArrayList<Mutter>();
			application.setAttribute("mutterList", mutterList);
		}
		// ログインしているか確認するため
		// セッションスコープからユーザー情報を取得
		HttpSession session = request.getSession();
		User loginUser = (User) session.getAttribute("loginUser");
		if (loginUser == null) { // ログインしていない場合
			// リダイレクト
			response.sendRedirect("/login.jsp");
		} else { // ログイン済みの場合

			//アプリケーションスコープからsiteEVListインスタンスを取得
			@SuppressWarnings("unchecked")
			List<SiteEV> siteEVList = (List<SiteEV>) application.getAttribute("siteEVList");

			// 取得できなかった場合は、いいねリストを新規作成して
			// アプリケーションスコープに保存
			if (siteEVList == null) {
				siteEVList = new ArrayList<SiteEV>();
				application.setAttribute("siteEVList", siteEVList);
			}
			// リクエストパラメータの取得
			request.setCharacterEncoding("UTF-8");
			String text = escape(request.getParameter("text"));

			// 入力値チェック
			if (text != null && text.length() != 0) {

				//つぶやき時刻を計算
				TimeLogic tl = new TimeLogic();
				String time = tl.timeLogic();
				// つぶやきをつぶやきリストに追加
				Mutter mutter = new Mutter(loginUser.getName(), text, time);
				PostMutterLogic postMutterLogic = new PostMutterLogic();
				postMutterLogic.execute(mutter, mutterList);

				//SiteEVインスタンスを新規作成
				SiteEV siteEV = new SiteEV();

				//いいねリストの先頭にインスタンスを挿入
				siteEVList.add(0, siteEV);
				//アプリケーションスコープにいいねリストを保存
				application.setAttribute("siteEVList", siteEVList);

				// アプリケーションスコープにつぶやきリストを保存
				application.setAttribute("mutterList", mutterList);
			}
			// メイン画面にフォワード
			RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
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