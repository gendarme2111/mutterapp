package model;

public class CheckLogic {
	public String nameCheck(String name) {

		if (name == null || name.length()==0) {
			return "ユーザ名が入力されていません";
		} else {

			boolean flag = name.matches("^[0-9a-zA-Z]*$");

			if (!flag) {
				return "ユーザ名は半角英数字で入力してください";
			} else {
				return "";
			}
		}

	}

	public String passCheck(String pass) {

		if (pass == null || pass.length()==0) {
			return "パスワードが入力されていません";
		} else {

			boolean flag = pass.matches("^[0-9a-zA-Z]*$");

			if (!flag) {
				return "パスワードは半角英数字で入力してください";
			} else {
				return "";
			}
		}

	}

}