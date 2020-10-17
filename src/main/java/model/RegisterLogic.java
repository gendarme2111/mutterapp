package model;

import DAO.UserDAO;

public class RegisterLogic {

	public boolean executeRegister(String name, String hashedPass) {
		UserDAO dao = new UserDAO();
		boolean result = dao.findSameNameUser(name);
		if (!result) {
			return false;
		} else {

			boolean flag = dao.createUser(name, hashedPass);
			return flag;
		}
	}
}
