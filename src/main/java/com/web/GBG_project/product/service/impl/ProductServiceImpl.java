package com.web.GBG_project.product.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.GBG_project.member.model.ManageStatusBean;
import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.product.dao.ProductDao;
import com.web.GBG_project.product.model.ProductBean;
import com.web.GBG_project.product.model.ProductCommentBean;

@Transactional
@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao dao;

	@Override
	public List<ProductBean> getAllProducts() {
		return dao.getAllProducts();
	}

	@Override
	public List<String> getAllCustomerCategory() {
		return dao.getAllCustomerCategory();
	}

	@Override
	public List<ProductBean> getProductsByCustomerCategory(String customerCategory) {
		return dao.getProductsByCustomerCategory(customerCategory);
	}
	
	@Override
	public List<Integer> getCustomerCategoryIdByCustomerCategoryName(String customerCategory) {
		return dao.getCustomerCategoryIdByCustomerCategoryName(customerCategory);
	}

	@Override
	public List<String> getAllProductCategoryByCustomerCategory(int customerCategoryId){
		return dao.getAllProductCategoryByCustomerCategory(customerCategoryId);
	}

	@Override
	public List<ProductBean> getProductsByProductCategory(String productCategory) {
		return dao.getProductsByProductCategory(productCategory);
	}

	@Override
	public ProductBean getProductById(int productId) {
		return dao.getProductById(productId);
	}

//	ProductDetailBean
	
	@Override
	public List<String> getProductDetailSizeByProductId(int productId) {
		return dao.getProductDetailSizeByProductId(productId);
	}

	@Override
	public List<String> getAllProductCategory() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int getProductTotalStockByProductId() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void addProductComment(ProductCommentBean productCommentBean) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public MemberBean getMemberById(int memberId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public ManageStatusBean getManageStatusById(int manageId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public List<MemberBean> getMemberList() {
		// TODO Auto-generated method stub
		return null;
	}


}
