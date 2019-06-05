package com.innerest.ajax.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.innerest.common.PageVO;
import com.innerest.document.DocumentDao;
import com.innerest.document.DocumentVO;
import com.innerest.shop.CartDao;
import com.innerest.shop.CartVO;
import com.innerest.shop.CheckoutDao;
import com.innerest.shop.ReviewDao;
import com.innerest.shop.ReviewVO;

@Service
public class AjaxSrv {
	@Inject
	private DocumentDao docDao;
	@Inject
	private CartDao cartDao;
	@Inject
	private ReviewDao reviewDao;
	@Inject
	private CheckoutDao checkoutDao;
	
	public void insertExDocAndPrice(List<DocumentVO> dList) {
		for(int i=0; i<dList.size();i++){
			docDao.insertExDocAndPrice(dList.get(i));	
		}
	}

	public void insertCart(List<CartVO> cartList) {
		for(CartVO cart : cartList) {
			CartVO c = cartDao.getCart(cart);
			if(c == null) {
				cartDao.insertCart(cart);	
				continue;
			}	
			cartDao.updateCartQuantity(cart);
		}
	}

	public void insertReview(ReviewVO review) {
		reviewDao.insertReview(review);
		checkoutDao.updateReviewFlagY(review.getCheckout_num());
	}

	public List<ReviewVO> getReviewList(Integer num, PageVO page) {
		page.setGroupSize(5);
		int count = reviewDao.selectReviewCount(num);
		page.setTotalRecordNum(count);
		List<ReviewVO> rList = reviewDao.selectReviewList(num, page);
		return rList;
	}
}
