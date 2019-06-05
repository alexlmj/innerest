package com.innerest.shop;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface ProductDao {
	public void insertProduct(ProductVO product);
	public ProductVO selectProduct(Integer num);
	public List<ProductVO> selectRegProductList(HashMap<String, Object> map);
	public int selectCountForRegProduct(HashMap<String, Object> map);
	
	public List<ProductVO> selectShopList(Map map); //상품 12개
	public int selectCountForShop(Map map);
	
	public void insertProductDetail(ProductDetailVO vo);
	public List<ProductDetailVO> selectRegProductDetailList(Integer num);
	
	public List<CategoryCountVO> selectCategoryCountListForShop();
	public String selectProductNameByPdNum(Integer num);
	public ProductDetailVO selectProductDetail(int pd_num);
}
