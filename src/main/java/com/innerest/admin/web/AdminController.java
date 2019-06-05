package com.innerest.admin.web;

import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.innerest.admin.AdminDocumentVO;
import com.innerest.admin.AdminOrderVO;
import com.innerest.admin.impl.AdminSrv;
import com.innerest.common.SearchVO;
import com.innerest.common.user.UserVO;

@RequestMapping("/admin")
@Controller
public class AdminController {

	/** The usual Logger. */
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Inject
	private AdminSrv adminSrv;

	// 입금관리
	@RequestMapping(value = "/account", method = RequestMethod.GET)
	public String index(SearchVO search, HttpSession session, Model model) {
		String role = (String) session.getAttribute("role");
		if (role == null) {
			return "redirect:/login";
		}

		if (!"A".equals(role)) {
			return "redirect:/";
		}

		List<AdminOrderVO> adminOrderList = adminSrv.getCheckoutList(search);
		model.addAttribute("adminOrderList", adminOrderList);
		model.addAttribute("search", search);
		return "admin/account";
	}
	
	@ResponseBody
	@RequestMapping(value = "/account/ok")
	public String ok(Integer num, HttpSession session) {
		String role = (String) session.getAttribute("role");
		if (role == null) {
			return "fail";
		}

		if (!"A".equals(role)) {
			return "fail";
		}
		adminSrv.changeOrderStatePayOkIfMoneyChecked(num);
		return "success";
	}


	// 회원관리
	@RequestMapping(value = "/member", method = RequestMethod.GET)
	public String memberForm(SearchVO search, Model model) {
		List<UserVO> uList = adminSrv.getUserList(search);
		model.addAttribute("search",search);
		model.addAttribute("uList",uList);
		
		return "admin/member";
	}

	// 진단관리
	@RequestMapping(value = "/exDoc", method = RequestMethod.GET)
	public String exDocForm(SearchVO search, Model model) {
		List<AdminDocumentVO> dList = adminSrv.getDocumentListAll(search);
		model.addAttribute("search",search);
		model.addAttribute("dList",dList);
		
		return "admin/exp-doc";
	}

	// 기업회원심사
	@RequestMapping(value = "/cor_member", method = RequestMethod.GET)
	public String bizMemberForm(SearchVO search, Model model) {
		List<UserVO> uList = adminSrv.getUpgradeUserList(search);
		model.addAttribute("search",search);
		model.addAttribute("uList",uList);
		
		return "admin/biz-member";
	}
	
	@ResponseBody
	@RequestMapping(value = "/upgrade/{num}", method = RequestMethod.GET)
	public String upgradeCor(@PathVariable("num") Integer num) {
		
		adminSrv.updateUserRoleToCorporation(num);
		return "success";
	}
}
