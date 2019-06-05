package com.innerest.shop;

import java.util.Date;

public class CartVO {
	private Integer user_num;
	private Integer pd_num;
	private Date regdate;
	private Integer quantity;
	
	private String name; //상품명
	private String pd_name; //옵션이름
	private String pd_price; //가격
	private Integer file_num1;
	
	public Integer getFile_num1() {
		return file_num1;
	}
	public void setFile_num1(Integer file_num1) {
		this.file_num1 = file_num1;
	}
	public String getPd_price() {
		return pd_price;
	}
	public void setPd_price(String pd_price) {
		this.pd_price = pd_price;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
	public Integer getUser_num() {
		return user_num;
	}
	public void setUser_num(Integer user_num) {
		this.user_num = user_num;
	}
	public Integer getPd_num() {
		return pd_num;
	}
	public void setPd_num(Integer pd_num) {
		this.pd_num = pd_num;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
}
