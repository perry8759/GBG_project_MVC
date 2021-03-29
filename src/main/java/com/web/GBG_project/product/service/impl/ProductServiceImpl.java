package com.web.GBG_project.product.service.impl;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.List;
import java.util.Set;

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

@Service
@Transactional
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
	public ProductBean selectProductById(int productId) {
		return dao.selectProductById(productId);
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
	public int getProductsByCategoriesSize(int ccId, int pcId) {
		return dao.getProductsByCategoriesSize(ccId, pcId);
	}

	@Override
	public List<ProductBean> getProductsByCategories(int ccId, int pcId, int begin, int count) {
		List<ProductBean> products = null;
		if (pcId == -1) {
			products = dao.getProductsByCustomerCategory(ccId, begin, count);
		} else {
			products = dao.getProductsByCustomerProductCategory(ccId, pcId, begin, count);
		}
		return products;
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
				.getCustomerCategoryById(productBean.getCustomerCategoryBean().getCustomer_category_id());
		ProductCategoryBean pcb = dao.getProductCategoryById(productBean.getProductCategoryBean().getCategory_id());
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
	@SuppressWarnings("unchecked")
	@Override
	public void updateProduct(ProductBean productBean) {
		int pId = productBean.getProduct_id();
		ProductBean origin = dao.getProductById(pId);
		int statusId = productBean.getProductStausBean().getProduct_stid();
		Timestamp originSaleTime = productBean.getOnSaleTime();
		ProductStausBean psb = dao.getProductStausById(statusId);
		CustomerCategoryBean ccb = dao
				.getCustomerCategoryById(productBean.getCustomerCategoryBean().getCustomer_category_id());
		ProductCategoryBean pcb = dao.getProductCategoryById(productBean.getProductCategoryBean().getCategory_id());
		
		Set<ProductDetailBean> productDetails = origin.getProductDetailBean();
		Set<ProductPicBean> productPics = origin.getProductPicBean();
		Set<ProductCommentBean> productComments = origin.getProductCommentBean();

		if (statusId == 1 & originSaleTime == null) {
			Timestamp onSaleTime = new Timestamp(System.currentTimeMillis());
			productBean.setOnSaleTime(onSaleTime);
		}
		productBean.setProductStausBean(psb);
		productBean.setCustomerCategoryBean(ccb);
		productBean.setProductCategoryBean(pcb);
		
		productBean.setProductDetailBean(productDetails);
		productBean.setProductPicBean(productPics);
		productBean.setProductCommentBean(productComments);
		dao.updateProduct(productBean);
	}

	// 新增商品細項
	@Override
	public void addProductDetail(ProductDetailBean productDetailBean) {
		int id = productDetailBean.getProductBean().getProduct_id();
		System.out.println("===================service before save pdb===================");
		System.out.println(id);
		ProductBean pb = getProductById(id);
		productDetailBean.setProductBean(pb);

		dao.addProductDetail(productDetailBean);
	}

	@Override // 判斷排序條件 列出商品
	public List<ProductBean> listProductByCondition(int customerCategoryId, int statusId, int sortValue) {
		String sort = "";
		if (sortValue == 1) { // 降冪
			sort = "DESC";
		} else if (sortValue == 2) { // 昇冪
			sort = "ASC";
		}
		return dao.listProductByCondition(customerCategoryId, statusId, sort);
	}

	@Override
	public ProductDetailBean getProductDetailById(int detailId) {
		return dao.getProductDetailById(detailId);
	}

	@Override
	public List<ProductCommentBean> getProductCommentByMemberId(MemberBean member) {
		return dao.getProductCommentByMember(member);
	}

	@Override // 更新商品上下架狀態
	public void updateProductStatus(int productId, int statusId) {
		if (statusId == 1) {
			Timestamp onSaleTime = new Timestamp(System.currentTimeMillis());
			dao.updateOnSaleDate(productId, onSaleTime);
		}
		dao.updateProductStatus(productId, dao.getProductStausById(statusId));
	}

	@Override // 更新商品細項
	public void updateProductDetail(ProductDetailBean productDetailBean) {
		dao.updateProductDetail(productDetailBean);
	}

	@Override
	public int countProducts() {
		return dao.countProducts();
	}

	@Override
	public List<ProductBean> perPageProducts(int begin, int count) {
		return dao.perPageProducts(begin, count);
	}

	@Override
	public List<ProductBean> searchProducts(String keyword, int productCategoryId, int productStatusId, int begin,
			int count) {
		return dao.searchProducts(keyword, productCategoryId, productStatusId, begin, count);
	}

	@Override
	public int searchProductsResultSize(String keyword, int productCategoryId, int productStatusId) {
		return dao.searchProductsResultSize(keyword, productCategoryId, productStatusId);
	}

	@Override
	public Integer getProductCoverId(int pId) {
		return dao.getProductCoverId(pId);
	}

	@Override
	public ProductPicBean getProductPicById(int picId) {
		return dao.getProductPicById(picId);
	}

	@Override
	public List<ProductPicBean> getProductsPicByProductId(int productId) {
		return dao.getProductsPicByProductId(productId);
	}

	// =======================測試未成功=========================
	@Override
	public void addProductPicture(ProductPicBean picture) {
		int pId = picture.getProductBean().getProduct_id();
		System.out.println("===================service before save pdb===================");
		System.out.println(pId);
		ProductBean product = getProductById(pId);
		int seqId = picture.getProduct_pic_seq();
		if (seqId != 0) {
			int finalSeq = 0;
			List<Integer> pictureSeq = dao.getProductPictureSeq(product);
			for (int n : pictureSeq) {
				finalSeq = n;
			}
			finalSeq += 1;
			picture.setProduct_pic_seq(finalSeq);
		}
		picture.setProductBean(product);
		dao.addProductPicture(picture);
	}

	@Override // 取得商品照片ID
	public List<Integer> getProductPictureId(Integer productId) {
		return dao.getProductPictureId(dao.getProductById(productId));
	}

	@Override // 刪除商品照片
	public void deleteProductPicture(ProductPicBean picture) {
		dao.deleteProductPicture(picture);
	}

	@Override
	public int countPictures(int pId) {
		return dao.countPictures(pId);
	}

	@Override
	public String getCustomerCategory(int ccid) {
		return dao.getCustomerCategoryName(ccid);
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

	@Override
	public int getProductDetailId(String productColor, String productSize, int productId) {
		return dao.getProductDetailId(productColor, productSize, productId);
	}

	@Override
	public ProductDetailBean getProductDetail(int productDetailId) {
		return dao.getProductDetail(productDetailId);
	}

}
