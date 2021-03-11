package com.web.GBG_project.course.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="match_status")
public class MatchStatusBean {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer match_status_id;
	private String match_status_name;
	
	
	public MatchStatusBean() {
		super();
	}
	public MatchStatusBean(String match_status_name) {
		super();
		this.match_status_name = match_status_name;
	}
	public Integer getMatch_status_id() {
		return match_status_id;
	}
	public void setMatch_status_id(Integer match_status_id) {
		this.match_status_id = match_status_id;
	}
	public String getMatch_status_name() {
		return match_status_name;
	}
	public void setMatch_status_name(String match_status_name) {
		this.match_status_name = match_status_name;
	}

}

