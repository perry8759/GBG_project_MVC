package com.web.GBG_project.shoppingCart.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.GBG_project.shoppingCart.dao.ShoppingCartDao;
import com.web.GBG_project.shoppingCart.model.ShoppingCartBean;

@Repository
public class ShoppingCartDaoImpl implements ShoppingCartDao {
	@Autowired
	private SessionFactory factory;

	@Override
	public void saveShoppingCart(ShoppingCartBean shoppingCart) {
		Session session = factory.getCurrentSession();
		session.save(shoppingCart);
	}

	@Override
	public void updateShoppingCart(int cartId, int productAmount, int memberId) {
		String hql = "UPDATE ShoppingCartBean SET product_amount = :productAmount WHERE cart_id = :cartId AND member_id = :memberId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("productAmount", productAmount).setParameter("cartId", cartId).setParameter("memberId", memberId).executeUpdate();
	}

	@Override
	public void deleteShoppingCart(int cartId, int memberId) {
		String hql = "DELETE FROM ShoppingCartBean WHERE cart_id = :cartId AND member_id = :memberId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("cartId", cartId).setParameter("memberId", memberId).executeUpdate();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ShoppingCartBean> getShoppingCart(int memberId) {
		String hql = "FROM ShoppingCartBean sc WHERE member_id = :memberId";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("memberId", memberId).getResultList();
	}
}
