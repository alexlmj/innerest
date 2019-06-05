package com.innerest.ajax.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.innerest.ajax.impl.AjaxSrv;
import com.innerest.common.PageVO;
import com.innerest.document.DocumentVO;
import com.innerest.shop.CartVO;
import com.innerest.shop.ReviewVO;

@RequestMapping("/ajax")
@Controller
public class AjaxController {

	/** The usual Logger. */
	private static final Logger logger = LoggerFactory.getLogger(AjaxController.class);

	@Inject
	private AjaxSrv ajaxSrv;
	
	
	@ResponseBody
	@RequestMapping(value = "/document", method = RequestMethod.POST)
	public String upgradeCor(@RequestBody List<DocumentVO> dList) {
		if(dList == null) {
			return "fail";
		}
		ajaxSrv.insertExDocAndPrice(dList);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping(value = "/cart/create", method = RequestMethod.POST)
	public String addCart(@RequestBody List<CartVO> cartList, HttpSession session) {
		Integer num = (Integer)session.getAttribute("num");
		if(num == null) {
			return "fail";
		}
		
		for(CartVO c : cartList) {
			c.setUser_num(num);
		}

		ajaxSrv.insertCart(cartList);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping(value = "/review/", method = RequestMethod.POST)
	public String addCart(@RequestBody ReviewVO review, HttpSession session) {
		Integer num = (Integer)session.getAttribute("num");
		if(num == null) {
			return "fail";
		}
		String id = (String)session.getAttribute("id");
		review.setUser_num(num);
		review.setId(id);
		
		ajaxSrv.insertReview(review);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping(value = "/review/{num}", method = RequestMethod.POST)
	public List<ReviewVO> reviewList(@PathVariable Integer num, 
			@RequestBody PageVO page, HttpSession session) {
		List<ReviewVO> rList = ajaxSrv.getReviewList(num, page);
		return rList;
	}
	
	
}
