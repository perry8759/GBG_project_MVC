package com.web.GBG_project.shoppingCart.dao;

import com.web.GBG_project.shoppingCart.model.ShoppingCartBean;

public interface ShoppingCartDao {
	void saveShoppingCart(ShoppingCartBean shoppingCart);
	void updateShoppingCart(int cartId, int productAmount);
	void deleteShoppingCart(int cartId);
}