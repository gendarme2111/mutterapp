package model;

import DAO.UserDAO;

public class RegisterLogic {

	public boolean executeRegister(String name, String pass) {
		UserDAO dao = new UserDAO();
		boolean result = dao.findSameNameUser(name);
		if (!result) {
			return false;
		} else {

			boolean flag = dao.createUser(name, pass);
			return flag;
		}
	}
}
