package com.web.GBG_project.shoppingCart.dao;

import java.util.List;

import com.web.GBG_project.shoppingCart.model.ShoppingCartBean;

public interface ShoppingCartDao {
	void saveShoppingCart(ShoppingCartBean shoppingCart);
	void updateShoppingCart(int cartId, int productAmount, int memberId);
	void deleteShoppingCart(int cartId, int memberId);
	List<ShoppingCartBean> getShoppingCart(int memberId);
}