package com.innerest.shop;

public class CheckoutProductVO {
	private int checkout_num;
	private int pd_num;
	private int quantity;
	
	private ProductDetailVO option;

	public int getCheckout_num() {
		return checkout_num;
	}

	public void setCheckout_num(int checkout_num) {
		this.checkout_num = checkout_num;
	}

	public int getPd_num() {
		return pd_num;
	}

	public void setPd_num(int pd_num) {
		this.pd_num = pd_num;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public ProductDetailVO getOption() {
		return option;
	}

	public void setOption(ProductDetailVO option) {
		this.option = option;
	}

	@Override
	public String toString() {
		return "CheckoutProductVO [checkout_num=" + checkout_num + ", pd_num=" + pd_num + ", quantity=" + quantity + ", option=" + option + "]";
	}
	
	

}
