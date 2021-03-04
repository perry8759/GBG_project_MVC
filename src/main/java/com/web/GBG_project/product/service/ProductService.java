package com.web.GBG_project.product.service;

import java.util.List;

import com.web.GBG_project.member.model.ManageStatusBean;
import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.product.model.ProductBean;
import com.web.GBG_project.product.model.ProductCommentBean;

public interface ProductService {

	List<ProductBean> getAllProducts();

	List<String> getAllCustomerCategory();

	List<ProductBean> getProductsByCustomerCategory(String customerCategory);
	
	List<String> getAllProductCategory();
	
	List<Integer> getCustomerCategoryIdByCustomerCategoryName(String customerCategory);  //待修改
	
	List<String> getAllProductCategoryByCustomerCategory(int customerCategoryId);  //待修改

	List<ProductBean> getProductsByProductCategory(String productCategory);
	
	public ProductBean getProductById(int productId);
	
//	ProductDetailBean
	
	List<String> getProductDetailSizeByProductId(int productId);
	
	int getProductTotalStockByProductId();
	
//	新增產品評論
	
	void addProductComment(ProductCommentBean productCommentBean);
	
	MemberBean getMemberById(int memberId);
	
	ManageStatusBean getManageStatusById(int manageId);
	
	List<MemberBean> getMemberList();
}
