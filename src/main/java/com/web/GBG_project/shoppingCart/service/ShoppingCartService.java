package com.web.GBG_project.shoppingCart.service;

import java.util.List;
import java.util.Map;

import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.shoppingCart.model.OrderSatusBean;
import com.web.GBG_project.shoppingCart.model.OrdersBean;
import com.web.GBG_project.shoppingCart.model.ShoppingCartBean;


public interface ShoppingCartService {
	List<OrdersBean> getOrdersByMemberId(int memberId);
	List<OrdersBean> getOrders();
	List<OrderSatusBean> getOrderStatus();
	List<OrdersBean> getOrdersByStatusId(int statusId);
	OrdersBean getOrdersById(int orderSeqId);
	void updateOrderStatus(int oseqId, int statusId);
//	double getSubtotal(int orderId); //取得訂單總金額

	List<ShoppingCartBean> getShoppingCart(int memberId);
	void deleteShoppingCart(int cartId, int memberId);
	void updateShoppingCart(int cartId, int productAmount, int memberId);
	void saveShoppingCart(int productDetailId, int productAmount, int memberId);
	void saveOrderDetail(MemberBean member, Map<String, String> orderMap, String orderId);
	void saveOrder(MemberBean member, Map<String, String> orderMap, String orderId);
}
