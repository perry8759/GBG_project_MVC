package com.web.GBG_project.shoppingCart.service;

import java.util.List;
import java.util.Map;

import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.shoppingCart.model.ShoppingCartBean;

public interface ShoppingCartService {
	List<ShoppingCartBean> getShoppingCart(int memberId);
	void deleteShoppingCart(int cartId, int memberId);
	void updateShoppingCart(int cartId, int productAmount, int memberId);
	void saveShoppingCart(int productDetailId, int productAmount, int memberId);
	void saveOrderDetail(MemberBean member, Map<String, String> orderMap);
}