package com.innerest.common.enums;

public enum UserRole {
	A("관리자"), C("기업"), P("개인"), U("기업심사회중인회원");
	String des;
	
	UserRole(String des) {
		this.des = des;
	}
	
}
