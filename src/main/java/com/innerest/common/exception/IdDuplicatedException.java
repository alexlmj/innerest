package com.innerest.common.exception;

public class IdDuplicatedException extends RuntimeException{

	@Override
	public String getMessage() {
		return "ID중복";
	}
	
}
