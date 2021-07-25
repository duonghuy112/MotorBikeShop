package com.tromic.persistence;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class User {
	private Integer id;
	private String username;
	private String password;
	private String fullName;
	private String email;
	private String phone;
	private Integer gender;
	private Date dob;
	private String avatar;
	private Integer isActive;
	private Integer isAdmin;
	private Date createDate;
	
	public User(String fullName, String username, String email, String password) {
		this.fullName = fullName;
		this.username = username;
		this.email = email;
		this.password = password;
	}
	
	
}
