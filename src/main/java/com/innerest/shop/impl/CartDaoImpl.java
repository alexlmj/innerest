package com.innerest.shop.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.innerest.shop.CartDao;
import com.innerest.shop.CartVO;

@Repository
public class CartDaoImpl implements CartDao{

	public static final String ns = "cart";
	@Inject
	private SqlSession session;
	
	@Override
	public void insertCart(CartVO cart) {
		session.insert(ns+".insertCart", cart);
	}

	@Override
	public CartVO getCart(CartVO cart) {
		return session.selectOne(ns+".selectCart", cart);
	}

	@Override
	public void updateCartQuantity(CartVO cart) {
		session.update(ns+".updateCartQuantity", cart);
	}

	@Override
	public void deleteCart(Integer user_num) {
		session.delete(ns+".deleteCart", user_num);
	}

	@Override
	public List<CartVO> selectCartList(Integer user_num) {
		return session.selectList(ns+".selectCartList", user_num);
	}

	@Override
	public Integer selectCartCount(Integer user_num) {
		return session.selectOne(ns+".selectCartCount", user_num);
	}

}
