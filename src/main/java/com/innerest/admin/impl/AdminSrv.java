package com.innerest.admin.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.innerest.admin.AdminDocumentVO;
import com.innerest.admin.AdminOrderVO;
import com.innerest.common.SearchVO;
import com.innerest.common.enums.CheckoutState;
import com.innerest.common.user.UserDao;
import com.innerest.common.user.UserVO;
import com.innerest.document.DocumentDao;
import com.innerest.shop.CheckoutDao;

@Service
public class AdminSrv {

	@Inject
	private CheckoutDao checkoutDao;
	@Inject
	private UserDao userDao;
	@Inject
	private DocumentDao docDao;
	
	public List<AdminOrderVO> getCheckoutList(SearchVO search) {
		int count = checkoutDao.selectCheckoutSearchCount();
		search.setTotalRecordNum(count);
		return checkoutDao.selectCheckoutSearchList(search);
	}


	public void changeOrderStatePayOkIfMoneyChecked(int num) {
		checkoutDao.updateCheckoutState(num, CheckoutState.PAY_OK.toString());
	}


	public List<UserVO> getUserList(SearchVO search) {
		search.setGroupSize(5);
		int count = userDao.selectUserSearchCount(search);
		search.setTotalRecordNum(count);
		List<UserVO> uList = userDao.selectUserSearchList(search);
		return uList;
	}

	public void updateUserRoleToCorporation(Integer num) {
		UserVO user = new UserVO();
		user.setNum(num);
		user.setRole("C");
		userDao.updateUserRole(user);
	}


	public List<UserVO> getUpgradeUserList(SearchVO search) {
		search.setGroupSize(5);
		int count = userDao.selectUserSearchCount2(search);
		search.setTotalRecordNum(count);
		List<UserVO> uList = userDao.selectUserSearchList2(search);
		return uList;
	}

	public List<AdminDocumentVO> getDocumentListAll(SearchVO search) {
		search.setGroupSize(5);
		search.setTotalRecordNum(docDao.selectDocumentCountAll(search));
		return docDao.selectDocumentListAll(search);
	}
	
}
