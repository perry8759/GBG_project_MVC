package com.web.GBG_project.product.service;

import java.util.List;

import com.web.GBG_project.member.model.ManageStatusBean;
import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.product.model.CustomerCategoryBean;
import com.web.GBG_project.product.model.ProductBean;
import com.web.GBG_project.product.model.ProductCategoryBean;
import com.web.GBG_project.product.model.ProductCommentBean;
import com.web.GBG_project.product.model.ProductDetailBean;
import com.web.GBG_project.product.model.ProductPicBean;
import com.web.GBG_project.product.model.ProductStausBean;

public interface ProductService {

	ProductBean getProductById(int productId);
	ProductBean selectProductById(int productId);
	List<ProductBean> getAllProducts();
	List<ProductBean> getNewSaleProducts();
	List<ProductBean> getHotProducts();
	List<ProductBean> getProductsByCustomerCategory(int ccid);
	List<ProductBean> getProductsByCustomerProductCategory(int ccid, int pcid);
	List<ProductDetailBean> getProductsDetailsByProductId(int pid);
	List<String> getPSizesByProductId(int pid);
	List<String> getPColorsByProductId(int pid);
	int totalComments(int pId);
	Double setProductScore(int pId);
	List<CustomerCategoryBean> getAllCustomerCategory();
	List<ProductCategoryBean> getAllProductCategory();
	void addProduct(ProductBean productBean);
	ProductStausBean getProductStausById(int productStatusId);
	List<ProductStausBean> getAllProductStatus();
	void updateProduct(ProductBean productBean);
	void addProductDetail(ProductDetailBean productDetailBean);
	List<ProductBean> listProductByCondition(int customerCategoryId, int statusId,int sortValue);
	List<ProductCommentBean> getProductCommentByMemberId(MemberBean member);
	void updateProductStatus(int productId, int statusId);
	//測試未成功=================================
	void updateProductDetail(ProductDetailBean productDetailBean);
	ProductDetailBean getProductDetailById(int detailId);	
	
	int countPictures(int pId);
	List<ProductPicBean> getProductsPicByProductId(int pid);
	List<ProductCommentBean> getProductCommentByProductId(int pid);
	String getCustomerCategory(int ccid);
	
	
	List<String> getAllCustomerCategoryName();
	

	
	List<ProductCategoryBean> getProductCategoryByCCId(int ccId);

	List<ProductBean> getProductsByCustomerCategory(String customerCategory);
	

	
	List<Integer> getCustomerCategoryIdByCustomerCategoryName(String customerCategory);  //待修改
	
	List<String> getAllProductCategoryByCustomerCategory(int customerCategoryId);  //待修改

	List<ProductBean> getProductsByProductCategory(String productCategory);
	

	
//	ProductDetailBean
	
	List<String> getProductDetailSizeByProductId(int productId);
	
	int getProductTotalStockByProductId();
	
//	新增產品評論
	
	void addProductComment(ProductCommentBean productCommentBean);
	
	MemberBean getMemberById(int memberId);
	
	ManageStatusBean getManageStatusById(int manageId);
	
	List<MemberBean> getMemberList();
}
