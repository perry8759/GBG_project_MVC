package com.web.GBG_project.product.dao;

import java.sql.Timestamp;
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
	ProductBean selectProductById(int productId);
	ProductStausBean getProductStausById(int productStatusId);
	CustomerCategoryBean getCustomerCategoryById(int customerCategoryId);
	ProductCategoryBean getProductCategoryById(int productCategoryId);
	List<ProductBean> getAllProducts();
	List<ProductBean> getNewSaleProducts();
	List<ProductBean> getHotProducts();
	int getProductsByCategoriesSize(int ccid, int pcid);
	List<ProductBean> getProductsByCustomerCategory(int ccid,int begin,int count);
	List<ProductBean> getProductsByCustomerProductCategory(int ccid, int pcid,int begin,int count);
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
	void addProductPicture(ProductPicBean picture);
	int getProductDetailId(String productColor, String productSize, int productId);
	ProductDetailBean getProductDetail(int productDetailId);
	List<ProductBean> listProductByCondition(int customerCategoryId,int productStatusId, String sort);
	void updateProductStatus(int productId, ProductStausBean status);
	ProductDetailBean getProductDetailById(int detailId);
	void updateOnSaleDate(int productId, Timestamp times);
	void updateProductDetail(ProductDetailBean productDetailBean);
	List<ProductBean> searchProducts(String keyword,int productCategoryId, int productStatusId,int begin, int count);
	int searchProductsResultSize(String keyword,int productCategoryId, int productStatusId);
	List<ProductCommentBean> getProductCommentByMember(MemberBean member);
	List<ProductBean> perPageProducts(int begin,int count);
	int countProducts();

	//測試未成功
	List<ProductPicBean> getProductsPicByProductId(int pid);
	Integer getProductCoverId(int pId);
	ProductPicBean getProductPicById(int picId);
	List<Integer> getProductPictureId(ProductBean product);
	public Integer getHotCategoryProductId(Integer ccId);
	
	
	
	int countPictures(int pId);
	ProductCommentBean getProductCommentById(int commentId);
	String getCustomerCategoryName(int ccid);
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
