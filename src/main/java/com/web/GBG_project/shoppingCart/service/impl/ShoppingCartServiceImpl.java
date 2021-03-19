package com.web.GBG_project.shoppingCart.service.impl;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.shoppingCart.dao.ShoppingCartDao;
import com.web.GBG_project.shoppingCart.model.OrderDetailsBean;
import com.web.GBG_project.shoppingCart.model.OrderSatusBean;
import com.web.GBG_project.shoppingCart.model.OrdersBean;
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
	
	@Transactional
	@Override
	public void saveShoppingCart(int productDetailId, int productAmount, int memberId) {
		dao.saveShoppingCart(productDetailId, productAmount, memberId);
	}
	
	@Transactional
	@Override
	public void saveOrderDetail(MemberBean member, Map<String, String> orderMap) {
		OrdersBean order = new OrdersBean();
		order.setMemberBean(member);
		//order.setOrder_id();
		order.setOrderSatusBean(new OrderSatusBean(1));
		order.setReceive_men(orderMap.get("memberName"));
		order.setShipping_address(orderMap.get("memberAddress"));
		order.setOrder_date(new Timestamp(System.currentTimeMillis()));
		order.setShipping_style("貨到付款");
		List<ShoppingCartBean> shoppingCart = dao.getShoppingCart(member.getMember_id());
		OrderDetailsBean orderDetail = new OrderDetailsBean();
	}
}
