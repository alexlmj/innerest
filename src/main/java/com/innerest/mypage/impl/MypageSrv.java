package com.innerest.mypage.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.innerest.common.SearchVO;
import com.innerest.common.enums.CheckoutState;
import com.innerest.common.enums.UserRole;
import com.innerest.common.user.CorporationVO;
import com.innerest.common.user.UserDao;
import com.innerest.common.user.UserVO;
import com.innerest.document.DocumentDao;
import com.innerest.document.DocumentVO;
import com.innerest.file.FileDao;
import com.innerest.file.FileVO;
import com.innerest.mypage.DeliveryDao;
import com.innerest.mypage.DeliveryVO;
import com.innerest.shop.BizOrderVO;
import com.innerest.shop.CheckoutDao;
import com.innerest.shop.OrderVO;
import com.innerest.shop.ProductDao;
import com.innerest.shop.ProductDetailVO;
import com.innerest.shop.ProductVO;
import com.innerest.utils.UploadFileUtils;

@Service
public class MypageSrv {
	
	@Resource(name="uploadPath")
	private String uploadPath;
	@Inject
	private UserDao userDao;
	@Inject
	private ProductDao productDao;
	@Inject
	private FileDao fileDao;
	@Inject
	private DocumentDao docDao;
	@Inject
	private CheckoutDao checkoutDao;
	@Inject
	private DeliveryDao delDao;
	
	public boolean modifyPw(UserVO user, String newPw) {
		UserVO db = userDao.selectUserById(user.getId());
		if(!db.getPw().equals(user.getPw())) {
			return false;
		}
		user.setPw(newPw);
		userDao.updateUserPassword(user);
		return true;
	}

	public void modifyInfo(UserVO user) {
		userDao.updateUserInfo(user);
	}

	public UserVO getUser(Integer num) {
		return userDao.selectUser(num);
	}

	public void registCor(CorporationVO cor) {
		userDao.insertCorporation(cor);
		UserVO user = new UserVO();
		user.setNum(cor.getUser_num());
		user.setRole(UserRole.U.toString());
		userDao.updateUserRole(user);
	}

	public void registProduct(HashMap<String, Object> params) {
		MultipartFile titleFile = (MultipartFile) params.get("file1");
		MultipartFile contentFile = (MultipartFile) params.get("file2");
		
		Integer titleFileNum = null;
		Integer contentFileNum = null;
		
		//파일저장
		try{
			String titleSavedName = UploadFileUtils.uploadFile(uploadPath, titleFile.getOriginalFilename(), titleFile.getBytes());
			String contentSavedName = UploadFileUtils.uploadFile(uploadPath, contentFile.getOriginalFilename(), contentFile.getBytes());
			
			FileVO file1 = new FileVO();
			file1.setExtension(titleSavedName.substring(titleSavedName.lastIndexOf(".")+1));
			file1.setSaved_name(titleSavedName);
			file1.setOrigin_name(titleFile.getOriginalFilename());
			file1.setSize((int)titleFile.getSize());
			fileDao.insertFile(file1);
			titleFileNum = file1.getNum();
			
			FileVO file2 = new FileVO();
			file2.setExtension(contentSavedName.substring(contentSavedName.lastIndexOf(".")+1));
			file2.setSaved_name(contentSavedName);
			file2.setOrigin_name(contentFile.getOriginalFilename());
			file2.setSize((int)contentFile.getSize());
			fileDao.insertFile(file2);
			contentFileNum = file2.getNum();
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		ProductVO product = (ProductVO) params.get("product");
		product.setFile_num1(titleFileNum);
		product.setFile_num2(contentFileNum);
		
		List<ProductDetailVO> pdList = (List) params.get("pdList");
		
		productDao.insertProduct(product);
		int productNum = product.getNum();
		
		for(ProductDetailVO vo : pdList) {
			vo.setProduct_num(productNum);
			productDao.insertProductDetail(vo);
		}
	}
	
	public void updateProduct(HashMap<String, Object> params) {
		
	}

	/*
	 * 기업회원이 등록한 상품 리스트 가져오기
	 * @param Map
	 * category : ALL, ETC ...
	 * name : [상품명]
	 * reqPage : [요청페이지]
	 * num : [기업회원번호]
	 */
	public List<ProductVO> getRegProductList(HashMap<String, Object> map) {
		
		//map : SearchVO(search), Integer(user_num)
		SearchVO search = (SearchVO)map.get("search");
		search.setGroupSize(5);
		search.setTotalRecordNum(productDao.selectCountForRegProduct(map));
		
		List<ProductVO> pList = productDao.selectRegProductList(map);
		
		for(ProductVO p : pList) {
			List<ProductDetailVO> pdList = productDao.selectRegProductDetailList(p.getNum());
			p.setPdList(pdList);
		}
		return pList;
	}

	
	public ProductVO getProduct(Integer num) {
		ProductVO product = productDao.selectProduct(num);
		product.setPdList(productDao.selectRegProductDetailList(num));
		return product;
	}

	public List<DocumentVO> getDocumentList(Map map) {
		//map : SearchVO(search), Integer(user_num)
		SearchVO search = (SearchVO)map.get("search");
		search.setGroupSize(5);
		Integer num = (Integer)map.get("user_num");
		search.setTotalRecordNum(docDao.selectCountForDocument(num, search));
		List<DocumentVO> dList = docDao.selectDocumentList(map);
		return dList;
	}

	public List<OrderVO> getOrderList(Integer num, SearchVO search) {
		search.setGroupSize(5);
		search.setTotalRecordNum(checkoutDao.selectSearchOrderCount(num, search));
		return checkoutDao.selectSearchOrderList(num, search);
	}

	public List<BizOrderVO> getBizOrderList(Integer cor_num, SearchVO search) {
		search.setGroupSize(5);
		search.setTotalRecordNum(checkoutDao.selectSearchBizOrderCount(cor_num, search));
		return checkoutDao.selectSearchBizOrderList(cor_num, search);
	}

	public void updateCheckoutState(Integer num, String s) {
		checkoutDao.updateCheckoutState(num, s);
	}

	public void registDelivery(DeliveryVO del) {
		delDao.insertDelivery(del);
		checkoutDao.updateCheckoutState(del.getCheckout_num(), CheckoutState.DEL_ING.toString());
	}

	public List<DeliveryVO> getDeliveryList(Integer checkout_num) {
		return delDao.getDeliveryList(checkout_num);
	}

}
