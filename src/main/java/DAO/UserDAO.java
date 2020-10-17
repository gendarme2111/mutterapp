package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.mindrot.jbcrypt.BCrypt;

import model.User;

public class UserDAO {

	private final String JDBC_URL = "jdbc:mysql://us-cdbr-east-02.cleardb.com/heroku_f9df51be1dbd806?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
	private final String DB_USER = "b9201eff92bb81";
	private final String DB_PASS = "301dd190";
	private boolean flag;
	private String hashedPass;

	public boolean createUser(String name, String hashedPass) {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}
		// データベース接続
		try {
			Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);

			// INSERT文の準備(idは自動連番なので指定しなくてよい）
			String sql = "INSERT INTO MUTTER_USERS(NAME, PASSWORD) VALUES(?, ?)";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			// INSERT文中の「?」に使用する値を設定しSQLを完成
			pStmt.setString(1, name);
			pStmt.setString(2, hashedPass);

			// INSERT文を実行
			int result = pStmt.executeUpdate();

			if (result != 1) {
				this.flag = false;
			} else {
				this.flag = true;
			}

			conn.close();
			pStmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
			this.flag = false;
		}
		return flag;
	}

	public boolean findSameNameUser(String name) {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
		}

		try {
			Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);

			// SELECT文の準備(idは自動連番なので指定しなくてよい）
			// 入力されたユーザ名に対応するパスワードを抽出
			String sql = "SELECT * FROM MUTTER_USERS WHERE NAME = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			// INSERT文中の「?」に使用する値を設定しSQLを完成
			pStmt.setString(1, name);

			// INSERT文を実行
			ResultSet rs = pStmt.executeQuery();

			if (rs.next()) {

				//名前がデータベースに存在する場合
				//入力パスワードとデータベースのパスワードが一致するか確認
				this.flag = false;
			} else {
				this.flag = true;
			}

			conn.close();
			pStmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
			return this.flag = false;
		}
		return flag;
	}

	public User findUser(User user) {

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e1) {
			e1.printStackTrace();
			return null;
		}

		User findUser = null;

		try {
			Connection conn = DriverManager.getConnection(JDBC_URL, DB_USER, DB_PASS);

			// SELECT文の準備(idは自動連番なので指定しなくてよい）
			// 入力されたユーザ名に対応するパスワードを抽出
			String sql = "SELECT PASSWORD FROM MUTTER_USERS WHERE NAME = ?";
			PreparedStatement pStmt = conn.prepareStatement(sql);
			// INSERT文中の「?」に使用する値を設定しSQLを完成
			pStmt.setString(1, user.getName());

			// INSERT文を実行
			ResultSet rs = pStmt.executeQuery();

			while (rs.next()) {
				String hashedPass = rs.getString("password");
				this.hashedPass = hashedPass;
			}
			if (hashedPass!=null&&BCrypt.checkpw(user.getPass(), hashedPass)) {
				// 認証成功
				findUser = new User(user.getName());

			} else {
				// 認証失敗
				findUser = null;
			}
			conn.close();
			pStmt.close();

		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
		return findUser;
	}

}