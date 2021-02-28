package com.web.GBG_project.member.model;

import java.io.Serializable;
import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;
@Entity
@Table(name = "member")
public class MemberBean implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer member_id;
	private String member_account;
	private String member_pw;
	@Transient
	private String again_pw;
	private String member_real_name;
	private String member_tax_id_number;
	private String member_user_name;
	private String member_cp_name;
	//單向多對一，可找到member_sex中對應之性別
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "member_sex_id")
	private MemberSexBean member_sex_id;
	private String member_email;
	private String member_mobile_phone;
	private String member_fixed_line_telephone;
	private Date member_birthday;
	private String member_address;
	private Blob member_image;
	private Timestamp member_register_date;
	
	//單向多對一，可找到member_perm中對應之權限
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "member_perm_id")
	private MemberPermBean member_perm_id;
	
	//單向多對一，可找到manage_status中對應之權限
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "manage_status_id")
	private ManageStatusBean manage_status_id;
	@Transient
	MultipartFile productImage;
	
	public MemberBean() {

	}

	public MemberBean(Integer member_id, String member_account, String member_pw, String member_real_name,
			String member_tax_id_number, String member_user_name, String member_cp_name, MemberSexBean member_sex_id,
			String member_email, String member_mobile_phone, String member_fixed_line_telephone, Date member_birthday,
			String member_address, Blob member_image, Timestamp member_register_date, MemberPermBean member_perm_id) {
		super();
		this.member_id = member_id;
		this.member_account = member_account;
		this.member_pw = member_pw;
		this.member_real_name = member_real_name;
		this.member_tax_id_number = member_tax_id_number;
		this.member_user_name = member_user_name;
		this.member_cp_name = member_cp_name;
		this.member_sex_id = member_sex_id;
		this.member_email = member_email;
		this.member_mobile_phone = member_mobile_phone;
		this.member_fixed_line_telephone = member_fixed_line_telephone;
		this.member_birthday = member_birthday;
		this.member_address = member_address;
		this.member_image = member_image;
		this.member_register_date = member_register_date;
		this.member_perm_id = member_perm_id;
	}

