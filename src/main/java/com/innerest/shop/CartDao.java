package com.innerest.shop;

import java.util.List;

public interface CartDao {

	void insertCart(CartVO cart);
	CartVO getCart(CartVO cart);
	void updateCartQuantity(CartVO cart);
	void deleteCart(Integer user_num);
	List<CartVO> selectCartList(Integer num);
	Integer selectCartCount(Integer user_num);
}
