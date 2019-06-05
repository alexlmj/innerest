package com.innerest.shop;

import java.util.Date;

public class ReviewVO {
	private Integer num;
	private Integer product_num;
	private Integer user_num;
	private String id;
	private String content;
	private Date regdate;
	
	private Integer checkout_num;
	
	public Integer getCheckout_num() {
		return checkout_num;
	}
	public void setCheckout_num(Integer checkout_num) {
		this.checkout_num = checkout_num;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Integer getProduct_num() {
		return product_num;
	}
	public void setProduct_num(Integer product_num) {
		this.product_num = product_num;
	}
	public Integer getUser_num() {
		return user_num;
	}
	public void setUser_num(Integer user_num) {
		this.user_num = user_num;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}
