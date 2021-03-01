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
@Table(name="product_category")
public class ProductCategoryBean implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer category_id;
	@NotNull
	private String category_name;
	
	//雙向一對多，可以藉由商品分類找到商品
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "category_id")
	private Set<ProductBean> productBean = new LinkedHashSet<>();
	
	// 要有預設建構子
	public ProductCategoryBean() {
	}

	public ProductCategoryBean(Integer category_id, String category_name, Set<ProductBean> productBean) {
		super();
		this.category_id = category_id;
		this.category_name = category_name;
		this.productBean = productBean;
	}

	public Integer getCategory_id() {
		return category_id;
	}

	public void setCategory_id(Integer category_id) {
		this.category_id = category_id;
	}

	public String getCategory_name() {
		return category_name;
	}

	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}

	public Set<ProductBean> getProductBean() {
		return productBean;
	}

	public void setProductBean(Set<ProductBean> productBean) {
		this.productBean = productBean;
	}
	
}
