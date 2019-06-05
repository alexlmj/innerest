package com.innerest.home.impl;
import java.io.IOException;
import java.util.Date;
import java.util.UUID;

import javax.inject.Inject;

import org.apache.commons.mail.EmailException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.innerest.common.SimpleEmail;
import com.innerest.common.user.UserDao;
import com.innerest.common.user.UserVO;
import com.innerest.home.LoginVO;
import com.innerest.home.TokenDao;
import com.innerest.home.TokenVO;
import com.innerest.shop.CartDao;

@Service
public class HomeSrv {
	
	@Inject
	private UserDao userDao;
	@Inject
	private TokenDao tokenDao;
	@Inject
	private CartDao cartDao;
	
	public UserVO getUser(String id) {
		return userDao.selectUserById(id);
	}
	
	public UserVO getUserByEmail(String email) {
		return userDao.selectUserByEmail(email);
	}
	
	/*
	 * 회원가입
	 * 중복시, return false
	 * */
	public boolean regist(UserVO user) {
		if(!isIdDuplicated(user.getId())) {
			userDao.insertUser(user);
			return true;
		}
		return false;
	}
	
	public boolean isIdDuplicated(String id) {
		UserVO user = userDao.selectUserById(id);
		if(user == null) {
			return false;
		}
		return true;
	}
	
	/*로그인*/
	public UserVO login(LoginVO login) {
		UserVO user = userDao.selectUserById(login.getId());
		if(user == null || !user.getPw().equals(login.getPw())) {
			return null;
		}
		return user;
	}
	
	/*토큰저장*/
	public boolean sendEamilTofindIdPw(String email) {
		UserVO user = userDao.selectUserByEmail(email);
		
		if(user == null) {
			return false;
		}
		
		String uuid = UUID.randomUUID().toString();
		TokenVO token = new TokenVO();
		token.setEmailtoken(uuid);
		token.setUser_num(user.getNum());
		
		tokenDao.insertToken(token);
		
		//send Email logic
		try {
			SimpleEmail.sendWithHtml(user, uuid);
			return true;
		} catch (EmailException e) {
			e.printStackTrace();
			return false;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}
	}
	
	/*패스워드변경*/
	@Transactional
	public boolean modifyPw(String token, String pw) {
		TokenVO tokenVo = tokenDao.selectToken(token);
		
		if(tokenVo == null) {
			return false;
		}
		Date expireDate = tokenVo.getExpiredate();
		Date curDate = new Date();
		
		if(expireDate.compareTo(curDate) < 0) {
			return false;
		}
		
		UserVO user = new UserVO();
		user.setPw(pw);
		user.setNum(tokenVo.getUser_num());
		userDao.updateUserPassword(user);
		tokenDao.deleteToken(token);
		return true;
	}

	public int getCart(int num) {
		return cartDao.selectCartCount(num);
	}
}
