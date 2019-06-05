package com.innerest.shop.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.innerest.common.SearchVO;
import com.innerest.shop.CategoryCountVO;
import com.innerest.shop.ProductDao;
import com.innerest.shop.ProductDetailVO;
import com.innerest.shop.ProductVO;

@Repository
public class ProductDaoImpl implements ProductDao{

	public static final String ns = "product";
	@Inject
	private SqlSession session;
	
	@Override
	public void insertProduct(ProductVO product) {
		session.insert(ns+".insertProduct", product);
	}

	@Override
	public void insertProductDetail(ProductDetailVO vo) {
		session.insert(ns+".insertProductDetail", vo);
	}

	@Override
	public List<ProductVO> selectRegProductList(HashMap<String, Object> map) {
		return session.selectList(ns+".selectRegProductList", map);
	}

	@Override
	public List<ProductDetailVO> selectRegProductDetailList(Integer num) {
		return session.selectList(ns+".selectRegProductDetailList", num);
	}

	@Override
	public ProductVO selectProduct(Integer num) {
		return session.selectOne(ns+".selectProduct", num);
	}

	@Override
	public int selectCountForRegProduct(HashMap<String, Object> map) {
		return session.selectOne(ns+".selectCountForRegProduct", map);
	}

	@Override
	public List<ProductVO> selectShopList(Map map) {
		return session.selectList(ns+".selectShopList", map);
	}

	@Override
	public int selectCountForShop(Map map) {
		return session.selectOne(ns+".selectCountForShop", map);
	}

	@Override
	public List<CategoryCountVO> selectCategoryCountListForShop() {
		return session.selectList(ns+".selectCategoryCountListForShop");
	}

	@Override
	public String selectProductNameByPdNum(Integer num) {
		return session.selectOne(ns+".selectProductNameByPdNum", num);
	}

	@Override
	public ProductDetailVO selectProductDetail(int pd_num) {
		return session.selectOne(ns+".selectProductDetail", pd_num);
	}

}
