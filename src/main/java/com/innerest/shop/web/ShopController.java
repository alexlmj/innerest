package com.innerest.shop.web;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Base64;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonParseException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.innerest.ajax.impl.AjaxSrv;
import com.innerest.common.PageVO;
import com.innerest.shop.CartVO;
import com.innerest.shop.CategoryCountVO;
import com.innerest.shop.CheckoutProductVO;
import com.innerest.shop.CheckoutVO;
import com.innerest.shop.ProductVO;
import com.innerest.shop.ReviewVO;
import com.innerest.shop.impl.ShopSrv;

@RequestMapping("/shop")
@Controller
public class ShopController {

	/** The usual Logger.*/
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	@Inject
	private ShopSrv shopSrv;
	@Inject
	private AjaxSrv ajaxSrv;
	
	@RequestMapping(value = "", method = RequestMethod.GET)
	public String index(PageVO page, String sortType, String category, Model model) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("page", page);
		map.put("sortType", sortType);
		map.put("category", category);
		List<ProductVO> pList = shopSrv.getProductList12ForShop(map);
		model.addAttribute("sortType", sortType);
		model.addAttribute("category",category);
		model.addAttribute("pList", pList);
		model.addAttribute("page", page);
		List<CategoryCountVO> categoryList = shopSrv.getCategoryCountListForShop();
		model.addAttribute("categoryList",categoryList);
		
		return "shop/shop_index";
	}
	
	@RequestMapping(value = "/{num}", method = RequestMethod.GET)
	public String shopShowForm(@PathVariable("num") Integer num, 
			PageVO page, Model model) {
		ProductVO product = shopSrv.getProduct(num);
		
		List<ReviewVO> rList = ajaxSrv.getReviewList(num, page);
		
		model.addAttribute("rList", rList);
		model.addAttribute("page", page);
		model.addAttribute("product", product);
		
		return "shop/shop_single";
	}
	
	@RequestMapping(value = "/cart", method = RequestMethod.GET)
	public String cartForm(HttpSession session, Model model) {
		Integer num = (Integer)session.getAttribute("num");
		if(num == null) {
			return "redirect:/login";
		}
		
		List<CartVO> cartList = shopSrv.getCartList(num);
		model.addAttribute("cartList", cartList);
		
		return "shop/cart";
	}
	
	
	@RequestMapping(value = "/checkout_s", method = RequestMethod.GET)
	public String checkoutSingleForm(String data, Model model) throws JsonParseException, JsonMappingException, IOException {

		ObjectMapper mapper = new ObjectMapper();
		String jsonData = new String(Base64.getDecoder().decode(data));
		List<CheckoutProductVO> cpList =
				mapper.readValue(jsonData, new TypeReference<List<CheckoutProductVO>>(){});
		
		String name = shopSrv.getProductNameByPdNum(cpList.get(0).getPd_num());
		for(CheckoutProductVO vo : cpList) {
			vo.setOption(shopSrv.getProductOption(vo.getPd_num()));
		}
		model.addAttribute("name", name);
		model.addAttribute("cpList",cpList);
		return "shop/checkout_s";
	}
	
	@RequestMapping(value = "/checkout_s", method = RequestMethod.POST)
	public String checkout(CheckoutVO checkout, HttpSession session,
			Integer[] pd_num, Integer[] quantity, Model model) throws JsonParseException, JsonMappingException, IOException {
		
		Integer user_num = (Integer)session.getAttribute("num");
		if(user_num == null) {
			return "redirect:/login";
		}
		checkout.setUser_num(user_num);
		
		List<CheckoutProductVO> cpList = new ArrayList<>();
		for(int i=0;i<pd_num.length;i++) {
			CheckoutProductVO vo = new CheckoutProductVO();
			vo.setPd_num(pd_num[i]);
			vo.setQuantity(quantity[i]);
			cpList.add(vo);
		}
		shopSrv.buyProduct(checkout, cpList);
		
		return "redirect:/shop/thankyou";
	}
	
	@RequestMapping(value = "/checkout_b", method = RequestMethod.GET)
	public String checkoutBasketForm(HttpSession session, Model model) throws JsonParseException, JsonMappingException, IOException {
		Integer num = (Integer)session.getAttribute("num");
		List<CartVO> cartList = shopSrv.getCartList(num);
		model.addAttribute("cartList",cartList);
		return "shop/checkout_b";
	}
	
	@RequestMapping(value = "/checkout_b", method = RequestMethod.POST)
	public String checkoutBasket(CheckoutVO checkout, HttpSession session,
			Integer[] pd_num, Integer[] quantity, Model model) throws JsonParseException, JsonMappingException, IOException {
		
		Integer user_num = (Integer)session.getAttribute("num");
		if(user_num == null) {
			return "redirect:/login";
		}
		checkout.setUser_num(user_num);
		
		List<CheckoutProductVO> cpList = new ArrayList<>();
		for(int i=0;i<pd_num.length;i++) {
			CheckoutProductVO vo = new CheckoutProductVO();
			vo.setPd_num(pd_num[i]);
			vo.setQuantity(quantity[i]);
			cpList.add(vo);
		}
		shopSrv.buyBasket(checkout, cpList);
		
		return "redirect:/shop/thankyou";
	}
	
	@RequestMapping(value = "/thankyou", method = RequestMethod.GET)
	public String thankyou() {
		return "shop/thankyou";
	}
	
	
}
