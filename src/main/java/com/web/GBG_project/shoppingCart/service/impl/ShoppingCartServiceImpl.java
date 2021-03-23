package com.web.GBG_project.shoppingCart.service.impl;

import java.sql.Timestamp;
import java.util.List;
import java.util.Map;
import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.member.util.CommonUtils;
import com.web.GBG_project.shoppingCart.dao.ShoppingCartDao;
import com.web.GBG_project.shoppingCart.model.OrderDetailsBean;
import com.web.GBG_project.shoppingCart.model.OrderSatusBean;
import com.web.GBG_project.shoppingCart.model.OrdersBean;
import com.web.GBG_project.shoppingCart.model.ShoppingCartBean;
import com.web.GBG_project.shoppingCart.service.ShoppingCartService;

@Service
@Transactional
public class ShoppingCartServiceImpl implements ShoppingCartService {
	
	@Autowired
	CommonUtils common;
	
	@Autowired
	ShoppingCartDao dao;
	
	@Override
	public List<ShoppingCartBean> getShoppingCart(int memberId) {
		return dao.getShoppingCart(memberId);
	}
	
	@Override
	public void deleteShoppingCart(int cartId, int memberId) {
		dao.deleteShoppingCart(cartId, memberId);
	}
	
	@Override
	public void updateShoppingCart(int cartId, int productAmount, int memberId) {
		dao.updateShoppingCart(cartId, productAmount, memberId);
	}
	
	@Override
	public void saveShoppingCart(int productDetailId, int productAmount, int memberId) {
		dao.saveShoppingCart(productDetailId, productAmount, memberId);
	}
	
	@Override
	public void saveOrderDetail(MemberBean member, Map<String, String> orderMap, String orderId) {
		OrdersBean order = new OrdersBean();
		order.setOseq_id(dao.getOseqId(orderId));
		List<ShoppingCartBean> shoppingCart = dao.getShoppingCart(member.getMember_id());
		for (ShoppingCartBean n : shoppingCart) {
			OrderDetailsBean orderDetail = new OrderDetailsBean();
			orderDetail.setOrder_amount(n.getProduct_amount());
			orderDetail.setOrdersBean(order);
			orderDetail.setProductDetailBean(n.getProductDetailBean());
			dao.saveOrderDetail(orderDetail);
			dao.deleteShoppingCart(n.getCart_id(), member.getMember_id());
		}
	}
	
	@Transactional
	@Override
	public void saveOrder(MemberBean member, Map<String, String> orderMap, String orderId) {
		OrdersBean order = new OrdersBean();
		order.setMemberBean(member);
		order.setOrder_id(orderId);
		order.setOrderSatusBean(new OrderSatusBean(1));
		order.setReceive_men(orderMap.get("memberName"));
		order.setShipping_address(orderMap.get("memberAddress"));
		order.setOrder_date(new Timestamp(System.currentTimeMillis()));
		order.setShipping_style("貨到付款");
		dao.saveOrder(order);
	}
	@Override
	public OrdersBean getOrdersById(int orderSeqId) {
		return dao.getOrdersById(orderSeqId);
	}
	@Override
	public List<OrdersBean> getOrdersByMemberId(int memberId) {
		return dao.getOrdersByMemberId(memberId);
	}
	@Override
	public List<OrdersBean> getOrders(){
		return dao.getOrders();
	}
	@Override
	public List<OrderSatusBean> getOrderStatus(){
		return dao.getOrderStatus();
	}
	@Override
	public List<OrdersBean> getOrdersByStatusId(int statusId){
		return dao.getOrdersByStatusId(statusId);
	}
	@Override  //若訂單狀態id=2，修改訂單狀態並更新配送時間；若訂單狀態id=3，修改訂單狀態並更新完成時間；若訂單狀態id=4，修改訂單狀態
	public void updateOrderStatus(int oseqId, int statusId) {
		Date date = new Date(System.currentTimeMillis());
		if(statusId==2) {
			dao.updateOrderStatus(oseqId, dao.getOrderStatusById(statusId));
			dao.updateOrderShippingDate(oseqId, date);
		}else if(statusId==3) {
			dao.updateOrderStatus(oseqId, dao.getOrderStatusById(statusId));
			dao.updateOrderDoneDate(oseqId, date);
		}else if(statusId==4) {
			dao.updateOrderStatus(oseqId, dao.getOrderStatusById(statusId));
		}
	}
	//取得訂單總金額
//	@Override
//	public double getSubtotal(int orderId) {
//		return 0;
//	}

}
