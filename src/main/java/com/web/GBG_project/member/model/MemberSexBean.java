package com.web.GBG_project.member.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="member_sex")
public class MemberSexBean implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer member_sex_id;
	private String member_sex_name;
	
	public MemberSexBean() {
		
	}
	public MemberSexBean(String member_sex_name) {
		super();
		this.member_sex_name = member_sex_name;
	}
	
	public Integer getMember_sex_id() {
		return member_sex_id;
	}
	public void setMember_sex_id(Integer member_sex_id) {
		this.member_sex_id = member_sex_id;
	}
	public String getMember_sex_name() {
		return member_sex_name;
	}
	public void setMember_sex_name(String member_sex_name) {
		this.member_sex_name = member_sex_name;
	}
	
	
}
