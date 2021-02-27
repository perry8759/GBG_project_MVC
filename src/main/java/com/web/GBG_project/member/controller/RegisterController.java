package com.web.GBG_project.member.controller;

import java.sql.Blob;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.member.service.MemberService;
import com.web.GBG_project.member.validator.CompanyMemberValidator;
import com.web.GBG_project.member.validator.NormalMemberValidator;

@Controller
@RequestMapping("/member")
public class RegisterController {
	
	@Autowired
	MemberService service;
	@Autowired
	NormalMemberValidator normalMemberValidator;
	@Autowired
	CompanyMemberValidator companyMemberValidator;
	
	//定義“註冊”導轉頁面
	@GetMapping("/registered/{perm}")
	public String registered(Model model,
			@PathVariable String perm
			) {
		MemberBean member = new MemberBean();
		model.addAttribute("sexList", service.getSex());
		model.addAttribute("memberBean", member);
		if (perm.equals("normal")) {
			return "member/normalRegistered";
		}
		return "member/companyRegistered";
	}
	
	//接收“註冊”頁面資料
	@PostMapping("/registered/{perm}")
	public String registeredForm(
			@ModelAttribute("memberBean") MemberBean memberBean,
			BindingResult result,
			Model model,
			@PathVariable String perm
			) {
		model.addAttribute("sexList", service.getSex());
		//進行資料檢查
		if (perm.equals("normal")) {
			normalMemberValidator.validate(memberBean, result);
			if (result.hasErrors()) {
				return "member/normalRegistered";
			}
		} else if (perm.equals("company")) {
			companyMemberValidator.validate(memberBean, result);
			if (result.hasErrors()) {
				return "member/companyRegistered";
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
		return "redirect:/member/index";
	}
	
	//定義從“主頁”轉跳到"會員類型選擇"頁面
	@GetMapping("/permSelect")
	public String permSelect() {
		return "member/permSelect";
	}
	
	//定義“主頁”導轉頁面
	@RequestMapping("/index")
	public String memberIndex() {
		return "member/index";
	}
	// 本方法可對WebDataBinder(數據綁定器)進行組態設定。除了表單資料外，絕大多數可以傳入控制器方法的
	// 參數都可以傳入以@InitBinder修飾的方法。本方法最常使用的參數為WebDataBinder。
	//
	// org.springframework.web.bind.WebDataBinder
	// 為 org.springframework.validation.DataBinder 的子類別，它將夾帶在請求物件內
	// 的請求參數綁定在JavaBean內。
	// registerCustomEditor(): 可對JavaBean內之特定型態自定該型態的屬性編輯器(PropertyEditor)
	@InitBinder
	public void initBinder(WebDataBinder binder) {
		// java.util.Date
		//SimpleDateFormat針對日期或時間進行格式化
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss SSS");
		//時間格式是否規定鬆散(自動計算功能)
		//在設定寬鬆之下解析器會嘗試去解釋不完全匹配的輸入
		//但在這裡我們需要驗證前端送來之資料是否異常選擇使用"不寬鬆"輸入格式必須完全匹配
		dateFormat.setLenient(false);
		//DateFormat轉換為java.util.Date
		//第二個參數是設定是否允許使用空字串轉換，將其解釋成null，如果不允許再轉換時可能出現IllegalArgumentException
		CustomDateEditor ce = new CustomDateEditor(dateFormat, true); 
		//設定至WebDataBinder，第一個參數為欲設定之類型，第二參數為設定值
		binder.registerCustomEditor(Date.class, ce);
		// java.sql.Date		
		DateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat2.setLenient(false);
		CustomDateEditor ce2 = new CustomDateEditor(dateFormat2, true); 
		binder.registerCustomEditor(java.sql.Date.class, ce2);
	}
}
