package com.innerest.file.impl;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.innerest.file.FileDao;
import com.innerest.file.FileVO;

@Repository
public class FileDaoImpl implements FileDao {

	public static final String ns = "file";
	@Inject
	private SqlSession session;
	
	@Override
	public void insertFile(FileVO file) {
		session.insert(ns+".insertFile", file);
	}

	@Override
	public FileVO selectFile(int num) {
		return session.selectOne(ns+".selectFile", num);
	}

}
