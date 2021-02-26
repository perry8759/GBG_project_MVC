package com.web.GBG_project.DOS.model;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.web.GBG_project.ACT.model.ACT;





//單向一對多 可以從運動種類找到場地
@Entity
@Table(name="DOS_SPORT")
public class DOS_SPORT implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	
	private Integer DOS_SPORT_ID;
	private String DOS_SPORT_NAME;
	//雙向一對多
	@OneToMany(mappedBy = "dos_sport_id", cascade = CascadeType.ALL)
	//對DOS新增欄位外鍵
	private Set<DOS> dos = new HashSet<>();
	//雙向一對多
	@OneToMany(mappedBy = "dos_sport", cascade = CascadeType.ALL)
	//對ACT新增欄位外鍵
	private Set<ACT> act = new HashSet<>();
	public Set<DOS> getDos() {
		return dos;
	}


	public void setDos(Set<DOS> dos) {
		this.dos = dos;
	}


	public DOS_SPORT() {
		// TODO Auto-generated constructor stub
	}
	

	public DOS_SPORT(Integer dOS_SPORT_ID, String dOS_SPORT_NAME) {
		super();
		DOS_SPORT_ID = dOS_SPORT_ID;
		DOS_SPORT_NAME = dOS_SPORT_NAME;
		
	}


	public Integer getDOS_SPORT_ID() {
		return DOS_SPORT_ID;
	}
	public void setDOS_SPORT_ID(Integer dOS_SPORT_ID) {
		DOS_SPORT_ID = dOS_SPORT_ID;
	}
	public String getDOS_SPORT_NAME() {
		return DOS_SPORT_NAME;
	}
	public void setDOS_SPORT_NAME(String dOS_SPORT_NAME) {
		DOS_SPORT_NAME = dOS_SPORT_NAME;
	}

}
