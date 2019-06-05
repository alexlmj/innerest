package com.innerest.common.user.impl;



import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.innerest.common.SearchVO;
import com.innerest.common.user.CorporationVO;
import com.innerest.common.user.UserDao;
import com.innerest.common.user.UserVO;

@Repository
public class UserDaoImpl implements UserDao{

	public static final String ns = "user";
	
	@Inject
	private SqlSession session;
	
	@Override
	public void insertUser(UserVO user) {
		session.insert(ns + ".insertUser", user);
	}

	@Override
	public UserVO selectUserById(String id) {
		return session.selectOne(ns + ".selectUserById", id);
	}

	@Override
	public UserVO selectUser(int num) {
		return session.selectOne(ns + ".selectUser", num);
	}

	@Override
	public UserVO selectUserByEmail(String email) {
		return session.selectOne(ns + ".selectUserByEmail", email);
	}

	@Override
	public void updateUserInfo(UserVO user) {
		session.update(ns+".updateUserInfo", user);
	}

	@Override
	public void updateUserPassword(UserVO user) {
		session.update(ns+".updateUserPassword", user);		
	}

	@Override
	public void updateUserRole(UserVO user) {
		session.update(ns+".updateUserRole", user);
	}
	
	@Override
	public void deleteUser(int num) {
		session.update(ns+".deleteUser", num);
	}

	@Override
	public List<UserVO> selectUserList() {
		return session.selectList(ns+".selectUserList");
	}

	@Override
	public void insertCorporation(CorporationVO cor) {
		session.insert(ns+".insertCorporation", cor);
	}

	@Override
	public CorporationVO selectCorporation(int user_num) {
		return session.selectOne(ns+".selectCorporation", user_num);
	}

	@Override
	public void updateCorporation(Map<String, Object> map) {
		session.update(ns+".updateCorporation", map);
	}

	@Override
	public int selectUserSearchCount(SearchVO search) {
		return session.selectOne(ns+".selectUserSearchCount", search);
	}

	@Override
	public List<UserVO> selectUserSearchList(SearchVO search) {
		return session.selectList(ns+".selectUserSearchList", search);
	}

	@Override
	public int selectUserSearchCount2(SearchVO search) {
		return session.selectOne(ns+".selectUserSearchCount2", search);
	}

	@Override
	public List<UserVO> selectUserSearchList2(SearchVO search) {
		return session.selectList(ns+".selectUserSearchList2", search);
	}
}
