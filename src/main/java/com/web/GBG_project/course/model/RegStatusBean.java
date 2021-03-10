package com.web.GBG_project.course.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="reg_status")
public class RegStatusBean {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer reg_status_id;
	private String regs_status_name;
	
	public RegStatusBean() {
	}
	public RegStatusBean(String regs_status_name) {
		super();
		this.regs_status_name = regs_status_name;
	}
	
	public Integer getReg_status_id() {
		return reg_status_id;
	}
	public void setReg_status_id(Integer reg_status_id) {
		this.reg_status_id = reg_status_id;
	}
	public String getRegs_status_name() {
		return regs_status_name;
	}
	public void setRegs_status_name(String regs_status_name) {
		this.regs_status_name = regs_status_name;
	}
	
}

