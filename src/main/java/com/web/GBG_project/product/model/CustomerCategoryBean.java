package com.web.GBG_project.product.model;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.sun.istack.NotNull;

@Entity
@Table(name="customer_category")
public class CustomerCategoryBean implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer customer_category_id;
	
	@NotNull
	private String customer_category_name;
	
	//雙向一對多，可以藉由商品客群找到商品
//	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "customer_category_id")
	private Set<ProductBean> productBean = new LinkedHashSet<>();
	
	// 要有預設建構子
	public CustomerCategoryBean() {
	}

	public CustomerCategoryBean(Integer customer_category_id, String customer_category_name,
			Set<ProductBean> productBean) {
		super();
		this.customer_category_id = customer_category_id;
		this.customer_category_name = customer_category_name;
		this.productBean = productBean;
	}

	public Integer getCustomer_category_id() {
		return customer_category_id;
	}

	public void setCustomer_category_id(Integer customer_category_id) {
		this.customer_category_id = customer_category_id;
	}

	public String getCustomer_category_name() {
		return customer_category_name;
	}

	public void setCustomer_category_name(String customer_category_name) {
		this.customer_category_name = customer_category_name;
	}

	public Set<ProductBean> getProductBean() {
		return productBean;
	}

	public void setProductBean(Set<ProductBean> productBean) {
		this.productBean = productBean;
	}

	@Override
	public String toString() {
		return "CustomerCategoryBean [customer_category_id=" + customer_category_id + ", customer_category_name="
				+ customer_category_name + ", productBean=" + productBean + "]";
	}

	
	
}