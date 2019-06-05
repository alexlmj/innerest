package com.innerest.mypage.web;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.innerest.common.SearchVO;
import com.innerest.common.enums.CheckoutState;
import com.innerest.common.enums.UserRole;
import com.innerest.common.user.CorporationVO;
import com.innerest.common.user.UserVO;
import com.innerest.document.DocumentVO;
import com.innerest.mypage.DeliveryVO;
import com.innerest.mypage.impl.MypageSrv;
import com.innerest.shop.BizOrderVO;
import com.innerest.shop.OrderVO;
import com.innerest.shop.ProductDetailVO;
import com.innerest.shop.ProductVO;

@RequestMapping("/mypage")
@Controller
public class MypageController {

	/** The usual Logger.*/
	private static final Logger logger = LoggerFactory.getLogger(MypageController.class);
	@Inject
	private MypageSrv mypageSrv;
	
	//비밀번호 변경
	@RequestMapping(value = "/my_password", method = RequestMethod.GET)
	public String modifyPwForm() {
		return "mypage/my_password";
	}
	
	@ResponseBody
	@RequestMapping(value = "/my_password", method = RequestMethod.POST)
	public String modifyPw(HttpSession session, String curPw, String newPw) {
		//sesion 검증
		String id = (String)session.getAttribute("id");
		Integer num = (Integer)session.getAttribute("num");
		
		UserVO user = new UserVO();
		user.setId(id);
		user.setPw(curPw);
		user.setNum(num);
		
		if(!mypageSrv.modifyPw(user, newPw)) {
			return "fail";
		}
		return "success";
	}
	
	//회원정보 수정
	@RequestMapping(value = "/my_info", method = RequestMethod.GET)
	public String modifyInfoForm(HttpSession session, Model model) {
		Integer num = (Integer)session.getAttribute("num");
		UserVO user = mypageSrv.getUser(num);
		model.addAttribute("user", user);
		return "/mypage/my_user-lnfo-edit";
	}
	
	@RequestMapping(value = "/my_info", method = RequestMethod.POST)
	public String modifyInfo(HttpSession session, UserVO user) {
		Integer num = (Integer)session.getAttribute("num");
		user.setNum(num);
		mypageSrv.modifyInfo(user);
		return "redirect:/mypage/my_info";
	}
	//기업회원 전환
	@RequestMapping(value ="/my_regCor", method = RequestMethod.GET)
	public String exchangeCorForm(HttpSession session) {
		String role = (String)session.getAttribute("role");
		if(!role.equals("P")) {
			return "/mypage/my_password";
		}
		
		return "/mypage/my_biz-member";
	}
	
	@RequestMapping(value = "/my_regCor", method = RequestMethod.POST)
	public String exchangeCor(@ModelAttribute CorporationVO cor, HttpSession session) {
		int num = (int)session.getAttribute("num");
		cor.setUser_num(num);
		mypageSrv.registCor(cor);
		session.removeAttribute("role");
		session.setAttribute("role", UserRole.U.toString());
		return "redirect:/mypage/my_regCor";
	}
	//수출진단 확인
	@RequestMapping(value ="/my_exDoc", method = RequestMethod.GET)
	public String exportDocumentManagerForm(SearchVO search, HttpSession session, Model model) {
		Integer num = (Integer)session.getAttribute("num");
		HashMap<String, Object> map = new HashMap<>();
		map.put("search",  search);
		map.put("user_num", num);
		List<DocumentVO> docList = mypageSrv.getDocumentList(map);
		model.addAttribute("docList",docList);
		model.addAttribute("search", map.get("search"));
		
		return "mypage/my_exp-doc";
	}
	
	
	//주문내역 조회
	@RequestMapping(value ="/my_order", method = RequestMethod.GET)
	public String memberOrderForm(SearchVO search, HttpSession session, Model model) {
		Integer num = (Integer)session.getAttribute("num");
		List<OrderVO> orderList = mypageSrv.getOrderList(num, search);
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("search", search);
		return "mypage/my_order";
	}
	
	@ResponseBody
	@RequestMapping(value ="/my_order/ok", method = RequestMethod.GET)
	public String memberOrderForm(Integer checkout_num, HttpSession session) {
		Integer num = (Integer)session.getAttribute("num");
		if(num == null) {
			return "fail";
		}
		mypageSrv.updateCheckoutState(checkout_num, CheckoutState.OK.toString());
		return "success";
	}
	
	
	/*기업*/
	
	/*//기업회원정보수정
	@RequestMapping(value ="/cor/modifyInfo", method = RequestMethod.GET)
	public String modifyCorForm() {
		return "";
	}*/
	//상품관리
	@RequestMapping(value ="/cor_product", method = RequestMethod.GET)
	public String productManagerForm(HttpSession session, SearchVO search, Model model) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("search",  search);
		map.put("user_num", (int)session.getAttribute("num"));
		List<ProductVO> productList = mypageSrv.getRegProductList(map);
		model.addAttribute("search", search);
		model.addAttribute("pList", productList);

