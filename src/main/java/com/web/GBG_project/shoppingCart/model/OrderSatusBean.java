package com.web.GBG_project.shoppingCart.model;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.sun.istack.NotNull;

@Entity
@Table(name="order_satus")
public class OrderSatusBean implements Serializable{

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer order_st_id;
	@NotNull
	private String order_stname;
	
	//雙向一對多，可以藉由訂單狀態找到訂單
	@OneToMany(cascade=CascadeType.ALL)
	@JoinColumn(name="order_st_id")
	private Set<OrdersBean> ordersBean = new LinkedHashSet<>();
	
	//要有預設建構子
	public OrderSatusBean() {
	}

	public OrderSatusBean(Integer order_st_id, String order_stname, Set<OrdersBean> ordersBean) {
		super();
		this.order_st_id = order_st_id;
		this.order_stname = order_stname;
		this.ordersBean = ordersBean;
	}

	public Integer getOrder_st_id() {
		return order_st_id;
	}

	public void setOrder_st_id(Integer order_st_id) {
		this.order_st_id = order_st_id;
	}

	public String getOrder_stname() {
		return order_stname;
	}

	public void setOrder_stname(String order_stname) {
		this.order_stname = order_stname;
	}

	public Set<OrdersBean> getOrdersBean() {
		return ordersBean;
	}

	public void setOrdersBean(Set<OrdersBean> ordersBean) {
		this.ordersBean = ordersBean;
	}

}
