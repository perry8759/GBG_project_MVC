package com.web.GBG_project.product.model;

import java.io.Serializable;
import java.sql.Clob;
import java.sql.Timestamp;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.sun.istack.NotNull;

@Entity
@Table(name = "product")
public class ProductBean implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer product_id;

	@NotNull
	private String product_title;

	@NotNull
	private Double product_price;

	@NotNull
	private String productNo;
	private Clob product_textdetails;
	private Timestamp onSaleTime;

	//雙向一對多，可以藉由商品找到商品客群
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "customer_category_id")
	private CustomerCategoryBean customerCategoryBean;

	//雙向一對多，可以藉由商品找到商品分類
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "category_id")
	private ProductCategoryBean productCategoryBean;

	//雙向一對多，可以藉由商品找到商品狀態
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "product_st")
	private ProductStausBean productStausBean;

	@NotNull
	private Integer product_purchases;
	@NotNull
	private Double average_score;

	//雙向一對多，可以藉由商品找到商品詳細資料
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "product_id")
	private Set<ProductDetailBean> productDetailBean = new LinkedHashSet<>();
	
	//雙向一對多，可以藉由商品找到商品照片
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "product_id")
	private Set<ProductPicBean> productPicBean = new LinkedHashSet<>();
	
	//單向多對一，可以藉由收藏清單找到商品，無法藉由商品找到收藏清單
//	@OneToMany(cascade = CascadeType.ALL)
//	@JoinColumn(name = "product_id")
//	private Set<FavoriteListBean> favoriteListBean = new LinkedHashSet<>();
	
	//雙向一對多，可以藉由商品找到商品評論
	@OneToMany(cascade = CascadeType.ALL)
	@JoinColumn(name = "product_id")
	private Set<ProductCommentBean> productCommentBean = new LinkedHashSet<>();

	// 要有預設建構子
	public ProductBean() {
	}

	public ProductBean(Integer product_id, String product_title, Double product_price, String productNo,
			Clob product_textdetails, Timestamp onSaleTime, CustomerCategoryBean customerCategoryBean,
			ProductCategoryBean productCategoryBean, ProductStausBean productStausBean, Integer product_purchases,
			Double average_score, Set<ProductDetailBean> productDetailBean, Set<ProductPicBean> productPicBean,
			Set<ProductCommentBean> productCommentBean) {
		super();
		this.product_id = product_id;
		this.product_title = product_title;
		this.product_price = product_price;
		this.productNo = productNo;
		this.product_textdetails = product_textdetails;
		this.onSaleTime = onSaleTime;
		this.customerCategoryBean = customerCategoryBean;
		this.productCategoryBean = productCategoryBean;
		this.productStausBean = productStausBean;
		this.product_purchases = product_purchases;
		this.average_score = average_score;
		this.productDetailBean = productDetailBean;
		this.productPicBean = productPicBean;
		this.productCommentBean = productCommentBean;
	}

	public Timestamp getOnSaleTime() {
		return onSaleTime;
	}

	public void setOnSaleTime(Timestamp onSaleTime) {
		this.onSaleTime = onSaleTime;
	}

	public Integer getProduct_id() {
		return product_id;
	}

	public void setProduct_id(Integer product_id) {
		this.product_id = product_id;
	}

	public String getProduct_title() {
		return product_title;
	}

	public void setProduct_title(String product_title) {
		this.product_title = product_title;
	}

	public Double getProduct_price() {
		return product_price;
	}

	public void setProduct_price(Double product_price) {
		this.product_price = product_price;
	}

	public String getProductno() {
		return productNo;
	}

	public void setProductno(String productno) {
		this.productNo = productno;
	}

	public Clob getProduct_textdetails() {
		return product_textdetails;
	}

	public void setProduct_textdetails(Clob product_textdetails) {
		this.product_textdetails = product_textdetails;
	}

	public CustomerCategoryBean getCustomerCategoryBean() {
		return customerCategoryBean;
	}

	public void setCustomerCategoryBean(CustomerCategoryBean customerCategoryBean) {
		this.customerCategoryBean = customerCategoryBean;
	}

	public ProductCategoryBean getProductCategoryBean() {
		return productCategoryBean;
	}

	public void setProductCategoryBean(ProductCategoryBean productCategoryBean) {
		this.productCategoryBean = productCategoryBean;
	}

	public ProductStausBean getProductStausBean() {
		return productStausBean;
	}

	public void setProductStausBean(ProductStausBean productStausBean) {
		this.productStausBean = productStausBean;
	}

	public Integer getProduct_purchases() {
		return product_purchases;
	}

	public void setProduct_purchases(Integer product_purchases) {
		this.product_purchases = product_purchases;
	}

	public Double getAverage_score() {
		return average_score;
	}

	public void setAverage_score(Double average_score) {
		this.average_score = average_score;
	}

	public Set<ProductDetailBean> getProductDetailBean() {
		return productDetailBean;
	}

	public void setProductDetailBean(Set<ProductDetailBean> productDetailBean) {
		this.productDetailBean = productDetailBean;
	}
	
//	public Set<FavoriteListBean> getFavoriteListBean() {
//		return favoriteListBean;
//	}
//
//	public void setFavoriteListBean(Set<FavoriteListBean> favoriteListBean) {
//		this.favoriteListBean = favoriteListBean;
//	}

	public String getProductNo() {
		return productNo;
	}

	public void setProductNo(String productNo) {
		this.productNo = productNo;
	}

	public Set<ProductPicBean> getProductPicBean() {
		return productPicBean;
	}

	public void setProductPicBean(Set<ProductPicBean> productPicBean) {
		this.productPicBean = productPicBean;
	}

	public Set<ProductCommentBean> getProductCommentBean() {
		return productCommentBean;
	}

	public void setProductCommentBean(Set<ProductCommentBean> productCommentBean) {
		this.productCommentBean = productCommentBean;
	}

}
