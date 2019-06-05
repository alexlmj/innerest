package com.innerest.shop;

import java.util.List;

import com.innerest.common.PageVO;

public interface ReviewDao {

	void insertReview(ReviewVO review);

	int selectReviewCount(Integer num);

	List<ReviewVO> selectReviewList(Integer num, PageVO page);

}
