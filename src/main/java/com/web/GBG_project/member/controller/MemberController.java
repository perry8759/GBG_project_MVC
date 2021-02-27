package com.web.GBG_project.member.controller;

import java.sql.Blob;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
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
}
