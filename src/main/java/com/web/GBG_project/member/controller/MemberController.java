package com.web.GBG_project.member.controller;

import java.sql.Blob;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.member.service.MemberService;
import com.web.GBG_project.member.validator.CompanyMemberValidator;
import com.web.GBG_project.member.validator.NormalMemberValidator;
import com.web.GBG_project.util.CommonUtils;
import com.web.GBG_project.util.ValidatorText;

@Controller
@RequestMapping("/member")
@SessionAttributes({ "LoginOK"})
public class MemberController {
	
	@Autowired
	CommonUtils common;
	@Autowired
	MemberService service;
	@Autowired
	ServletContext context;
	@Autowired
	NormalMemberValidator normalMemberValidator;
	@Autowired
	CompanyMemberValidator companyMemberValidator;
	
	@GetMapping("/memberEdit")
	public String memberEdit(Model model, HttpServletRequest request) {
		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		model.addAttribute("sexList", service.getSex());
		model.addAttribute("memberBean", member);
		if (member.getMember_perm_id().getMember_perm_id() == 1) {
			return "member/normalEdit";
		}
		return "member/companyEdit";
	}
	
	@PostMapping("/memberEdit")
	public String memberEditSave(
			@ModelAttribute("memberBean") MemberBean memberBean,
			BindingResult result,
			Model model,
			SessionStatus status
			) {
		MemberBean memberSession = (MemberBean) model.getAttribute("LoginOK");
		model.addAttribute("sexList", service.getSex());
		//進行資料檢查
		if (memberSession.getMember_perm_id().getMember_perm_id() == 1) {
			memberBean.setMember_verification_code(memberSession.getMember_verification_code());
			memberBean.setMember_account(memberSession.getMember_account());
			memberBean.setMember_pw(memberSession.getMember_pw());
			memberBean.setMember_real_name(memberSession.getMember_real_name());
			memberBean.setMember_perm_id(memberSession.getMember_perm_id());
			memberBean.setManage_status_id(memberSession.getManage_status_id());
			memberBean.setMember_id(memberSession.getMember_id());
			memberBean.setMember_sex_id(memberSession.getMember_sex_id());
			memberBean.setMember_birthday(memberSession.getMember_birthday());
			memberBean.setMember_register_date(memberSession.getMember_register_date());
			normalMemberValidator.setOpenRegister(false);
			normalMemberValidator.validate(memberBean, result);
			System.out.println("error: " + result);
			if (result.hasErrors()) {
				return "member/normalEdit";
			}
		} else if (memberSession.getMember_perm_id().getMember_perm_id() == 2) {
			memberBean.setMember_verification_code(memberSession.getMember_verification_code());
			memberBean.setMember_id(memberSession.getMember_id());
			memberBean.setMember_account(memberSession.getMember_account());
			memberBean.setMember_pw(memberSession.getMember_pw());
			memberBean.setMember_real_name(memberSession.getMember_real_name());
			memberBean.setMember_perm_id(memberSession.getMember_perm_id());
			memberBean.setMember_tax_id_number(memberSession.getMember_tax_id_number());
			memberBean.setManage_status_id(memberSession.getManage_status_id());
			memberBean.setMember_register_date(memberSession.getMember_register_date());
			companyMemberValidator.setOpenRegister(false);
			companyMemberValidator.validate(memberBean, result);
			System.out.println("error: " + result);
			if (result.hasErrors()) {
				return "member/companyEdit";
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
		} else {
			MemberBean m = (MemberBean) model.getAttribute("LoginOK");
			memberBean.setMember_image(m.getMember_image());
		}
		//儲存會員資料
		System.out.println(memberBean);
		service.updateMember(memberBean);
		model.addAttribute("LoginOK", memberBean);
		return "redirect:/member/memberInformation";
	}
	
	@GetMapping("/getPicture")
	public ResponseEntity<byte[]> getPicture(Model model) {
		int memberId = ((MemberBean) model.getAttribute("LoginOK")).getMember_id();
		MemberBean member = service.getMember(memberId);
		return common.getPicture(member, member.getMember_image());
	}
	
	@GetMapping("editPasswordForm")
	public String newPasswordForm() {
		return "member/editPasswordForm";
	}
	
	@PostMapping(value = "editPasswordForm", params = {"oldPassword", "newPassword", "checkNewPassword"})
	public String newPassword(
				Model model,
				@RequestParam String oldPassword,
				@RequestParam String newPassword,
				@RequestParam String checkNewPassword,
				SessionStatus status,
				HttpSession session
			) {
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		if (!oldPassword.matches(ValidatorText.ACCOUNT_AND_PW_CHECK)) {
			errorMsgMap.put("oldPasswordError", "請輸入合法的密碼");
		}
		
		if (!newPassword.matches(ValidatorText.ACCOUNT_AND_PW_CHECK)) {
			errorMsgMap.put("newPasswordError", "請輸入合法的密碼");
		}
		
		if (!checkNewPassword.equals(newPassword)) {
			errorMsgMap.put("newPasswordCheckError", "與新密碼不相符");
		}
		
		if (!errorMsgMap.isEmpty()) {
			model.addAttribute("errorCode", errorMsgMap);
			System.out.println("hello world");
			return "member/editPasswordForm";
		}
		String memberAccount = ((MemberBean) model.getAttribute("LoginOK")).getMember_account();
		MemberBean member = service.checkIdPassword(memberAccount, oldPassword);
		if (member == null) {
			model.addAttribute("checkPasswordError", "密碼錯誤");
			return "member/editPasswordForm";
		}
		service.updatePassword(member.getMember_id(), newPassword);
		status.setComplete();
		session.invalidate();	
		return "redirect:/member/loginForm";
	}
	
	@GetMapping("memberInformation")
	public String companyMemberInformation(Model model) {
		MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		if (member != null) {
			int permId = member.getMember_perm_id().getMember_perm_id();
			if (permId == 1) {
				return "member/normalMemberInformation";
			} else if (permId == 2) {
				return "member/companyMemberInformation";
			} else if (permId == 3) {
				return "index";
			}
			
		}
		return "member/login";
	}
}
