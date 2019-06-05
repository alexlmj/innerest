package com.innerest.document;

import java.util.List;
import java.util.Map;

import com.innerest.admin.AdminDocumentVO;
import com.innerest.common.SearchVO;

public interface DocumentDao {
	public void insertDocument(DocumentVO document);
	public DocumentVO selectDocument(int num);
	public List<DocumentVO> selectDocumentList(Map map);
	
	//admin
	public void deleteDocument(int num);
	public int selectCountForDocument(Integer num, SearchVO search);
	public int selectDocumentCountAll(SearchVO search);
	public List<AdminDocumentVO> selectDocumentListAll(SearchVO search);
	public void insertExDocAndPrice(DocumentVO doc);
}
