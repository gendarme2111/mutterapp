package model;

import DAO.UserDAO;

public class LoginLogic {

	public User executeLogin(User user) {
		UserDAO dao = new UserDAO();
		return dao.findUser(user);
	}
}