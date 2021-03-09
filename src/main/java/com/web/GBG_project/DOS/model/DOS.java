//model
package com.web.GBG_project.DOS.model;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.hibernate.annotations.Type;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.web.GBG_project.ACT.model.ACT;



@Entity
@Table(name="DOS")
public class DOS implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer DOS_ID;
	private String DOS_NAME;   			
	private String DOS_ADDR; 
	private double DOS_LONG;
	private double DOS_LAT;
	private int DOS_CY; 
	private double DOS_PAY;
	//private Integer DOS_SPORT_ID;
	//private Integer DOS_PICTURE_ID;
	private String DOS_AD;
	private String DOS_OFFICER;
	private String DOS_PHONE;

	@Lob
	@Type(type="org.hibernate.type.StringType")
	@Column(length=Integer.MAX_VALUE)
	private String DOS_TRANS;

	@Lob
	@Type(type="org.hibernate.type.StringType")
	@Column(length=Integer.MAX_VALUE)
	private String DOS_PS;
	

	
	//單向一對多，可從場地找到多張照片
//	@OneToMany(cascade = CascadeType.ALL, orphanRemoval = true,fetch=FetchType.EAGER)
//	@JoinColumn(name = "DOS_ID", referencedColumnName = "DOS_ID")
	//對DOS_PICTURE新增欄位外鍵，當場地刪除時需先將所有場地圖片刪除
	@OneToMany(mappedBy = "dos_id", cascade = CascadeType.ALL,fetch=FetchType.EAGER)
	private Set<DOS_PICTURE> dos_picture = new HashSet<>();

	//雙向一對多，可從場地找到目前正在進行的活動(改雙向map)
	@OneToMany(mappedBy = "dos_id", cascade = CascadeType.ALL)  //不能使用eager
	//對ACT新增欄位外鍵
	@JsonIgnore
	private Set<ACT> act = new HashSet<>();
	//雙向一對多，可從場地找到運動種類
	@ManyToOne(cascade=CascadeType.ALL) 
	@JoinColumn(name="dos_sport_id")
	//自身加入欄位
	
	private DOS_SPORT dos_sport_id = new DOS_SPORT();
	
	public DOS() {
		
	}

	public DOS(Integer dOS_ID, String dOS_NAME, String dOS_ADDR, double dOS_LONG, double dOS_LAT, int dOS_CY,
			double dOS_PAY, String dOS_AD, String dOS_OFFICER, String dOS_PHONE, String dOS_TRANS, String dOS_PS,
			Set<DOS_PICTURE> dos_picture, DOS_SPORT dos_sport_id) {
		super();
		DOS_ID = dOS_ID;
		DOS_NAME = dOS_NAME;
		DOS_ADDR = dOS_ADDR;
		DOS_LONG = dOS_LONG;
		DOS_LAT = dOS_LAT;
		DOS_CY = dOS_CY;
		DOS_PAY = dOS_PAY;
		DOS_AD = dOS_AD;
		DOS_OFFICER = dOS_OFFICER;
		DOS_PHONE = dOS_PHONE;
		DOS_TRANS = dOS_TRANS;
		DOS_PS = dOS_PS;
		this.dos_picture = dos_picture;
		//this.act = act;
		this.dos_sport_id = dos_sport_id;
	}

	public Integer getDOS_ID() {
		return DOS_ID;
	}

	public void setDOS_ID(Integer dOS_ID) {
		DOS_ID = dOS_ID;
	}

	public String getDOS_NAME() {
		return DOS_NAME;
	}

	public void setDOS_NAME(String dOS_NAME) {
		DOS_NAME = dOS_NAME;
	}

	public String getDOS_ADDR() {
		return DOS_ADDR;
	}

	public void setDOS_ADDR(String dOS_ADDR) {
		DOS_ADDR = dOS_ADDR;
	}

	public double getDOS_LONG() {
		return DOS_LONG;
	}

	public void setDOS_LONG(double dOS_LONG) {
		DOS_LONG = dOS_LONG;
	}

	public double getDOS_LAT() {
		return DOS_LAT;
	}

	public void setDOS_LAT(double dOS_LAT) {
		DOS_LAT = dOS_LAT;
	}

	public int getDOS_CY() {
		return DOS_CY;
	}

	public void setDOS_CY(int dOS_CY) {
		DOS_CY = dOS_CY;
	}

	public double getDOS_PAY() {
		return DOS_PAY;
	}

	public void setDOS_PAY(double dOS_PAY) {
		DOS_PAY = dOS_PAY;
	}

	public String getDOS_AD() {
		return DOS_AD;
	}

	public void setDOS_AD(String dOS_AD) {
		DOS_AD = dOS_AD;
	}

	public String getDOS_OFFICER() {
		return DOS_OFFICER;
	}

	public void setDOS_OFFICER(String dOS_OFFICER) {
		DOS_OFFICER = dOS_OFFICER;
	}

	public String getDOS_PHONE() {
		return DOS_PHONE;
	}

	public void setDOS_PHONE(String dOS_PHONE) {
		DOS_PHONE = dOS_PHONE;
	}

	public String getDOS_TRANS() {
		return DOS_TRANS;
	}

	public void setDOS_TRANS(String dOS_TRANS) {
		DOS_TRANS = dOS_TRANS;
	}

	public String getDOS_PS() {
		return DOS_PS;
	}

	public void setDOS_PS(String dOS_PS) {
		DOS_PS = dOS_PS;
	}

	

	public Set<DOS_PICTURE> getDos_picture() {
		return dos_picture;
	}

	public void setDos_picture(Set<DOS_PICTURE> dos_picture) {
		this.dos_picture = dos_picture;
	}

	public Set<ACT> getAct() {
		return act;
	}

	public void setAct(Set<ACT> act) {
		this.act = act;
	}

	public DOS_SPORT getDos_sport_id() {
		return dos_sport_id;
	}

	public void setDos_sport_id(DOS_SPORT dos_sport_id) {
		this.dos_sport_id = dos_sport_id;
	}
	//set轉list 只取得一張圖片給主頁
	public List<DOS_PICTURE> getDos_pictureee() {
		List<DOS_PICTURE> doss=new ArrayList<DOS_PICTURE>();
		DOS_PICTURE ddd=null;	
		
		//ddd.add((DOS_PICTURE) getDos_picture().toArray()[0]);
		int min=100;
		for(DOS_PICTURE dd :getDos_picture()) {
			if(min>dd.getDOS_PICTURE_ID()) {
			  ddd=dd;
			  min=dd.getDOS_PICTURE_ID();
			}
		}
		doss.add(ddd);
		return doss;
	}

}
