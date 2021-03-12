package com.web.GBG_project.product.service.impl;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.GBG_project.member.dao.MemberDao;
import com.web.GBG_project.member.model.ManageStatusBean;
import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.product.dao.ProductDao;
import com.web.GBG_project.product.model.CustomerCategoryBean;
import com.web.GBG_project.product.model.ProductBean;
import com.web.GBG_project.product.model.ProductCategoryBean;
import com.web.GBG_project.product.model.ProductCommentBean;
import com.web.GBG_project.product.model.ProductDetailBean;
import com.web.GBG_project.product.model.ProductPicBean;
import com.web.GBG_project.product.model.ProductStausBean;
import com.web.GBG_project.product.service.ProductService;

@Transactional
@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	ProductDao dao;
	@Autowired
	MemberDao memberDao;

	@Override
	public ProductBean getProductById(int productId) {
		return dao.getProductById(productId);
	}

	@Override
	public List<ProductBean> getAllProducts() {
		return dao.getAllProducts();
	}

	@Override
	public List<ProductBean> getNewSaleProducts() {
		return dao.getNewSaleProducts();
	}

	@Override
	public List<ProductBean> getHotProducts() {
		return dao.getHotProducts();
	}

	@Override
	public List<ProductBean> getProductsByCustomerCategory(int ccid) {
		return dao.getProductsByCustomerCategory(ccid);
	}

	@Override
	public List<ProductBean> getProductsByCustomerProductCategory(int ccid, int pcid) {
		return dao.getProductsByCustomerProductCategory(ccid, pcid);
	}

	@Override
	public List<ProductDetailBean> getProductsDetailsByProductId(int pid) {
		return dao.getProductsDetailsByProductId(pid);
	}

	@Override
	public List<String> getPSizesByProductId(int pid) {
		return dao.getPSizesByProductId(pid);
	}

	@Override
	public List<String> getPColorsByProductId(int pid) {
		return dao.getPColorsByProductId(pid);
	}

	// 新增商品評論
	@Override
	public void addProductComment(ProductCommentBean productCommentBean) {
		ManageStatusBean manage = memberDao.getManageStatus(1);
		ProductBean pb = getProductById(productCommentBean.getProductBean().getProduct_id());
		Date commentDate = new Date(System.currentTimeMillis());
		productCommentBean.setManageStatusBean(manage);
		productCommentBean.setProductBean(pb);
		productCommentBean.setComment_date(commentDate);
		dao.addProductComment(productCommentBean);
	}

	@Override
	public int totalComments(int pId) {
		return dao.totalComments(pId);
	}

	// 修改商品評分
	public Double setProductScore(int pId) {
		Double avg = dao.avgProductScore(pId);
		dao.updateProductScore(pId, (Math.round(avg * 10) / 10.0));
//		System.out.println("===================================================");
//		System.out.println("取出評論的商品pId = "+pId+"取得商品新評分"+avg);
//		System.out.println("===================================================");
		return dao.avgProductScore(pId);
	}

	@Override
	public List<ProductCommentBean> getProductCommentByProductId(int pid) {
		return dao.getProductCommentByProductId(pid);
	}

	@Override
	public List<CustomerCategoryBean> getAllCustomerCategory() {
		return dao.getAllCustomerCategory();
	}

	public List<ProductCategoryBean> getAllProductCategory() {
		return dao.getAllProductCategory();
	}

	@Override
	public ProductStausBean getProductStausById(int productStatusId) {
		return dao.getProductStausById(productStatusId);
	}

	// 新增商品
	@Override
	public void addProduct(ProductBean productBean) {
		ProductStausBean psb = dao.getProductStausById(productBean.getProductStausBean().getProduct_stid());
		CustomerCategoryBean ccb = dao
				.getCustomerCategoryBeanById(productBean.getCustomerCategoryBean().getCustomer_category_id());
		ProductCategoryBean pcb = dao.getProductCategoryBeanById(productBean.getProductCategoryBean().getCategory_id());
		Timestamp onSaleTime = new Timestamp(System.currentTimeMillis());

		productBean.setProductStausBean(psb);
		productBean.setCustomerCategoryBean(ccb);
		productBean.setProductCategoryBean(pcb);
		productBean.setOnSaleTime(onSaleTime);
		dao.addProduct(productBean);
	}

	@Override
	public List<ProductStausBean> getAllProductStatus() {
		return dao.getAllProductStatus();
	}

	// 修改商品
	@Override
	public void updateProduct(ProductBean productBean) {
		ProductStausBean psb = dao.getProductStausById(productBean.getProductStausBean().getProduct_stid());
		CustomerCategoryBean ccb = dao
				.getCustomerCategoryBeanById(productBean.getCustomerCategoryBean().getCustomer_category_id());
		ProductCategoryBean pcb = dao.getProductCategoryBeanById(productBean.getProductCategoryBean().getCategory_id());
		Timestamp onSaleTime = productBean.getOnSaleTime();

		productBean.setProductStausBean(psb);
		productBean.setCustomerCategoryBean(ccb);
		productBean.setProductCategoryBean(pcb);
		productBean.setOnSaleTime(onSaleTime);
		dao.updateProduct(productBean);
	}
	// 新增商品細項
	@Override
	public void addProductDetail(ProductDetailBean productDetailBean) {
		int id=productDetailBean.getProductBean().getProduct_id();
		System.out.println("===================service before save pdb===================");
		System.out.println(id);
		ProductBean pb = getProductById(id);
		productDetailBean.setProductBean(pb);
		
		dao.addProductDetail(productDetailBean);
	}

	// =======================測試未成功=========================
	@Override
	public ProductDetailBean getProductDetailById(int detailId) {
		return dao.getProductDetailById(detailId);
	}
	
	
	
	
	
	@Override
	public List<ProductPicBean> getProductsPicByProductId(int pid) {
		return dao.getProductsPicByProductId(pid);
	}

	@Override
	public int countPictures(int pId) {
		return dao.countPictures(pId);
	}

	@Override
	public String getCustomerCategory(int ccid) {
		return dao.getCustomerCategory(ccid);
	}

	@Override
	public List<String> getAllCustomerCategoryName() {
		return dao.getAllCustomerCategoryName();
	}

	public List<ProductCategoryBean> getProductCategoryByCCId(int ccId) {
		return dao.getProductCategoryByCCId(ccId);
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
	public List<String> getAllProductCategoryByCustomerCategory(int customerCategoryId) {
		return dao.getAllProductCategoryByCustomerCategory(customerCategoryId);
	}

	@Override
	public List<ProductBean> getProductsByProductCategory(String productCategory) {
		return dao.getProductsByProductCategory(productCategory);
	}

//	ProductDetailBean

	@Override
	public List<String> getProductDetailSizeByProductId(int productId) {
		return dao.getProductDetailSizeByProductId(productId);
	}

//	@Override
//	public List<String> getAllProductCategory() {
//		// TODO Auto-generated method stub
//		return null;
//	}

	@Override
	public int getProductTotalStockByProductId() {
		// TODO Auto-generated method stub
		return 0;
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
