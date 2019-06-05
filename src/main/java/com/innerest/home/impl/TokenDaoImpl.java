package com.innerest.home.impl;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.innerest.home.TokenDao;
import com.innerest.home.TokenVO;

@Repository
public class TokenDaoImpl implements TokenDao{

	public static final String ns = "token";
	
	@Inject
	private SqlSession session;
	
	@Override
	public void insertToken(TokenVO token) {
		session.insert(ns+".insertToken", token);
	}

	@Override
	public TokenVO selectToken(String token) {
		return session.selectOne(ns+".selectToken", token);
	}

	@Override
	public void deleteToken(String token) {
		session.delete(ns+".deleteToken", token);
	}

	@Override
	public void deleteExpiredToken() {
		session.delete(ns+".deleteExpiredToken");
	}

}
