//model
package com.web.GBG_project.DOS.model;

import java.io.Serializable;
import java.util.Base64;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;
//單向多對一
@Entity
@Table(name="DOS_PICTURE")
public class DOS_PICTURE implements Serializable{
	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer DOS_PICTURE_ID;
	
	@ManyToOne(cascade=CascadeType.ALL)
	@JoinColumn(name="DOS_ID")
	//自身加入欄位
	private DOS dos_id = new DOS();
	
	

	public DOS getDos_id() {
		return dos_id;
	}

	public void setDos_id(DOS dos_id) {
		this.dos_id = dos_id;
	}

	@Lob
	@Basic(fetch=FetchType.EAGER)
	private byte[] DOS_PICTURE_PIC;
	
	@Transient
	@JsonIgnore
	private String imageData;
	
	public String getImageData() {
		String ss=Base64.getEncoder().encodeToString(DOS_PICTURE_PIC);
		return ss;
	}
	@JsonIgnore
	@Transient
	MultipartFile uploadImage;

	public MultipartFile getUploadImage() {
		return uploadImage;
	}
	
	public void setUploadImage(MultipartFile uploadImage) {
		this.uploadImage = uploadImage;
	}
	
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
