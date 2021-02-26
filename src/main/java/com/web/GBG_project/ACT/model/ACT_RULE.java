package com.web.GBG_project.ACT.model;

import java.io.Serializable;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="ACT_RULE")
public class ACT_RULE implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer ACT_RULE_ID;
	private String ACT_RULE_NAME;
	public ACT_RULE() {
		// TODO Auto-generated constructor stub
	}
	public ACT_RULE(Integer aCT_RULE_ID, String aCT_RULE_NAME) {
		super();
		ACT_RULE_ID = aCT_RULE_ID;
		ACT_RULE_NAME = aCT_RULE_NAME;
	}
	public Integer getACT_RULE_ID() {
		return ACT_RULE_ID;
	}
	public void setACT_RULE_ID(Integer aCT_RULE_ID) {
		ACT_RULE_ID = aCT_RULE_ID;
	}
	public String getACT_RULE_NAME() {
		return ACT_RULE_NAME;
	}
	public void setACT_RULE_NAME(String aCT_RULE_NAME) {
		ACT_RULE_NAME = aCT_RULE_NAME;
	}

}
