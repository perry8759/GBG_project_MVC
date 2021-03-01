package com.web.GBG_project.product.model;

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
@Table(name = "product_staus")
public class ProductStausBean implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer product_stid;

	@NotNull
	private String product_st_name;

	//雙向一對多，可以藉由商品狀態找到商品
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "product_st")
	private Set<ProductBean> productBean = new LinkedHashSet<>();

	// 要有預設建構子
	public ProductStausBean() {
	}

	public ProductStausBean(Integer product_stid, String product_st_name, Set<ProductBean> productBean) {
		super();
		this.product_stid = product_stid;
		this.product_st_name = product_st_name;
		this.productBean = productBean;
	}

	public Integer getProduct_stid() {
		return product_stid;
	}

	public void setProduct_stid(Integer product_stid) {
		this.product_stid = product_stid;
	}

	public String getProduct_st_name() {
		return product_st_name;
	}

	public void setProduct_st_name(String product_st_name) {
		this.product_st_name = product_st_name;
	}

	public Set<ProductBean> getProductBean() {
		return productBean;
	}

	public void setProductBean(Set<ProductBean> productBean) {
		this.productBean = productBean;
	}

}
