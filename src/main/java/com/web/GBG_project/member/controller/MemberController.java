package com.web.GBG_project.member.controller;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.SQLException;

import javax.servlet.ServletContext;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.member.service.MemberService;
import com.web.GBG_project.member.validator.CompanyMemberValidator;
import com.web.GBG_project.member.validator.NormalMemberValidator;

@Controller
@RequestMapping("/member")
@SessionAttributes({"LoginOK"})
public class MemberController {
	
	@Autowired
	MemberService service;
	@Autowired
	ServletContext context;
	@Autowired
	NormalMemberValidator normalMemberValidator;
	@Autowired
	CompanyMemberValidator companyMemberValidator;
	
	@GetMapping("/memberEdit")
	public String memberEdit(Model model) {
		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		model.addAttribute("sexList", service.getSex());
		model.addAttribute("memberBean", member);
		if (member.getMember_perm_id().getMember_perm_id() == 1) {
			return "member/normalEdit";
		}
		return "member/companyEdit";
	}
	
	@PostMapping("/memberEdit/")
	public String memberEditSave(
			@ModelAttribute("memberBean") MemberBean memberBean,
			BindingResult result,
			Model model
			) {
		String mapping = "";
		model.addAttribute("sexList", service.getSex());
		//進行資料檢查
		if (memberBean.getMember_id() == 1) {
			mapping = "member/normalEdit";
			normalMemberValidator.validate(memberBean, result);
			if (result.hasErrors()) {
				return mapping;
			}
		} else if (memberBean.getMember_id() == 2) {
			mapping = "member/companyEdit";
			companyMemberValidator.validate(memberBean, result);
			if (result.hasErrors()) {
				return mapping;
			}
		}
		//處理圖片檔
		MultipartFile picture = memberBean.getProductImage();
		if (picture != null && !picture.isEmpty() && picture.getSize() != 0) {
			try {
				byte[] b = picture.getBytes();
				Blob blob = new SerialBlob(b);
				memberBean.setMember_image(blob);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		//儲存會員資料
		service.saveMember(memberBean);
		return mapping;
	}
	
	public ResponseEntity<byte[]> getPicture(Model model) {
		String defaultPicture = "/resources/images/NoImage.jpg";
		
		byte[] media = null;
		HttpHeaders headers = new HttpHeaders();
		String filename = "";
		int len = 0;
		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		if (member != null) {
			Blob blob = member.getMember_image();
			if (blob != null) {
				try {
					len = (int) blob.length();
					media = blob.getBytes(1, len);
				} catch (SQLException e) {
					throw new RuntimeException("ProductController的getPicture()發生SQLException: " + e.getMessage());
				}
			} else {
				media = toByteArray(defaultPicture);
				filename = defaultPicture;
			}
		} else {
			media = toByteArray(defaultPicture);
			filename = defaultPicture;
		}
		headers.setCacheControl(CacheControl.noCache().getHeaderValue());
		String mimeType = context.getMimeType(filename);
		MediaType mediaType = MediaType.valueOf(mimeType);
		System.out.println("mediaType =" + mediaType);
		headers.setContentType(mediaType);
		ResponseEntity<byte[]> responseEntity = new ResponseEntity<>(media, headers, HttpStatus.OK);
		return responseEntity;
	}
	
	private byte[] toByteArray(String filepath) {
		byte[] b = null;
		String realPath = context.getRealPath(filepath);
		try {
			File file = new File(realPath);
			long size = file.length();
			b = new byte[(int) size];
			InputStream fis = context.getResourceAsStream(filepath);
			fis.read(b);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return b;
	}
}
