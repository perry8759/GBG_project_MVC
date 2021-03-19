package com.web.GBG_project.shoppingCart.service;

import java.util.List;

import com.web.GBG_project.shoppingCart.model.OrderSatusBean;
import com.web.GBG_project.shoppingCart.model.OrdersBean;

public interface ShoppingCartService {
	List<OrdersBean> getOrdersByMemberId(int memberId);

	List<OrdersBean> getOrders();

	List<OrderSatusBean> getOrderStatus();

	List<OrdersBean> getOrdersByStatusId(int statusId);
	OrdersBean getOrdersById(int orderSeqId);
	void updateOrderStatus(int oseqId, int statusId);
//	double getSubtotal(int orderId); //取得訂單總金額
}
