package com.innerest.document.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.innerest.admin.AdminDocumentVO;
import com.innerest.ajax.AjaxDocVO;
import com.innerest.common.SearchVO;
import com.innerest.document.DocumentDao;
import com.innerest.document.DocumentVO;

@Repository
public class DocumentDaoImpl implements DocumentDao{

	private static final String ns = "document";
	
	@Inject
	private SqlSession session;
	
	@Override
	public void insertDocument(DocumentVO document) {
		session.insert(ns+".insertDocument", document);
	}

	@Override
	public DocumentVO selectDocument(int num) {
		return session.selectOne(ns+".selectDocument", num);
	}

	@Override
	public void deleteDocument(int num) {
		session.delete(ns+".deleteDocument", num);
	}

	@Override
	public List<DocumentVO> selectDocumentList(Map map) {
		return session.selectList(ns+".selectDocumentList",map);
	}

	@Override
	public int selectCountForDocument(Integer num, SearchVO search) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("user_num", num);
		map.put("search", search);
		return session.selectOne(ns+".selectCountForDocument", map);
	}

	@Override
	public int selectDocumentCountAll(SearchVO search) {
		return session.selectOne(ns+".selectDocumentCountAll", search);
	}

	@Override
	public List<AdminDocumentVO> selectDocumentListAll(SearchVO search) {
		return session.selectList(ns+".selectDocumentListAll", search);
	}

	@Override
	public void insertExDocAndPrice(DocumentVO doc) {
		session.update(ns+".insertExDocAndPrice", doc);
	}

}