		return "mypage/biz_product";
	}
	
	@RequestMapping(value ="/cor_product/reg", method = RequestMethod.GET)
	public String productRegistForm() {
		return "mypage/biz_product_reg";
	}
	
	@ResponseBody
	@RequestMapping(value ="/cor_product/reg", method = RequestMethod.POST)
	public String productRegist(ProductVO product,
			MultipartHttpServletRequest request) {
		
		product.setUser_num((Integer)request.getSession().getAttribute("num"));
		MultipartFile file1 = request.getFile("title_image");
		MultipartFile file2 = request.getFile("content_image");
		
		String[] pd_name = request.getParameterValues("pd_name");
		String[] pd_price = request.getParameterValues("pd_price");
		String[] pd_inven = request.getParameterValues("pd_inven");
		
		List<ProductDetailVO> pdList = new ArrayList<>();
		for(int i=0;i<pd_name.length;i++) {
			ProductDetailVO vo = new ProductDetailVO();
			vo.setPd_name(pd_name[i]);
			vo.setPd_price(Float.parseFloat(pd_price[i]));
			vo.setPd_inven(Integer.parseInt(pd_inven[i]));
			pdList.add(vo);
		}
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("file1", file1);
		params.put("file2", file2);
		params.put("pdList", pdList);
		params.put("product", product);
		
		mypageSrv.registProduct(params);
		
		return "success";
	}
	
	@RequestMapping(value ="/cor_product/edit", method = RequestMethod.GET)
	public String productModifyForm(Integer num, Model model) {
		ProductVO product = mypageSrv.getProduct(num);
		model.addAttribute("product", product);
		return "mypage/biz_product_edit";
	}
	
	@RequestMapping(value ="/cor_product/edit", method = RequestMethod.POST)
	public String productModify(ProductVO product,
			MultipartHttpServletRequest request) {
		
		Integer user_num = (Integer)request.getSession().getAttribute("num");
		if(product.getUser_num() != user_num) {
			//권한없음
			return "redirect:/errorpage";
		}
		MultipartFile file1 = request.getFile("title_image");
		MultipartFile file2 = request.getFile("content_image");
		
		String[] pd_name = request.getParameterValues("pd_name");
		String[] pd_price = request.getParameterValues("pd_price");
		String[] pd_inven = request.getParameterValues("pd_inven");
		List<ProductDetailVO> pdList = new ArrayList<>();
		
		for(int i=0;i<pd_name.length;i++) {
			ProductDetailVO vo = new ProductDetailVO();
			vo.setPd_name(pd_name[i]);
			vo.setPd_price(Float.parseFloat(pd_price[i]));
			vo.setPd_inven(Integer.parseInt(pd_inven[i]));
			pdList.add(vo);
		}
		
		HashMap<String, Object> params = new HashMap<>();
		params.put("file1", file1);
		params.put("file2", file2);
		params.put("pdList", pdList);
		params.put("product", product);
		
		mypageSrv.updateProduct(params);
		return "redirect:/mypage/cor_product";
	}
	
	//고객주문관리
	@RequestMapping(value ="/cor_order", method = RequestMethod.GET)
	public String orderManagerForm(SearchVO search, HttpSession session, Model model) {
		Integer cor_num = (Integer)session.getAttribute("num");
		
		List<BizOrderVO> bizOrderList = mypageSrv.getBizOrderList(cor_num, search);
		model.addAttribute("search", search);
		model.addAttribute("bizOrderList", bizOrderList);
		return "mypage/biz_order";
	}
	
	@ResponseBody
	@RequestMapping(value ="/cor_order/delivery", method = RequestMethod.POST)
	public String registDelivery(DeliveryVO del) {
		
		mypageSrv.registDelivery(del);
		return "success";
	}
	
	@ResponseBody
	@RequestMapping(value ="/delivery/{checkout_num}", method = RequestMethod.GET)
	public DeliveryVO registDelivery(@PathVariable Integer checkout_num) {
		List<DeliveryVO> dList = mypageSrv.getDeliveryList(checkout_num);
		if(dList == null) {
			return null;
		}
		return dList.get(0);
	}
	
	@RequestMapping(value="/checkout/{num}/{state}", method=RequestMethod.POST)
	public String orderStatePayIng(@PathVariable("num") Integer num,
			@PathVariable("state") Integer state, HttpSession session) {
		String role = (String)session.getAttribute("role");
		if(!role.equals("C") && !role.equals("P")) {
			//권한에러
			return "redirect:/"; 
		}
		String s;
		if(state == 1) {
			s = CheckoutState.PAY_OK.toString();
		} else if(state == 2) {
			s = CheckoutState.DEL_ING.toString();
		} else if (state == 3) {
			s = CheckoutState.OK.toString();
		} else {
			return "redirect:/";
		}
		
		mypageSrv.updateCheckoutState(num, s);
		
		if(role.equals("C")) {
			return "redirect:/mypage/cor_order";
		}
		return "redirect:/mypage/my_order";
	}
	
}
