package com.innerest.shop;

import java.util.Date;
import java.util.List;

public class ProductVO {
	private Integer num;
	private Integer user_num;
	private String category;
	private String name;
	private String des;
	private Float price;
	private Integer file_num1;
	private Integer file_num2;
	private String tag;
	private Date regdate;

	private List<ProductDetailVO> pdList;
	
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	public List<ProductDetailVO> getPdList() {
		return pdList;
	}
	public void setPdList(List<ProductDetailVO> pdList) {
		this.pdList = pdList;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
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
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDes() {
		return des;
	}
	public void setDes(String des) {
		this.des = des;
	}
	public Float getPrice() {
		return price;
	}
	public void setPrice(Float price) {
		this.price = price;
	}
	public Integer getFile_num1() {
		return file_num1;
	}
	public void setFile_num1(Integer file_num1) {
		this.file_num1 = file_num1;
	}
	public Integer getFile_num2() {
		return file_num2;
	}
	public void setFile_num2(Integer file_num2) {
		this.file_num2 = file_num2;
	}
	@Override
	public String toString() {
		return "ProductVO [num=" + num + ", user_num=" + user_num + ", category=" + category + ", name=" + name + ", des=" + des + ", price=" + price
				+ ", file_num1=" + file_num1 + ", file_num2=" + file_num2 + "]";
	}
}
