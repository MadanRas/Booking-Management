package com.journal.AdminPOJO;

public class AdminPOJO {

	public AdminPOJO() {
		super();
		// TODO Auto-generated constructor stub
	}

	private int id;
	private String password;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public AdminPOJO(int id, String password) {
		super();
		this.id = id;
		this.password = password;
	}
}
