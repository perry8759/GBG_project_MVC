package com.web.GBG_project.ACT.model;


import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;

import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="ACT_RFORM")
public class ACT_RFORM implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
    private Integer ACT_RFORM_id;
	
    private byte[] ACT_RFORM_doc;
    
    @ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "ACT_ID")
    private ACT act;
    
	public ACT_RFORM() {
		// TODO Auto-generated constructor stub
	}

	public ACT_RFORM(Integer aCT_RFORM_id, byte[] aCT_RFORM_doc) {
		super();
		ACT_RFORM_id = aCT_RFORM_id;
		ACT_RFORM_doc = aCT_RFORM_doc;
	}

	public Integer getACT_RFORM_id() {
		return ACT_RFORM_id;
	}

	public void setACT_RFORM_id(Integer aCT_RFORM_id) {
		ACT_RFORM_id = aCT_RFORM_id;
	}

	public byte[] getACT_RFORM_doc() {
		return ACT_RFORM_doc;
	}

	public void setACT_RFORM_doc(byte[] aCT_RFORM_doc) {
		ACT_RFORM_doc = aCT_RFORM_doc;
	}

	public ACT getAct() {
		return act;
	}

	public void setAct(ACT act) {
		this.act = act;
	}

}
