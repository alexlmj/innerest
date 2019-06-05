package com.innerest.admin;

import java.util.Date;

public class AdminOrderVO {
	private Integer checkout_num;
	private Date regdate;
	private Integer file_num;
	private String product_name; //
	private String pd_name;
	private Float pd_price;
	private Integer quantity;
	private String name; //주문자 이름
	private String store_name;
	private String state;
	
	public Integer getCheckout_num() {
		return checkout_num;
	}
	public void setCheckout_num(Integer checkout_num) {
		this.checkout_num = checkout_num;
	}
	public Integer getFile_num() {
		return file_num;
	}
	public void setFile_num(Integer file_num) {
		this.file_num = file_num;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getPd_name() {
		return pd_name;
	}
	public void setPd_name(String pd_name) {
		this.pd_name = pd_name;
	}
	public Float getPd_price() {
		return pd_price;
	}
	public void setPd_price(Float pd_price) {
		this.pd_price = pd_price;
	}
	public Integer getQuantity() {
		return quantity;
	}
	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	
}
