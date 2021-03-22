package com.web.GBG_project.ACT.model;

import java.io.Serializable;
import java.sql.Clob;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
//單向多對一
@Entity
@Table(name="ACT_QES")
public class ACT_QES implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer ACT_QES_ID;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "ACT_ID")
    private ACT act;
	
    private Integer MEMBER_ID;
    private Clob ACT_QES_COM;
	public ACT_QES() {
		// TODO Auto-generated constructor stub
	}
	public ACT_QES(Integer aCT_QES_ID, Integer mEMBER_ID, Clob aCT_QES_COM) {
		super();
		ACT_QES_ID = aCT_QES_ID;
		MEMBER_ID = mEMBER_ID;
		ACT_QES_COM = aCT_QES_COM;
	}
	
	
	public Integer getACT_QES_ID() {
		return ACT_QES_ID;
	}
	public void setACT_QES_ID(Integer aCT_QES_ID) {
		ACT_QES_ID = aCT_QES_ID;
	}
	public Integer getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(Integer mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public Clob getACT_QES_COM() {
		return ACT_QES_COM;
	}
	public void setACT_QES_COM(Clob aCT_QES_COM) {
		ACT_QES_COM = aCT_QES_COM;
	}
	public ACT getAct() {
		return act;
	}
	public void setAct(ACT act) {
		this.act = act;
	}

}
