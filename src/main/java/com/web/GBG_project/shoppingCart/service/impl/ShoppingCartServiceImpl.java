package com.web.GBG_project.shoppingCart.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.GBG_project.shoppingCart.dao.ShoppingCartDao;
import com.web.GBG_project.shoppingCart.model.ShoppingCartBean;
import com.web.GBG_project.shoppingCart.service.ShoppingCartService;

@Service
public class ShoppingCartServiceImpl implements ShoppingCartService {
	
	@Autowired
	ShoppingCartDao dao;
	
	@Transactional
	@Override
	public List<ShoppingCartBean> getShoppingCart(int memberId) {
		return dao.getShoppingCart(memberId);
	}
	
	@Transactional
	@Override
	public void deleteShoppingCart(int cartId, int memberId) {
		dao.deleteShoppingCart(cartId, memberId);
	}
	
	@Transactional
	@Override
	public void updateShoppingCart(int cartId, int productAmount, int memberId) {
		dao.updateShoppingCart(cartId, productAmount, memberId);
	}
}
