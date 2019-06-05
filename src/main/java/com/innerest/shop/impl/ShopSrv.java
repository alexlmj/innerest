package com.innerest.shop.impl;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.innerest.common.PageVO;
import com.innerest.shop.CartDao;
import com.innerest.shop.CartVO;
import com.innerest.shop.CategoryCountVO;
import com.innerest.shop.CheckoutDao;
import com.innerest.shop.CheckoutProductVO;
import com.innerest.shop.CheckoutVO;
import com.innerest.shop.ProductDao;
import com.innerest.shop.ProductDetailVO;
import com.innerest.shop.ProductVO;

@Service
public class ShopSrv {

	@Inject
	private ProductDao productDao;
	@Inject
	private CheckoutDao checkoutDao;
	@Inject
	private CartDao cartDao;
	
	public List<ProductVO> getProductList12ForShop(Map map) {
		PageVO page = (PageVO)map.get("page");
		int count = productDao.selectCountForShop(map);
		page.setPageSize(12);
		page.setGroupSize(5);
		page.setTotalRecordNum(count);
		//map.put("page", page);
		
		return productDao.selectShopList(map);
	}
	
	public List<CategoryCountVO> getCategoryCountListForShop() {
		return productDao.selectCategoryCountListForShop();
	}

	public ProductVO getProduct(Integer num) {
		ProductVO product = productDao.selectProduct(num);
		product.setPdList(productDao.selectRegProductDetailList(num));
		
		return product;
	}
	
	public String getProductNameByPdNum(Integer pd_num) {
		return productDao.selectProductNameByPdNum(pd_num);
	}

	public ProductDetailVO getProductOption(int pd_num) {
		return productDao.selectProductDetail(pd_num);
	}

	public void buyProduct(CheckoutVO checkout, List<CheckoutProductVO> cpList) {
		checkoutDao.insertCheckout(checkout);
		
		for(CheckoutProductVO cp : cpList) {
			cp.setCheckout_num(checkout.getNum());
			checkoutDao.insertCheckoutProduct(cp);
		}
	}

	public void buyBasket(CheckoutVO checkout, List<CheckoutProductVO> cpList) {
		buyProduct(checkout, cpList);
		cartDao.deleteCart(checkout.getUser_num());
	}

	public List<CartVO> getCartList(Integer num) {
		return cartDao.selectCartList(num);
	}

}
