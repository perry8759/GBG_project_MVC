package com.web.GBG_project.course.model;

import java.io.Serializable;
import java.sql.Timestamp;
import java.util.LinkedList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.web.GBG_project.ACT.model.ACT;

@Entity
@Table(name="match_main")
public class MatchBean implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer match_id;
	
	//雙向多對一，多個賽局會屬於同一個活動
	@JsonIgnore	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ACT_ID")
	private ACT act_id;
	
	//單向多對一，此賽局為何種賽局狀態
	@JsonIgnore
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "match_status_id")
	private MatchStatusBean match_status_id;
	
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Taipei")
	private Timestamp match_time;
	private int match_seq;
	
	private Integer match_round;
	private Integer member_id;
	
	public Integer getMatch_round() {
		return match_round;
	}

	public void setMatch_round(Integer match_round) {
		this.match_round = match_round;
	}

	public Integer getMember_id() {
		return member_id;
	}

	public void setMember_id(Integer member_id) {
		this.member_id = member_id;
	}

	//雙向一對多 (此賽局中的配對隊伍與分數)
	@OneToMany(cascade = CascadeType.ALL,mappedBy = "match_id")
	List<MatchPairBean> scores=new LinkedList<>();

	public MatchBean() {
		super();
	}

	public Integer getMatch_id() {
		return match_id;
	}

	public void setMatch_id(Integer match_id) {
		this.match_id = match_id;
	}

	public ACT getAct_id() {
		return act_id;
	}

	public void setAct_id(ACT act_id) {
		this.act_id = act_id;
	}

	public MatchStatusBean getMatch_status_id() {
		return match_status_id;
	}

	public void setMatch_status_id(MatchStatusBean match_status_id) {
		this.match_status_id = match_status_id;
	}

	public Timestamp getMatch_time() {
		return match_time;
	}

	public void setMatch_time(Timestamp match_time) {
		this.match_time = match_time;
	}

	public int getMatch_seq() {
		return match_seq;
	}

	public void setMatch_seq(int match_seq) {
		this.match_seq = match_seq;
	}

	public List<MatchPairBean> getScores() {
		return scores;
	}

	public void setScores(List<MatchPairBean> scores) {
		this.scores = scores;
	}

}
