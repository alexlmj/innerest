package com.innerest.common.user;

import java.util.List;
import java.util.Map;

import com.innerest.common.SearchVO;

public interface UserDao {
	public void insertUser(UserVO user);
	public UserVO selectUserById(String id);
	public UserVO selectUser(int num);
	public UserVO selectUserByEmail(String email);
	
	public void updateUserInfo(UserVO user);
	public void updateUserPassword(UserVO user);
	public void updateUserRole(UserVO user);
	public void deleteUser(int num);
	public List<UserVO> selectUserList();
	
	//Corporation
	public void insertCorporation(CorporationVO cor);
	public CorporationVO selectCorporation(int user_num);
	public void updateCorporation(Map<String, Object> map);
	
	//admin
	public int selectUserSearchCount(SearchVO search);
	public List<UserVO> selectUserSearchList(SearchVO search);
	public int selectUserSearchCount2(SearchVO search);
	public List<UserVO> selectUserSearchList2(SearchVO search);
}
