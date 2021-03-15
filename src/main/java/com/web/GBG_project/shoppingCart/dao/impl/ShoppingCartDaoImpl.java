package com.web.GBG_project.shoppingCart.dao.impl;

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
	public void updateShoppingCart(int cartId, int productAmount) {
		String hql = "UPDATE ShoppingCartBean sc SET sc.product_amount = :productAmount WHERE sc.cart_id = :cartId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("productAmount", productAmount).setParameter("cartId", cartId).executeUpdate();
	}

	@Override
	public void deleteShoppingCart(int cartId) {
		String hql = "DELETE FROM ShoppingCartBean sc WHERE sc.cart_id = :cartId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("cartId", cartId).executeUpdate();
	}
}
