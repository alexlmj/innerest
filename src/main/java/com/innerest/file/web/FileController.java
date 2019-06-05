package com.innerest.file.web;

import java.io.IOException;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.innerest.file.FileVO;
import com.innerest.file.impl.FileSrv;

@RequestMapping("/file")
@Controller
public class FileController {

	/** The usual Logger.*/
	private static final Logger logger = LoggerFactory.getLogger(FileController.class);
	
	@Inject
	private FileSrv fileSrv;
	
	@ResponseBody
	@RequestMapping(value = "/display/{num}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> display(@PathVariable("num") Integer num, Model model) {
		
		HttpHeaders headers = new HttpHeaders();
		headers.add(HttpHeaders.CONTENT_TYPE, "images/jpg");
		
		byte[] data = null;
		
		try {
			data = fileSrv.getFileData(num);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return ResponseEntity.ok().headers(headers).body(data);
	}
	
	@ResponseBody
	@RequestMapping(value = "/display/s/{num}", method = RequestMethod.GET)
	public ResponseEntity<byte[]> displayThumbnail(@PathVariable("num") Integer num, Model model) {
		
		HttpHeaders headers = new HttpHeaders();
		headers.add(HttpHeaders.CONTENT_TYPE, "images/jpg");
		
		byte[] data = null;
		
		try {
			data = fileSrv.getFileData(num);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return ResponseEntity.ok().headers(headers).body(data);
	}
	
	
	/*@ResponseBody
	@RequestMapping(value = "/delete/{id}", method = RequestMethod.GET)
	public ResponseEntity<String> delete(@PathVariable("id") String id, HttpSession session, Model model) {
		
		Integer user_num = (Integer)session.getAttribute("num");
		if(user_num == null) {
			return ResponseEntity.badRequest().body("fail");
		}
		fileSrv.deleteFile(id);
		
		return ResponseEntity.ok().headers(headers).body(data);
	}*/
	
}
