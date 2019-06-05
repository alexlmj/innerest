package com.innerest.shop.impl;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.innerest.common.PageVO;
import com.innerest.shop.ReviewDao;
import com.innerest.shop.ReviewVO;

@Repository
public class ReviewDaoImpl implements ReviewDao {
	public static final String ns = "review";
	@Inject
	private SqlSession session;
	
	@Override
	public void insertReview(ReviewVO review) {
		session.insert(ns+".insertReview", review);
	}

	@Override
	public int selectReviewCount(Integer product_num) {
		return session.selectOne(ns+".selectReviewCount", product_num);
	}

	@Override
	public List<ReviewVO> selectReviewList(Integer num, PageVO page) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("product_num", num);
		map.put("page",  page);
		return session.selectList(ns+".selectReviewList", map);
	}

}
