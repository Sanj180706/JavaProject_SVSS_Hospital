/*package com.project.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Login 
{
	private String id;	//foreign key, consists eid and pid
	private String role;
	@Id
	private String username;	//primary key
	private String password;
	
	Login(){}
	
	public Login(String id, String role, String username, String password) 
	{
		super();
		this.id = id;
		this.role=role;
		this.username = username;
		this.password = password;
	}
	
	public String getId() {
		return id;
	}
	public String getRole() {
		return role;
	}
	public String getUsername() {
		return username;
	}
	public String getPassword() {
		return password;
	}

	@Override
	public String toString() {
		return "Login [id=" + id + ", role=" + role + ", username=" + username + ", password=" + password + "]";
	}
		
}*/






package com.project.entity;

import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class Login 
{
	private String id;	//foreign key, consists eid and pid
	private String role;
	@Id
	private String username;	//primary key
	private String password;
	
	Login(){}
	
	public Login(String id, String role, String username, String password) 
	{
		super();
		this.id = id;
		this.role=role;
		this.username = username;
		this.password = password;
	}

	// Facade method to authenticate a user
	public boolean authenticate(String password) {
		// Here you can implement the authentication logic
		// For simplicity, let's assume the password is correct if it's not null or empty
		return password != null && !password.isEmpty();
	}

	// Facade method to change user password
	public void changePassword(String newPassword) {
		// Here you can implement the logic to change the password
		this.password = newPassword;
	}

	// Other facade methods related to login management can be added here

	public String getId() {
		return id;
	}
	public String getRole() {
		return role;
	}
	public String getUsername() {
		return username;
	}
	public String getPassword() {
		return password;
	}

	@Override
	public String toString() {
		return "Login [id=" + id + ", role=" + role + ", username=" + username + ", password=" + password + "]";
	}
		
}

