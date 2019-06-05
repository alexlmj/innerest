package com.innerest.shop;

import java.util.Date;

public class BizOrderVO {
	private Integer checkout_num; // 주문서번호
	private Date regdate; //주문일
	private Integer file; //작은 이미지 파일 번호
	private String name; //상품명
	private String pd_name; //옵션명
	private String pd_price; //상품 가격
	private Integer quantity; // 주문수량
	private String id; //주문자 아이디
	private String state; //주문상태
	private Integer user_num; //주문자 번호
	public Integer getCheckout_num() {
		return checkout_num;
	}
	public void setCheckout_num(Integer checkout_num) {
		this.checkout_num = checkout_num;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public Integer getFile() {
		return file;
	}
	public void setFile(Integer file) {
		this.file = file;
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
	public String getPd_price() {
		return pd_price;
	}
	public void setPd_price(String pd_price) {
		this.pd_price = pd_price;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Integer getUser_num() {
		return user_num;
	}
	public void setUser_num(Integer user_num) {
		this.user_num = user_num;
	}
}
