//model
package com.web.GBG_project.DOS.model;

import java.io.Serializable;
import java.util.Base64;

import javax.persistence.Basic;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;
//單向多對一
@Entity
@Table(name="DOS_PICTURE")
public class DOS_PICTURE implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer DOS_PICTURE_ID;
	@Lob
	@Basic(fetch=FetchType.EAGER)
	private byte[] DOS_PICTURE_PIC;
	
	//private Integer DOS_ID;
	//@OneToOne(cascade= {CascadeType.REMOVE, CascadeType.PERSIST  })
	//自身新增外鍵
	//@JoinColumn(name="FK_DOS_ID")
//	private DOS dos;
//    public DOS getDos() {
//		return dos;
//	}
//
//
//	public void setDos(DOS dos) {
//		this.dos = dos;
//	}


	public DOS_PICTURE() {
		
	}
    
	
	public DOS_PICTURE(Integer dOS_PICTURE_ID, byte[] dOS_PICTURE_PIC) {
		super();
		DOS_PICTURE_ID = dOS_PICTURE_ID;
		DOS_PICTURE_PIC = dOS_PICTURE_PIC;
		
	}


	


	public Integer getDOS_PICTURE_ID() {
		return DOS_PICTURE_ID;
	}
	public void setDOS_PICTURE_ID(Integer dOS_PICTURE_ID) {
		DOS_PICTURE_ID = dOS_PICTURE_ID;
	}
	public byte[] getDOS_PICTURE_PIC() {
		return DOS_PICTURE_PIC;
	}
	//foreach雙迴圈- 取得每個場地的第一張圖片
	public String getDOS_PICTURE_PIC_ONE() {
		String ss=Base64.getEncoder().encodeToString(DOS_PICTURE_PIC);
		return ss;
	}

	public void setDOS_PICTURE_PIC(byte[] dOS_PICTURE_PIC) {
		DOS_PICTURE_PIC = dOS_PICTURE_PIC;
	}
	
}
