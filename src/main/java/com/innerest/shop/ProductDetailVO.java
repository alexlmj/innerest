package com.innerest.shop;

public class ProductDetailVO {
	private Integer pd_num;
	private Integer product_num;
	private String pd_name;
	private Float pd_price;
	private Integer pd_inven;
	
	private ProductVO product;
	
	public ProductVO getProduct() {
		return product;
	}
	public void setProduct(ProductVO product) {
		this.product = product;
	}
	public Integer getPd_num() {
		return pd_num;
	}
	public void setPd_num(Integer pd_num) {
		this.pd_num = pd_num;
	}
	public Integer getProduct_num() {
		return product_num;
	}
	public void setProduct_num(Integer product_num) {
		this.product_num = product_num;
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
	public Integer getPd_inven() {
		return pd_inven;
	}
	public void setPd_inven(Integer pd_inven) {
		this.pd_inven = pd_inven;
	}
	@Override
	public String toString() {
		return "ProductDetailVO [pd_num=" + pd_num + ", product_num=" + product_num + ", pd_name=" + pd_name + ", pd_price=" + pd_price
				+ ", pd_inven=" + pd_inven + "]";
	}
	
}
