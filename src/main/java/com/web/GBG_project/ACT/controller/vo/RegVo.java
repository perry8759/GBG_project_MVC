package com.web.GBG_project.ACT.controller.vo;

import java.util.LinkedList;
import java.util.List;

public class RegVo {
	
	public RegVo() {
		super();
	}
	private Integer match_team_id;
	private String team_name;
	private String team_unit;
	private Integer act_id; 
	private List<String> members_account=new LinkedList<>();
	public Integer getMatch_team_id() {
		return match_team_id;
	}
	public void setMatch_team_id(Integer match_team_id) {
		this.match_team_id = match_team_id;
	}
	public String getTeam_name() {
		return team_name;
	}
	public void setTeam_name(String team_name) {
		this.team_name = team_name;
	}
	public String getTeam_unit() {
		return team_unit;
	}
	public void setTeam_unit(String team_unit) {
		this.team_unit = team_unit;
	}
	public Integer getAct_id() {
		return act_id;
	}
	public void setAct_id(Integer act_id) {
		this.act_id = act_id;
	}
	public List<String> getMembers_account() {
		return members_account;
	}
	public void setMembers_account(List<String> members_account) {
		this.members_account = members_account;
	}
}
