package com.innerest.common.enums;

public enum CheckoutState {
	PAY_ING("입금대기"), PAY_OK("입금완료"), DEL_ING("배송중"), OK("구매완료");
	
	private String des;
	
	CheckoutState(String des){
		this.des = des;
	}

	public String getDes() {
		return des;
	}

	public void setDes(String des) {
		this.des = des;
	}
}
