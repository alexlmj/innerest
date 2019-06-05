package com.innerest.home;

public interface TokenDao {
	public void insertToken(TokenVO token);
	public TokenVO selectToken(String token);
	public void deleteToken(String token);
	public void deleteExpiredToken();
}
