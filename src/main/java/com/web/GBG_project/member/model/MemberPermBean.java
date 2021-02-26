package com.web.GBG_project.member.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="member_perm")
public class MemberPermBean implements Serializable{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer member_perm_id;
	private String member_perm_name;
	
	public MemberPermBean() {
		
	}
	public MemberPermBean(String member_perm_name) {
		super();
		this.member_perm_name = member_perm_name;
	}
	
	public Integer getMember_perm_id() {
		return member_perm_id;
	}
	public void setMember_perm_id(Integer member_perm_id) {
		this.member_perm_id = member_perm_id;
	}
	public String getMember_perm_name() {
		return member_perm_name;
	}
	public void setMember_perm_name(String member_perm_name) {
		this.member_perm_name = member_perm_name;
	}
	
	
}
