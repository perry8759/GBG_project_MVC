package com.web.GBG_project.shoppingCart.dao;

import java.util.Date;
import java.util.List;
import java.util.Date;

import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.shoppingCart.model.FavoriteListBean;
import com.web.GBG_project.shoppingCart.model.OrderSatusBean;
import com.web.GBG_project.shoppingCart.model.OrdersBean;
import com.web.GBG_project.shoppingCart.model.OrderDetailsBean;
import com.web.GBG_project.shoppingCart.model.ShoppingCartBean;
import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.shoppingCart.model.FavoriteListBean;
import com.web.GBG_project.shoppingCart.model.OrderSatusBean;

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

	void saveShoppingCart(int productDetailId, int productAmount, int memberId);
	void updateShoppingCart(int cartId, int productAmount, int memberId);
	void deleteShoppingCart(int cartId, int memberId);
	List<ShoppingCartBean> getShoppingCart(int memberId);
	void saveOrder(OrdersBean order);
	void saveOrderDetail(OrderDetailsBean orderDetail);
}
