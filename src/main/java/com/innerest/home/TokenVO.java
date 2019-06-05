package com.innerest.home;

import java.util.Date;

public class TokenVO {
	private String emailtoken;
	private int user_num;
	private Date expiredate;
	public String getEmailtoken() {
		return emailtoken;
	}
	public void setEmailtoken(String emailtoken) {
		this.emailtoken = emailtoken;
	}
	public int getUser_num() {
		return user_num;
	}
	public void setUser_num(int user_num) {
		this.user_num = user_num;
	}
	public Date getExpiredate() {
		return expiredate;
	}
	public void setExpiredate(Date expiredate) {
		this.expiredate = expiredate;
	}
}
