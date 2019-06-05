package com.innerest.mypage;

import java.util.List;

public interface DeliveryDao {

	void insertDelivery(DeliveryVO del);

	List<DeliveryVO> getDeliveryList(Integer checkout_num);
	
}
