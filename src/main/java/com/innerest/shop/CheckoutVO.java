package com.innerest.shop;

import java.util.Date;
import java.util.List;

public class CheckoutVO {
	private Integer num;
	private Integer user_num;
	private Float price;
	private String state;
	private Date regdate;
	private String name;
	private String zip;
	private String addr;
	private String addr_detail;
	private String email;
	private String phone;
	private String memo;
	private String review_flag;
	
	private List<CheckoutProductVO> cpList;
	
	public List<CheckoutProductVO> getCpList() {
		return cpList;
	}
	public void setCpList(List<CheckoutProductVO> cpList) {
		this.cpList = cpList;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	public Integer getUser_num() {
		return user_num;
	}
	public void setUser_num(Integer user_num) {
		this.user_num = user_num;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddr_detail() {
		return addr_detail;
	}
	public void setAddr_detail(String addr_detail) {
		this.addr_detail = addr_detail;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getReview_flag() {
		return review_flag;
	}
	public void setReview_flag(String review_flag) {
		this.review_flag = review_flag;
	}
}
