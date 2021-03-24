package com.web.GBG_project.util;

import java.sql.Blob;

import org.springframework.web.multipart.MultipartFile;

import com.web.GBG_project.product.model.ProductBean;

public class ProductPicturesVO {
	
	private ProductBean productBean;
	//資料庫流水號
	private Integer product_pic_id_0;
	private Integer product_pic_id_1;
	private Integer product_pic_id_2;
	private Integer product_pic_id_3;
	private Integer product_pic_id_4;
	private Integer product_pic_id_5;
	
	//DB商品照片
	private Blob product_pic_img_0;
	private Blob product_pic_img_1;
	private Blob product_pic_img_2;
	private Blob product_pic_img_3;
	private Blob product_pic_img_4;
	private Blob product_pic_img_5;
	
	MultipartFile productImage_0;
	MultipartFile productImage_1;
	MultipartFile productImage_2;
	MultipartFile productImage_3;
	MultipartFile productImage_4;
	MultipartFile productImage_5;
	
	//照片排序
	private Integer product_pic_seq_0;
	private Integer product_pic_seq_1;
	private Integer product_pic_seq_2;
	private Integer product_pic_seq_3;
	private Integer product_pic_seq_4;
	private Integer product_pic_seq_5;
	
	public ProductPicturesVO() {
		super();
	}
	public ProductBean getProductBean() {
		return productBean;
	}
	public void setProductBean(ProductBean productBean) {
		this.productBean = productBean;
	}
	public MultipartFile getProductImage_0() {
		return productImage_0;
	}
	public void setProductImage_0(MultipartFile productImage_0) {
		this.productImage_0 = productImage_0;
	}
	public MultipartFile getProductImage_1() {
		return productImage_1;
	}
	public void setProductImage_1(MultipartFile productImage_1) {
		this.productImage_1 = productImage_1;
	}
	public MultipartFile getProductImage_2() {
		return productImage_2;
	}
	public void setProductImage_2(MultipartFile productImage_2) {
		this.productImage_2 = productImage_2;
	}
	public MultipartFile getProductImage_3() {
		return productImage_3;
	}
	public void setProductImage_3(MultipartFile productImage_3) {
		this.productImage_3 = productImage_3;
	}
	public MultipartFile getProductImage_4() {
		return productImage_4;
	}
	public void setProductImage_4(MultipartFile productImage_4) {
		this.productImage_4 = productImage_4;
	}
	public MultipartFile getProductImage_5() {
		return productImage_5;
	}
	public void setProductImage_5(MultipartFile productImage_5) {
		this.productImage_5 = productImage_5;
	}
	public Blob getProduct_pic_img_0() {
		return product_pic_img_0;
	}
	public void setProduct_pic_img_0(Blob product_pic_img_0) {
		this.product_pic_img_0 = product_pic_img_0;
	}
	public Blob getProduct_pic_img_1() {
		return product_pic_img_1;
	}
	public void setProduct_pic_img_1(Blob product_pic_img_1) {
		this.product_pic_img_1 = product_pic_img_1;
	}
	public Blob getProduct_pic_img_2() {
		return product_pic_img_2;
	}
	public void setProduct_pic_img_2(Blob product_pic_img_2) {
		this.product_pic_img_2 = product_pic_img_2;
	}
	public Blob getProduct_pic_img_3() {
		return product_pic_img_3;
	}
	public void setProduct_pic_img_3(Blob product_pic_img_3) {
		this.product_pic_img_3 = product_pic_img_3;
	}
	public Blob getProduct_pic_img_4() {
		return product_pic_img_4;
	}
	public void setProduct_pic_img_4(Blob product_pic_img_4) {
		this.product_pic_img_4 = product_pic_img_4;
	}
	public Blob getProduct_pic_img_5() {
		return product_pic_img_5;
	}
	public void setProduct_pic_img_5(Blob product_pic_img_5) {
		this.product_pic_img_5 = product_pic_img_5;
	}
	public Integer getProduct_pic_seq_0() {
		return product_pic_seq_0;
	}
	public void setProduct_pic_seq_0(Integer product_pic_seq_0) {
		this.product_pic_seq_0 = product_pic_seq_0;
	}
	public Integer getProduct_pic_seq_1() {
		return product_pic_seq_1;
	}
	public void setProduct_pic_seq_1(Integer product_pic_seq_1) {
		this.product_pic_seq_1 = product_pic_seq_1;
	}
	public Integer getProduct_pic_seq_2() {
		return product_pic_seq_2;
	}
	public void setProduct_pic_seq_2(Integer product_pic_seq_2) {
		this.product_pic_seq_2 = product_pic_seq_2;
	}
	public Integer getProduct_pic_seq_3() {
		return product_pic_seq_3;
	}
	public void setProduct_pic_seq_3(Integer product_pic_seq_3) {
		this.product_pic_seq_3 = product_pic_seq_3;
	}
	public Integer getProduct_pic_seq_4() {
		return product_pic_seq_4;
	}
	public void setProduct_pic_seq_4(Integer product_pic_seq_4) {
		this.product_pic_seq_4 = product_pic_seq_4;
	}
	public Integer getProduct_pic_seq_5() {
		return product_pic_seq_5;
	}
	public void setProduct_pic_seq_5(Integer product_pic_seq_5) {
		this.product_pic_seq_5 = product_pic_seq_5;
	}
	public Integer getProduct_pic_id_0() {
		return product_pic_id_0;
	}
	public void setProduct_pic_id_0(Integer product_pic_id_0) {
		this.product_pic_id_0 = product_pic_id_0;
	}
	public Integer getProduct_pic_id_1() {
		return product_pic_id_1;
	}
	public void setProduct_pic_id_1(Integer product_pic_id_1) {
		this.product_pic_id_1 = product_pic_id_1;
	}
	public Integer getProduct_pic_id_2() {
		return product_pic_id_2;
	}
	public void setProduct_pic_id_2(Integer product_pic_id_2) {
		this.product_pic_id_2 = product_pic_id_2;
	}
	public Integer getProduct_pic_id_3() {
		return product_pic_id_3;
	}
	public void setProduct_pic_id_3(Integer product_pic_id_3) {
		this.product_pic_id_3 = product_pic_id_3;
	}
	public Integer getProduct_pic_id_4() {
		return product_pic_id_4;
	}
	public void setProduct_pic_id_4(Integer product_pic_id_4) {
		this.product_pic_id_4 = product_pic_id_4;
	}
	public Integer getProduct_pic_id_5() {
		return product_pic_id_5;
	}
	public void setProduct_pic_id_5(Integer product_pic_id_5) {
		this.product_pic_id_5 = product_pic_id_5;
	}
	
}
