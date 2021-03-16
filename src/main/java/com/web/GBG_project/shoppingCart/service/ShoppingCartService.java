package com.web.GBG_project.shoppingCart.service;

import java.util.List;

import com.web.GBG_project.shoppingCart.model.ShoppingCartBean;

public interface ShoppingCartService {
	List<ShoppingCartBean> getShoppingCart(int memberId);
	void deleteShoppingCart(int cartId, int memberId);
	void updateShoppingCart(int cartId, int productAmount, int memberId);
}