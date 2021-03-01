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

import com.web.GBG_project.product.model.ProductBean;

@Entity
@Table(name = "favorite_list")
public class FavoriteListBean implements Serializable {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer favorite_id;

	//單向一對多，可以藉由會員找到收藏清單，無法由收藏清單找到會員
//	@ManyToOne(cascade = CascadeType.ALL)
//	@JoinColumn(name="member_id")
//	private MemberBean memberBean;
	
	//單向多對一，可以藉由收藏清單找到商品
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="product_id")
	private ProductBean productBean;

	// 要有預設建構子
	public FavoriteListBean() {
	}

	public FavoriteListBean(Integer favorite_id, ProductBean productBean) {
		super();
		this.favorite_id = favorite_id;
//		this.memberBean = memberBean;
		this.productBean = productBean;
	}

	public Integer getFavorite_id() {
		return favorite_id;
	}

	public void setFavorite_id(Integer favorite_id) {
		this.favorite_id = favorite_id;
	}

//	public MemberBean getMemberBean() {
//		return memberBean;
//	}
//
//	public void setMemberBean(MemberBean memberBean) {
//		this.memberBean = memberBean;
//	}

	public ProductBean getProductBean() {
		return productBean;
	}

	public void setProductBean(ProductBean productBean) {
		this.productBean = productBean;
	}

}
