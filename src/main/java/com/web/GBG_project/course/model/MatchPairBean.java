package com.web.GBG_project.course.model;

import java.io.Serializable;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="match_pair")
public class MatchPairBean implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer match_pair_id;
	
	//雙向多對一，此配對屬於某單局
	@JsonIgnore
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "match_id")
	private MatchBean match_id;
	
	//雙向多對一，此配對中兩隊伍之一
	@JsonIgnore
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "match_team_id")
	private MatchTeamBean match_team_id;
	
	private int match_pair_score;

	public MatchPairBean() {
		super();
	}

	public MatchPairBean(MatchTeamBean match_team_id, int match_pair_score) {
		super();
		this.match_team_id = match_team_id;
		this.match_pair_score = match_pair_score;
	}

	public Integer getMatch_pair_id() {
		return match_pair_id;
	}

	public void setMatch_pair_id(Integer match_pair_id) {
		this.match_pair_id = match_pair_id;
	}

	public MatchBean getMatch_id() {
		return match_id;
	}

	public void setMatch_id(MatchBean match_id) {
		this.match_id = match_id;
	}

	public MatchTeamBean getMatch_team_id() {
		return match_team_id;
	}

	public void setMatch_team_id(MatchTeamBean match_team_id) {
		this.match_team_id = match_team_id;
	}

	public int getMatch_pair_score() {
		return match_pair_score;
	}

	public void setMatch_pair_score(int match_pair_score) {
		this.match_pair_score = match_pair_score;
	}
}

