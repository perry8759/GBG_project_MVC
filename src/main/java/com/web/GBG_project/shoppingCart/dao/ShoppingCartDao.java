package com.web.GBG_project.shoppingCart.dao;

import java.util.Date;
import java.util.List;

import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.shoppingCart.model.FavoriteListBean;
import com.web.GBG_project.shoppingCart.model.OrderSatusBean;
import com.web.GBG_project.shoppingCart.model.OrdersBean;

public interface ShoppingCartDao {
	OrderSatusBean getOrderStatusById(int orderStatusId);
	OrdersBean getOrdersById(int orderSeqId);
	List<OrdersBean> getOrders();
	List<OrdersBean> getOrdersByMemberId(int memberId);
	List<OrderSatusBean> getOrderStatus();
	List<FavoriteListBean> getFavoriteListByMember(MemberBean member);
	List<OrdersBean> getOrdersByStatusId(int statusId);
	void updateOrderStatus(int oseqId, OrderSatusBean orderStatus);
	void updateOrderShippingDate(int oseqId, Date shipping_date);
	void updateOrderDoneDate(int oseqId, Date order_done_date);
//	Double getSubtotal(int orderId); //取得訂單總金額

}
