package com.innerest.document.impl;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.innerest.document.DocumentDao;
import com.innerest.document.DocumentVO;

@Service
public class DocumentSrv {

	@Inject
	private DocumentDao documentDao;
	
	public void applyDocument(DocumentVO document) {
		documentDao.insertDocument(document);
	}
	
}
