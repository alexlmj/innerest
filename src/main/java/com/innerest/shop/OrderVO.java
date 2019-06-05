package com.innerest.shop;

import java.util.Date;

public class OrderVO {
	private Integer product_num;
	private Integer checkout_num;
	private String state;
	private Date regdate;
	private String review_flag;
	private Integer quantity;
	private String name;
	private String file;
	private String pd_name;
	private String pd_price;
	private String store_name;
	
	public Integer getProduct_num() {
		return product_num;
	}
	public void setProduct_num(Integer product_num) {
		this.product_num = product_num;
	}
	public Integer getCheckout_num() {
		return checkout_num;
	}
	public void setCheckout_num(Integer checkout_num) {
		this.checkout_num = checkout_num;
	}
	public String getFile() {
		return file;
	}
	public void setFile(String file) {
		this.file = file;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	public String getReview_flag() {
		return review_flag;
	}
	public void setReview_flag(String review_flag) {
		this.review_flag = review_flag;
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
	public String getStore_name() {
		return store_name;
	}
	public void setStore_name(String store_name) {
		this.store_name = store_name;
	}
}
