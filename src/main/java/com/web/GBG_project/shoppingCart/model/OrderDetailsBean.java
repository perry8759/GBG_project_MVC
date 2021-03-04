package com.web.GBG_project.shoppingCart.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.sun.istack.NotNull;
import com.web.GBG_project.product.model.ProductDetailBean;

@Entity
@Table(name="order_details")
public class OrderDetailsBean implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer odseq_id;
	@NotNull
	private Integer order_amount;
	
	//雙向一對多，可以藉由訂單細項找到訂單
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="order_id")
	private OrdersBean ordersBean;
	
	//雙向一對多，可以藉由訂單細項找到商品詳細資料
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="product_detail_id")
	private ProductDetailBean productDetailBean;
	
	//要有預設建構子
	public OrderDetailsBean() {
	}

	public OrderDetailsBean(Integer odseq_id, Integer order_amount, OrdersBean ordersBean,
			ProductDetailBean productDetailBean) {
		super();
		this.odseq_id = odseq_id;
		this.order_amount = order_amount;
		this.ordersBean = ordersBean;
		this.productDetailBean = productDetailBean;
	}

	public Integer getOdseq_id() {
		return odseq_id;
	}

	public void setOdseq_id(Integer odseq_id) {
		this.odseq_id = odseq_id;
	}

	public Integer getOrder_amount() {
		return order_amount;
	}

	public void setOrder_amount(Integer order_amount) {
		this.order_amount = order_amount;
	}

	public OrdersBean getOrdersBean() {
		return ordersBean;
	}

	public void setOrdersBean(OrdersBean ordersBean) {
		this.ordersBean = ordersBean;
	}

	public ProductDetailBean getProductDetailBean() {
		return productDetailBean;
	}

	public void setProductDetailBean(ProductDetailBean productDetailBean) {
		this.productDetailBean = productDetailBean;
	}
	
}
