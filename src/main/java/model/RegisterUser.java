package model;

import java.io.Serializable;

public class RegisterUser implements Serializable {

	private String name;
	private String pass;

	public RegisterUser() {}

	public RegisterUser(String name) {
		this.name = name;
	}

	public RegisterUser(String name, String pass) {
		this.name = name;
		this.pass = pass;
	}

	public String getName() {
		return name;
	}

	public String getPass() {
		return pass;
	}




}
