package com.innerest.shop;

import java.util.List;

import com.innerest.admin.AdminOrderVO;
import com.innerest.common.SearchVO;

public interface CheckoutDao {

	void insertCheckout(CheckoutVO checkout);
	void insertCheckoutProduct(CheckoutProductVO cp);
	List<CheckoutProductVO> selectCheckoutProductList(Integer checkout_num);
	
	List<OrderVO> selectSearchOrderList(Integer num, SearchVO search);
	Integer selectSearchOrderCount(Integer num, SearchVO search);
	List<BizOrderVO> selectSearchBizOrderList(Integer cor_num, SearchVO search);
	Integer selectSearchBizOrderCount(Integer cor_num, SearchVO search);
	
	
	void updateCheckoutState(Integer num, String s);
	List<AdminOrderVO> selectCheckoutSearchList(SearchVO search);
	int selectCheckoutSearchCount();
	void updateReviewFlagY(Integer checkout_num);

}
