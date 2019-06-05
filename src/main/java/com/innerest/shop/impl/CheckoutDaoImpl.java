package com.innerest.shop.impl;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.innerest.admin.AdminOrderVO;
import com.innerest.common.SearchVO;
import com.innerest.shop.BizOrderVO;
import com.innerest.shop.CheckoutDao;
import com.innerest.shop.CheckoutProductVO;
import com.innerest.shop.CheckoutVO;
import com.innerest.shop.OrderVO;

@Repository
public class CheckoutDaoImpl implements CheckoutDao {

	public static final String ns = "checkout";
	
	@Inject
	private SqlSession session;
	
	@Override
	public void insertCheckout(CheckoutVO checkout) {
		session.insert(ns+".insertCheckout", checkout);
	}

	@Override
	public void insertCheckoutProduct(CheckoutProductVO cp) {
		session.insert(ns+".insertCheckoutProduct", cp);		
	}

	@Override
	public List<CheckoutProductVO> selectCheckoutProductList(Integer checkout_num) {
		return session.selectList(ns+".selectCheckoutProductList", checkout_num);
	}

	@Override
	public List<OrderVO> selectSearchOrderList(Integer num, SearchVO search) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("num", num);
		map.put("search", search);
		return session.selectList(ns+".selectSearchOrderList", map);
	}
	
	public Integer selectSearchOrderCount(Integer num, SearchVO search) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("num", num);
		map.put("search", search);
		return session.selectOne(ns+".selectSearchOrderCount", map);
	}

	@Override
	public List<BizOrderVO> selectSearchBizOrderList(Integer cor_num, SearchVO search) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("cor_num", cor_num);
		map.put("search", search);
		return session.selectList(ns+".selectSearchBizOrderList", map);
	}
	
	public Integer selectSearchBizOrderCount(Integer cor_num, SearchVO search) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("cor_num", cor_num);
		map.put("search", search);
		return session.selectOne(ns+".selectSearchBizOrderCount", map);
	}

	@Override
	public void updateCheckoutState(Integer num, String s) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("num", num);
		map.put("state", s);
		session.update(ns+".updateCheckoutState", map);
	}

	@Override
	public List<AdminOrderVO> selectCheckoutSearchList(SearchVO search) {
		return session.selectList(ns+".selectCheckoutSearchList", search);
	}

	@Override
	public int selectCheckoutSearchCount() {
		return session.selectOne(ns+".selectCheckoutSearchCount");
	}

	@Override
	public void updateReviewFlagY(Integer checkout_num) {
		session.update(ns+".updateReviewFlagY", checkout_num);
	}

}
