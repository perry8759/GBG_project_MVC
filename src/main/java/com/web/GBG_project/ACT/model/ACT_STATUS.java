package com.web.GBG_project.ACT.model;

import java.io.Serializable;
import java.util.LinkedHashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;



//單向一對多 可以從活動狀態找到所有活動
@Entity
@Table(name="ACT_STATUS")
public class ACT_STATUS implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer ACT_STATUS_ID;
    private String ACT_STATUS_NAME;
    @OneToMany(mappedBy = "act_status", cascade = CascadeType.ALL)
	//對ACT新增欄位外鍵(改雙向map)
	private Set<ACT> act = new LinkedHashSet<>();
	public ACT_STATUS() {
		// TODO Auto-generated constructor stub
	}
	public ACT_STATUS(Integer aCT_STATUS_ID, String aCT_STATUS_NAME) {
		super();
		ACT_STATUS_ID = aCT_STATUS_ID;
		ACT_STATUS_NAME = aCT_STATUS_NAME;
		
	}
	public Integer getACT_STATUS_ID() {
		return ACT_STATUS_ID;
	}
	public void setACT_STATUS_ID(Integer aCT_STATUS_ID) {
		ACT_STATUS_ID = aCT_STATUS_ID;
	}
	public String getACT_STATUS_NAME() {
		return ACT_STATUS_NAME;
	}
	public void setACT_STATUS_NAME(String aCT_STATUS_NAME) {
		ACT_STATUS_NAME = aCT_STATUS_NAME;
	}
	public Set<ACT> getAct() {
		return act;
	}
	public void setAct(Set<ACT> act) {
		this.act = act;
	}
    
}
