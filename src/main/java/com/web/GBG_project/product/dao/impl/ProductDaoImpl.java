package com.web.GBG_project.product.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.GBG_project.member.model.ManageStatusBean;
import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.product.dao.ProductDao;
import com.web.GBG_project.product.model.ProductBean;
import com.web.GBG_project.product.model.ProductCommentBean;

@Repository
public class ProductDaoImpl implements ProductDao {

	@Autowired
	SessionFactory factory;

	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getAllProducts() {
		String hql="FROM ProductBean";
		Session session=factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

	@Override
	public ProductBean getProductById(int productId) {
		Session session=factory.getCurrentSession();
		return session.get(ProductBean.class, productId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllCustomerCategory() {
		String hql="SELECT ccb.customer_category_name FROM CustomerCategoryBean ccb";
		Session session=factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getProductsByCustomerCategory(String customerCategory) {
		String hql="FROM CustomerCategoryBean ccb WHERE ccb.customer_category_name = :customerCategory";
		Session session=factory.getCurrentSession();
		return session.createQuery(hql).setParameter("customerCategory", customerCategory).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllProductCategory() {
		String hql="SELECT pcb.category_name FROM ProductCategoryBean pcb";
		Session session=factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> getCustomerCategoryIdByCustomerCategoryName(String customerCategory) {
		String hql="SELECT DISTINCT ccb.customer_category_id FROM CustomerCategoryBean ccb "
				+ "WHERE ccb.customer_category_name = :customerCategory";
		Session session=factory.getCurrentSession();
		return session.createQuery(hql).setParameter("customerCategory", customerCategory).getResultList();
	}

	//需修改
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllProductCategoryByCustomerCategory(int customerCategoryId) {
		String hql="SELECT DISTINCT       pcb.category_name FROM ProductCategoryBean pcb   "
				+ "WHERE customer_category_id = :ccId";
		
		String hql2="FROM ProductCategoryBean";
		Session session=factory.getCurrentSession();
		session.createQuery(hql).setParameter("ccId", customerCategoryId).getResultList();
		return session.createQuery(hql2).getResultList();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ProductBean> getProductsByProductCategory(String productCategory) {
		String hql="FROM ProductCategoryBean pcb WHERE pcb.category_name = :productCategory";
		Session session=factory.getCurrentSession();
		return session.createQuery(hql).setParameter("productCategory", productCategory).getResultList();
	}

//	ProductDetailBean
	@SuppressWarnings("unchecked")
	@Override
	public List<String> getProductDetailSizeByProductId(int productId) {
		String hql="SELECT DISTINCT pdb.product_size FROM ProductDetailBean pdb  WHERE pdb.product_id = :product_id";
		Session session=factory.getCurrentSession();
		return session.createQuery(hql).setParameter("product_id", productId).getResultList();
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

	@Override
	public List<ManageStatusBean> getManageList() {
		// TODO Auto-generated method stub
		return null;
	}






}
