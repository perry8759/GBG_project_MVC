package com.web.GBG_project.product.dao;

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

public interface ProductDao {
	//測試成功
	ProductBean getProductById(int productId);
	ProductStausBean getProductStausById(int productStatusId);
	CustomerCategoryBean getCustomerCategoryBeanById(int customerCategoryId);
	ProductCategoryBean getProductCategoryBeanById(int productCategoryId);
	List<ProductBean> getAllProducts();
	List<ProductBean> getNewSaleProducts();
	List<ProductBean> getHotProducts();
	List<ProductBean> getProductsByCustomerCategory(int ccid);
	List<ProductBean> getProductsByCustomerProductCategory(int ccid, int pcid);
	List<ProductDetailBean> getProductsDetailsByProductId(int pid);
	List<String> getPSizesByProductId(int pid);
	List<String> getPColorsByProductId(int pid);
	int totalComments(int pId);
	List<ProductCommentBean> getProductCommentByProductId(int pId);
	Double avgProductScore(int pId);
	void updateProductScore(int pId, Double newScore);
	List<CustomerCategoryBean> getAllCustomerCategory();
	List<ProductCategoryBean> getAllProductCategory();
	List<ProductStausBean> getAllProductStatus();
	void updateProduct(ProductBean product);
	void addProductDetail(ProductDetailBean productDetailBean);
	int getProductDetailId(String productColor, String productSize, int productId);
	ProductDetailBean getProductDetail(int productDetailId);
	//測試未成功
	int countPictures(int pId);
	ProductDetailBean getProductDetailById(int detailId);
	
	
	
	ProductCommentBean getProductCommentById(int commentId);
	ProductPicBean getProductPicById(int picId);
	List<ProductPicBean> getProductsPicByProductId(int pid);
	String getCustomerCategory(int ccid);
	
	
	
	
	
	List<String> getAllCustomerCategoryName();
	

	
	List<ProductCategoryBean> getProductCategoryByCCId(int ccId);
	
//	List<String> getAllProductCategoryName(int ccId);

	
	
	
	
	

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
	
	List<ManageStatusBean> getManageList();

	//取得商品評論
	List<ProductCommentBean> getProductComments(Integer memberId);
	//取得該會員所有評論
	List<ProductCommentBean> getMemberComments(Integer memberId);
	void addProduct(ProductBean productBean);
	
}
