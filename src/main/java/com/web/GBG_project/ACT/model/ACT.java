//model
package com.web.GBG_project.ACT.model;

import java.io.Serializable;
import java.sql.Clob;
import java.sql.Timestamp;
import java.util.Base64;
import java.util.Calendar;
import java.util.HashSet;
import java.util.LinkedHashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.Lob;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Fetch;
import org.hibernate.annotations.FetchMode;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.web.GBG_project.DOS.model.DOS;
import com.web.GBG_project.DOS.model.DOS_SPORT;
import com.web.GBG_project.course.model.MatchBean;
import com.web.GBG_project.course.model.MatchTeamBean;
import com.web.GBG_project.member.model.MemberBean;

@Entity
@Table(name = "ACT")
@JsonIgnoreProperties(value={"hibernateLazyInitializer","handler","fieldHandler"})
public class ACT implements Serializable {
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer ACT_ID;
	private Integer MEMBER_ID;
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "dos_id")
	@JsonIgnore
	DOS dos_id;
	// private int DOS_ID;由DOS新增外鍵
	private String ACT_TITLE;

	private String ACT_DESC;
	private Integer ACT_MAX_TEAM;// 每隊最大上限人數
	private Integer ACT_MAX_PNUM;// 最大上限人數
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Taipei")
	private Timestamp ACT_SIGN_O;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Taipei")
	private Timestamp ACT_SIGN_C;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Taipei")
	private Timestamp ACT_RUN_O;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Taipei")
	private Timestamp ACT_RUN_C;
	private Integer ACT_PAY;
	// 雙向多對一 ，可從活動找到該運動種類
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "dos_sport_id")

	DOS_SPORT dos_sport;
	// 雙向多對一，可從活動找到活動狀態
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "act_status_id")
	ACT_STATUS act_status;
	@Lob
	@Basic(fetch = FetchType.EAGER)
	private byte[] ACT_LOGO;
	
	@Lob
	@Basic(fetch = FetchType.EAGER)
	private byte[] ACT_RFORM;
	
	private Integer ACT_PNUM;
	// 單向多對一，可從活動找到活動賽制
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "act_rule_id")
	private ACT_RULE act_rule;
	@JsonIgnore	
	private Clob ACT_NEWS;

	// 雙向一對多，可從活動找到多個文件
	@JsonIgnore
	@OneToMany(mappedBy = "act", cascade = CascadeType.PERSIST, fetch = FetchType.EAGER, orphanRemoval = true)
	// 對ACT_RFORM新增欄位外鍵，當活動刪除時需先將所有活動文件刪除
	private Set<ACT_RFORM> act_rform = new HashSet<>();

	// 雙向一對多，可從活動找到多個問答
	@OneToMany(mappedBy = "act", cascade = CascadeType.PERSIST, fetch = FetchType.EAGER, orphanRemoval = true)
	// 對ACT_RFORM新增欄位外鍵，當活動刪除時需先將所有活動問答刪除
	@JsonIgnore
	private Set<ACT_QES> act_qes = new HashSet<>();
	@JsonIgnore
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "act_id") // 雙向一對多 (多個賽局)
	private List<MatchBean> matchs = new LinkedList<>();
	@JsonIgnore
	@Fetch(FetchMode.SUBSELECT)
	@OneToMany(cascade = CascadeType.ALL, mappedBy = "act_id", fetch = FetchType.EAGER) // 雙向一對多 (多個報名隊伍)
	private List<MatchTeamBean> teams = new LinkedList<>();
	@JsonIgnore
	@ManyToMany(cascade = CascadeType.ALL,fetch = FetchType.EAGER) // 雙向多對多 (關注此活動的多個會員)//不能加CascadeType.ALL
	@JoinTable(name = "act_follow", // 中介表格為 act_follow
			joinColumns = { @JoinColumn(name = "act_id", referencedColumnName = "act_id") }, inverseJoinColumns = {
					@JoinColumn(name = "member_id", referencedColumnName = "member_id") })
	private Set<MemberBean> followers = new LinkedHashSet<>();

	public ACT() {

	}

	public ACT(Integer aCT_ID, Integer mEMBER_ID, DOS dos_id, String aCT_TITLE, String aCT_DESC, Integer aCT_MAX_TEAM,
			Integer aCT_MAX_PNUM, Timestamp aCT_SIGN_O, Timestamp aCT_SIGN_C, Timestamp aCT_RUN_O, Timestamp aCT_RUN_C,
			Integer aCT_PAY, DOS_SPORT dos_sport, ACT_STATUS act_status, byte[] aCT_LOGO, Integer aCT_PNUM,
			ACT_RULE act_rule, Clob aCT_NEWS, Set<ACT_RFORM> act_rform, Set<ACT_QES> act_qes) {
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
		this.act_rform = act_rform;
		this.act_qes = act_qes;
	}
	@JsonIgnore
	public Clob getACT_NEWS() {
		return ACT_NEWS;
	}
	@JsonIgnore
	public void setACT_NEWS(Clob aCT_NEWS) {
		ACT_NEWS = aCT_NEWS;
	}
	
	@JsonIgnore
	public Integer getRun_O_year() {
		Calendar cal = Calendar.getInstance();
		cal.setTime(getACT_RUN_O());
		int year = cal.get(Calendar.YEAR);
		return year;
	}

	@JsonIgnore
	public Integer getRun_O_month() {
		Calendar cal = Calendar.getInstance();
		cal.setTime(getACT_RUN_O());
		int month = cal.get(Calendar.MONTH);
		return month;
	}

	@JsonIgnore
	public Integer getRun_O_day() {
		Calendar cal = Calendar.getInstance();
		cal.setTime(getACT_RUN_O());
		int day = cal.get(Calendar.DAY_OF_MONTH);
		return day;
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

	@Transient
	@JsonIgnore
	public String imageData;

	public String getImageData() {
		if(ACT_LOGO!=null) {
			String ss = Base64.getEncoder().encodeToString(ACT_LOGO);
			return ss;
		}
		return imageData;//null
	}

	@JsonIgnore
	@Transient
	MultipartFile uploadImage;

	@JsonIgnore
	@Transient
	MultipartFile uploadFile;
	
	public MultipartFile getUploadImage() {
		return uploadImage;
	}

	public void setUploadImage(MultipartFile uploadImage) {
		this.uploadImage = uploadImage;
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

	public List<MatchBean> getMatchs() {
		return matchs;
	}

	public void setMatchs(List<MatchBean> matchs) {
		this.matchs = matchs;
	}

	public List<MatchTeamBean> getTeams() {
		return teams;
	}

	public void setTeams(List<MatchTeamBean> teams) {
		this.teams = teams;
	}

	public Set<MemberBean> getFollowers() {
		return followers;
	}

	public void setFollowers(Set<MemberBean> followers) {
		this.followers = followers;
	}

	public byte[] getACT_RFORM() {
		return ACT_RFORM;
	}

	public void setACT_RFORM(byte[] aCT_RFORM) {
		ACT_RFORM = aCT_RFORM;
	}

	public MultipartFile getUploadFile() {
		return uploadFile;
	}

	public void setUploadFile(MultipartFile uploadFile) {
		this.uploadFile = uploadFile;
	}

	public void setImageData(String imageData) {
		this.imageData = imageData;
	}
	
}