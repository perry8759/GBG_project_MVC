//model
package com.web.GBG_project.ACT.model;

import java.io.Serializable;
import java.sql.Clob;
import java.sql.Timestamp;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
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
import com.web.GBG_project.DOS.model.DOS;
import com.web.GBG_project.DOS.model.DOS_SPORT;


@Entity
@Table(name="ACT")
public class ACT implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column( nullable = false)
	private Integer ACT_ID;
	private Integer MEMBER_ID;
	@ManyToOne
	@JoinColumn(name = "dos_id")
	DOS dos_id;
	//private int DOS_ID;由DOS新增外鍵
	private String ACT_TITLE;
	
	private String ACT_DESC;
	private Integer ACT_MAX_TEAM;//每隊最大上限人數
	private Integer ACT_MAX_PNUM;//最大上限人數
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Taipei")
	private Timestamp ACT_SIGN_O;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Taipei")
	private Timestamp ACT_SIGN_C;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Taipei")
	private Timestamp ACT_RUN_O;
    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone="Asia/Taipei")
	private Timestamp ACT_RUN_C;
	private Integer ACT_PAY;
	//雙向多對一 ，可從活動找到該運動種類
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "dos_sport_id")
	
	DOS_SPORT dos_sport;
	//雙向多對一，可從活動找到活動狀態
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "act_status_id")
	
	ACT_STATUS act_status;
	
	private byte[] ACT_LOGO;
	private Integer ACT_PNUM;
	//單向多對一，可從活動找到活動賽制
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "act_rule_id")
	
	private ACT_RULE act_rule;
	private Clob ACT_NEWS;
	//單向一對多，可從活動找到多個文件
	@OneToMany(cascade = CascadeType.PERSIST, orphanRemoval = true,fetch=FetchType.EAGER)
	@JoinColumn(name = "ACT_ID", referencedColumnName = "ACT_ID")
	
	//對ACT_RFORM新增欄位外鍵，當活動刪除時需先將所有活動文件刪除
	private Set<ACT_RFORM> act_rform = new HashSet<>();
	//單向一對多，可從活動找到多個問答
	@OneToMany(cascade = CascadeType.PERSIST, orphanRemoval = true,fetch=FetchType.EAGER)
	@JoinColumn(name = "ACT_ID", referencedColumnName = "ACT_ID")
	
	//對ACT_RFORM新增欄位外鍵，當活動刪除時需先將所有活動問答刪除
	private Set<ACT_QES> act_qes = new HashSet<>();
	public ACT() {
		
	}
	public ACT(Integer aCT_ID, Integer mEMBER_ID, DOS dos_id, String aCT_TITLE, String aCT_DESC, Integer aCT_MAX_TEAM,
			Integer aCT_MAX_PNUM, Timestamp aCT_SIGN_O, Timestamp aCT_SIGN_C, Timestamp aCT_RUN_O, Timestamp aCT_RUN_C,
			Integer aCT_PAY, DOS_SPORT dos_sport, ACT_STATUS act_status, byte[] aCT_LOGO, Integer aCT_PNUM,
			ACT_RULE act_rule, Clob aCT_NEWS,Set<ACT_RFORM> act_rform,Set<ACT_QES> act_qes) {
		super();
		ACT_ID = aCT_ID;
		MEMBER_ID = mEMBER_ID;
		this.dos_id = dos_id;
		ACT_TITLE = aCT_TITLE;
		ACT_DESC = aCT_DESC;
		ACT_MAX_TEAM = aCT_MAX_TEAM;
		ACT_MAX_PNUM = aCT_MAX_PNUM;
		ACT_SIGN_O = aCT_SIGN_O;
		ACT_SIGN_C = aCT_SIGN_C;
		ACT_RUN_O = aCT_RUN_O;
		ACT_RUN_C = aCT_RUN_C;
		ACT_PAY = aCT_PAY;
		this.dos_sport = dos_sport;
		this.act_status = act_status;
		ACT_LOGO = aCT_LOGO;
		ACT_PNUM = aCT_PNUM;
		this.act_rule = act_rule;
		ACT_NEWS = aCT_NEWS;
		this.act_rform=act_rform;
		this.act_qes=act_qes;
	}
	public Integer getACT_ID() {
		return ACT_ID;
	}
	public void setACT_ID(Integer aCT_ID) {
		ACT_ID = aCT_ID;
	}
	public Integer getMEMBER_ID() {
		return MEMBER_ID;
	}
	public void setMEMBER_ID(Integer mEMBER_ID) {
		MEMBER_ID = mEMBER_ID;
	}
	public DOS getDos_id() {
		return dos_id;
	}
	public void setDos_id(DOS dos_id) {
		this.dos_id = dos_id;
	}
	public String getACT_TITLE() {
		return ACT_TITLE;
	}
	public void setACT_TITLE(String aCT_TITLE) {
		ACT_TITLE = aCT_TITLE;
	}
	public String getACT_DESC() {
		return ACT_DESC;
	}
	public void setACT_DESC(String aCT_DESC) {
		ACT_DESC = aCT_DESC;
	}
	public Integer getACT_MAX_TEAM() {
		return ACT_MAX_TEAM;
	}
	public void setACT_MAX_TEAM(Integer aCT_MAX_TEAM) {
		ACT_MAX_TEAM = aCT_MAX_TEAM;
	}
	public Integer getACT_MAX_PNUM() {
		return ACT_MAX_PNUM;
	}
	public void setACT_MAX_PNUM(Integer aCT_MAX_PNUM) {
		ACT_MAX_PNUM = aCT_MAX_PNUM;
	}
	public Timestamp getACT_SIGN_O() {
		return ACT_SIGN_O;
	}
	public void setACT_SIGN_O(Timestamp aCT_SIGN_O) {
		ACT_SIGN_O = aCT_SIGN_O;
	}
	public Timestamp getACT_SIGN_C() {
		return ACT_SIGN_C;
	}
	public void setACT_SIGN_C(Timestamp aCT_SIGN_C) {
		ACT_SIGN_C = aCT_SIGN_C;
	}
	public Timestamp getACT_RUN_O() {
		return ACT_RUN_O;
	}
	public void setACT_RUN_O(Timestamp aCT_RUN_O) {
		ACT_RUN_O = aCT_RUN_O;
	}
	public Timestamp getACT_RUN_C() {
		return ACT_RUN_C;
	}
	public void setACT_RUN_C(Timestamp aCT_RUN_C) {
		ACT_RUN_C = aCT_RUN_C;
	}
	public Integer getACT_PAY() {
		return ACT_PAY;
	}
	public void setACT_PAY(Integer aCT_PAY) {
		ACT_PAY = aCT_PAY;
	}
	public DOS_SPORT getDos_sport() {
		return dos_sport;
	}
	public void setDos_sport(DOS_SPORT dos_sport) {
		this.dos_sport = dos_sport;
	}
	public ACT_STATUS getAct_status() {
		return act_status;
	}
	public void setAct_status(ACT_STATUS act_status) {
		this.act_status = act_status;
	}
	public byte[] getACT_LOGO() {
		return ACT_LOGO;
	}
	public void setACT_LOGO(byte[] aCT_LOGO) {
		ACT_LOGO = aCT_LOGO;
	}
	public Integer getACT_PNUM() {
		return ACT_PNUM;
	}
	public void setACT_PNUM(Integer aCT_PNUM) {
		ACT_PNUM = aCT_PNUM;
	}
	public ACT_RULE getAct_rule() {
		return act_rule;
	}
	public void setAct_rule(ACT_RULE act_rule) {
		this.act_rule = act_rule;
	}
	public Clob getACT_NEWS() {
		return ACT_NEWS;
	}
	public void setACT_NEWS(Clob aCT_NEWS) {
		ACT_NEWS = aCT_NEWS;
	}
	public Set<ACT_RFORM> getAct_rform() {
		return act_rform;
	}
	public void setAct_rform(Set<ACT_RFORM> act_rform) {
		this.act_rform = act_rform;
	}
	public Set<ACT_QES> getAct_qes() {
		return act_qes;
	}
	public void setAct_qes(Set<ACT_QES> act_qes) {
		this.act_qes = act_qes;
	}
	
	

	
	
	

	
}