//	public MemberBean(Integer member_id, String member_account, String member_pw, String member_real_name,
//			String member_tax_id_number, String member_user_name, String member_cp_name, MemberSexBean member_sex_id,
//			String member_email, String member_mobile_phone, String member_fixed_line_telephone, Date member_birthday,
//			String member_address, Blob member_image, Timestamp member_register_date, MemberPermBean member_perm_id,
//			Set<product.model.ProductCommentBean> productCommentBean, Set<ShoppingCartBean> shoppingCartBean,
//			Set<FavoriteListBean> favoriteListBean, Set<OrdersBean> ordersBean) {
//		super();
//		this.member_id = member_id;
//		this.member_account = member_account;
//		this.member_pw = member_pw;
//		this.member_real_name = member_real_name;
//		this.member_tax_id_number = member_tax_id_number;
//		this.member_user_name = member_user_name;
//		this.member_cp_name = member_cp_name;
//		this.member_sex_id = member_sex_id;
//		this.member_email = member_email;
//		this.member_mobile_phone = member_mobile_phone;
//		this.member_fixed_line_telephone = member_fixed_line_telephone;
//		this.member_birthday = member_birthday;
//		this.member_address = member_address;
//		this.member_image = member_image;
//		this.member_register_date = member_register_date;
//		this.member_perm_id = member_perm_id;
//		ProductCommentBean = productCommentBean;
//		this.shoppingCartBean = shoppingCartBean;
//		this.favoriteListBean = favoriteListBean;
//		this.ordersBean = ordersBean;
//	}

	public Integer getMember_id() {
		return member_id;
	}

	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}

	public String getMember_account() {
		return member_account;
	}

	public void setMember_account(String member_account) {
		this.member_account = member_account;
	}

	public String getMember_pw() {
		return member_pw;
	}

	public void setMember_pw(String member_pw) {
		this.member_pw = member_pw;
	}

	public String getMember_real_name() {
		return member_real_name;
	}

	public void setMember_real_name(String member_real_name) {
		this.member_real_name = member_real_name;
	}

	public String getMember_tax_id_number() {
		return member_tax_id_number;
	}

	public void setMember_tax_id_number(String member_tax_id_number) {
		this.member_tax_id_number = member_tax_id_number;
	}

	public String getMember_user_name() {
		return member_user_name;
	}

	public void setMember_user_name(String member_user_name) {
		this.member_user_name = member_user_name;
	}

	public String getMember_cp_name() {
		return member_cp_name;
	}

	public void setMember_cp_name(String member_cp_name) {
		this.member_cp_name = member_cp_name;
	}

	public MemberSexBean getMember_sex_id() {
		return member_sex_id;
	}

	public void setMember_sex_id(MemberSexBean member_sex_id) {
		this.member_sex_id = member_sex_id;
	}

	public String getMember_email() {
		return member_email;
	}

	public void setMember_email(String member_email) {
		this.member_email = member_email;
	}

	public String getMember_mobile_phone() {
		return member_mobile_phone;
	}

	public void setMember_mobile_phone(String member_mobile_phone) {
		this.member_mobile_phone = member_mobile_phone;
	}

	public String getMember_fixed_line_telephone() {
		return member_fixed_line_telephone;
	}

	public void setMember_fixed_line_telephone(String member_fixed_line_telephone) {
		this.member_fixed_line_telephone = member_fixed_line_telephone;
	}

	public Date getMember_birthday() {
		return member_birthday;
	}

	public void setMember_birthday(Date member_birthday) {
		this.member_birthday = member_birthday;
	}

	public String getMember_address() {
		return member_address;
	}

	public void setMember_address(String member_address) {
		this.member_address = member_address;
	}

	public Blob getMember_image() {
		return member_image;
	}

	public void setMember_image(Blob member_image) {
		this.member_image = member_image;
	}

	public Timestamp getMember_register_date() {
		return member_register_date;
	}

	public void setMember_register_date(Timestamp member_register_date) {
		this.member_register_date = member_register_date;
	}

	public MemberPermBean getMember_perm_id() {
		return member_perm_id;
	}

	public void setMember_perm_id(MemberPermBean member_perm_id) {
		this.member_perm_id = member_perm_id;
	}

	public ManageStatusBean getManage_status_id() {
		return manage_status_id;
	}

	public void setManage_status_id(ManageStatusBean manage_status_id) {
		this.manage_status_id = manage_status_id;
	}

	public String getAgain_pw() {
		return again_pw;
	}

	public void setAgain_pw(String again_pw) {
		this.again_pw = again_pw;
	}

	public MultipartFile getProductImage() {
		return productImage;
	}

	public void setProductImage(MultipartFile productImage) {
		this.productImage = productImage;
	}

	@Override
	public String toString() {
		return "MemberBean [member_id=" + member_id + ", member_account=" + member_account + ", member_pw=" + member_pw
				+ ", again_pw=" + again_pw + ", member_real_name=" + member_real_name + ", member_tax_id_number="
				+ member_tax_id_number + ", member_user_name=" + member_user_name + ", member_cp_name=" + member_cp_name
				+ ", member_sex_id=" + member_sex_id + ", member_email=" + member_email + ", member_mobile_phone="
				+ member_mobile_phone + ", member_fixed_line_telephone=" + member_fixed_line_telephone
				+ ", member_birthday=" + member_birthday + ", member_address=" + member_address + ", member_image="
				+ member_image + ", member_register_date=" + member_register_date + ", member_perm_id=" + member_perm_id
				+ ", manage_status_id=" + manage_status_id + ", productImage=" + productImage + "]";
	}

	
	
}
