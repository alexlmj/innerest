package com.innerest.mypage.impl;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.innerest.mypage.DeliveryDao;
import com.innerest.mypage.DeliveryVO;

@Repository
public class DeliveryDaoImpl implements DeliveryDao{
	
	public static final String ns = "delivery";
	@Inject
	private SqlSession session;
	
	@Override
	public void insertDelivery(DeliveryVO del) {
		session.insert(ns+".insertDelivery", del);
	}

	@Override
	public List<DeliveryVO> getDeliveryList(Integer checkout_num) {
		return session.selectList(ns+".getDeliveryList", checkout_num);
	}

}
