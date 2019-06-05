package com.innerest.document.web;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.innerest.document.DocumentVO;
import com.innerest.document.impl.DocumentSrv;

@RequestMapping("document")
@Controller
public class DocumentController {

	/** The usual Logger.*/
	private static final Logger logger = LoggerFactory.getLogger(DocumentController.class);

	@Inject
	private DocumentSrv documentSrv;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String index() {
		return "document/document_index";
	}
	
	@ResponseBody
	@RequestMapping(value = "", method = RequestMethod.POST)
	public String applyDocument(DocumentVO document, HttpSession session) {
		Integer num = (Integer)session.getAttribute("num");
		if(num == null) {
			//로그인필요
			return "fail";
		}
		
		String role = (String)session.getAttribute("role");
		if(!role.equals("C")) {
			return "fail";
		}
		document.setUser_num(num);
		documentSrv.applyDocument(document);
		return "success";
	}
}
