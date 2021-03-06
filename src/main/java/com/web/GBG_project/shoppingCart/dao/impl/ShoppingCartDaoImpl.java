package com.web.GBG_project.shoppingCart.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.GBG_project.member.dao.MemberDao;
import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.product.model.ProductBean;
import com.web.GBG_project.shoppingCart.dao.ShoppingCartDao;
import com.web.GBG_project.shoppingCart.model.FavoriteListBean;
import com.web.GBG_project.shoppingCart.model.OrderSatusBean;
import com.web.GBG_project.shoppingCart.model.OrdersBean;
import com.web.GBG_project.shoppingCart.model.OrderDetailsBean;
import com.web.GBG_project.shoppingCart.model.ShoppingCartBean;
@Repository
public class ShoppingCartDaoImpl implements ShoppingCartDao {
	
	@Autowired
	SessionFactory factory;
	@Autowired
	MemberDao memberDao;
	@Override
	public List<FavoriteListBean> getFavoriteListByMember(MemberBean member) {
		String hql = "FROM OrdersBean WHERE member_id = :memberId";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("memberId", member).getResultList();
	}
	@Override
	public List<OrdersBean> getOrdersByStatusId(int statusId) {
		String hql = "FROM OrdersBean WHERE order_st_id = :statusId";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("statusId", getOrderStatusById(statusId)).getResultList();
	}
	@Override
	public void updateOrderStatus(int oseqId, OrderSatusBean orderStatus) {
		String hql = "UPDATE OrdersBean SET order_st_id = :newOrderSatus WHERE oseq_id = :oseqId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("oseqId", oseqId).setParameter("newOrderSatus", orderStatus).executeUpdate();
	}
	@Override
	public void updateOrderShippingDate(int oseqId, Date shipping_date) {
		String hql = "UPDATE OrdersBean SET shipping_date = :newDate WHERE oseq_id = :oseqId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("oseqId", oseqId).setParameter("newDate", shipping_date).executeUpdate();
	}
	@Override
	public void updateOrderDoneDate(int oseqId, Date order_done_date) {
		String hql = "UPDATE OrdersBean SET order_done_date = :newDate WHERE oseq_id = :oseqId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("oseqId", oseqId).setParameter("newDate", order_done_date).executeUpdate();
	}
	@Override
	public void updateShoppingCart(int cartId, int productAmount, int memberId) {
		String hql = "UPDATE ShoppingCartBean SET product_amount = :productAmount WHERE cart_id = :cartId AND member_id = :memberId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("productAmount", productAmount).setParameter("cartId", cartId).setParameter("memberId", memberId).executeUpdate();
	}
	@Override
	public void deleteShoppingCart(int cartId, int memberId) {
		String hql = "DELETE FROM ShoppingCartBean WHERE cart_id = :cartId AND member_id = :memberId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("cartId", cartId).setParameter("memberId", memberId).executeUpdate();
	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<ShoppingCartBean> getShoppingCart(int memberId) {
		String hql = "FROM ShoppingCartBean sc WHERE member_id = :memberId";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).setParameter("memberId", memberId).getResultList();
	}

	@Override
	public void saveShoppingCart(int productDetailId, int productAmount, int memberId) {
		String hql = "INSERT INTO shopping_cart(product_amount, product_detail_id, member_id) VALUE(:productAmount, :productDetailId, :memberId)";
		Session session = factory.getCurrentSession();
		session.createSQLQuery(hql).setParameter("productAmount", productAmount).setParameter("productDetailId", productDetailId).setParameter("memberId", memberId).executeUpdate();
	}

	@Override
	public void saveOrder(OrdersBean order) {
		String sql = "INSERT INTO orders(order_date, order_id, receive_men, shipping_address, shipping_style, member_id, order_st_id, aggregate_amount)"
					+ "VALUE(:orderDate, :orderId, :receiveMen, :shippingAddress, :shippingStyle, :memberId, :orderStId, :aggregate_amount)";
		Session session = factory.getCurrentSession();
		session.createSQLQuery(sql)
			.setParameter("orderDate", order.getOrder_date())
			.setParameter("orderId", order.getOrder_id())
			.setParameter("receiveMen", order.getReceive_men())
			.setParameter("shippingAddress", order.getShipping_address())
			.setParameter("shippingStyle", order.getShipping_style())
			.setParameter("memberId", order.getMemberBean().getMember_id())
			.setParameter("orderStId", order.getOrderSatusBean().getOrder_st_id())
			.setParameter("aggregate_amount", order.getAggregate_amount())
			.executeUpdate();
	}

	@Override
	public void saveOrderDetail(OrderDetailsBean orderDetail) {
		String sql = "INSERT INTO order_details(order_amount, order_id, product_detail_id) VALUE(:orderAmount, :orderId, :productDetailId)";
		Session session = factory.getCurrentSession();
		session.createSQLQuery(sql)
			.setParameter("orderAmount", orderDetail.getOrder_amount())
			.setParameter("orderId", orderDetail.getOrdersBean().getOseq_id())
			.setParameter("productDetailId", orderDetail.getProductDetailBean().getProduct_detail_id())
			.executeUpdate();
	}

	@Override
	public Integer getOseqId(String orderId) {
		String sql = "SELECT oseq_id FROM orders WHERE order_id = :orderId";
		Session session = factory.getCurrentSession();
		return (Integer) session.createSQLQuery(sql).setParameter("orderId", orderId).uniqueResult();
	}

	@Override
	public OrderSatusBean getOrderStatusById(int orderStatusId) {
		Session session = factory.getCurrentSession();
		return session.get(OrderSatusBean.class, orderStatusId);
	}

	@Override
	public OrdersBean getOrdersById(int orderSeqId) {
		Session session = factory.getCurrentSession();
		return session.get(OrdersBean.class, orderSeqId);
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrdersBean> getOrders() {
		String hql = "FROM OrdersBean ORDER BY order_date DESC";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<OrderSatusBean> getOrderStatus() {
		String hql = "FROM OrderSatusBean";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}

	@Override
	public List<OrdersBean> getOrdersByMemberId(int memberId) {
		String hql = "FROM OrdersBean WHERE member_id = :memberId ORDER BY order_date DESC";
		Session session = factory.getCurrentSession();
//		return session.createQuery(hql).setParameter("memberId", new MemberBean(memberId)).getResultList();
		return session.createQuery(hql).setParameter("memberId", memberDao.getMember(memberId)).getResultList();
	}

//	@Override  //取得訂單總金額
//	public Double getSubtotal(int orderId) {
//		String hql = "SELECT SUM(comment_value) FROM OrderDetailsBean WHERE order_id = :orderId";
//		Session session = factory.getCurrentSession();
//		String s = session.createQuery(hql).setParameter("id", new ProductBean(pId)).getSingleResult().toString();
//		Double avg = Double.parseDouble(s);
//		return avg;
//	}
}
