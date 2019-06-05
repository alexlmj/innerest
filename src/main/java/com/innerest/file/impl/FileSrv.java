package com.innerest.file.impl;

import java.io.File;
import java.io.IOException;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.commons.io.FileUtils;
import org.springframework.stereotype.Service;

import com.innerest.file.FileDao;
import com.innerest.file.FileVO;

@Service
public class FileSrv {
	
	@Inject
	private FileDao fileDao;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	public byte[] getFileData(Integer num) throws IOException {
		FileVO fileVO = fileDao.selectFile(num);
		File file = new File(uploadPath + File.separator + fileVO.getSaved_name().replaceFirst("s_", ""));
		if(!file.exists() || !file.isFile()) {
			return null;
		}
		return FileUtils.readFileToByteArray(file);
	}
	
	public byte[] getThumbnailFileData(Integer num) throws IOException {
		FileVO fileVO = fileDao.selectFile(num);
		
		File file = new File(uploadPath + File.separator + fileVO.getSaved_name());
		if(!file.exists() || !file.isFile()) {
			return null;
		}
		return FileUtils.readFileToByteArray(file);
	}
	

	public FileVO getFile(int num) {
		return fileDao.selectFile(num);
	}
}
