package com.web.GBG_project.member.controller;

import java.sql.Blob;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.member.service.MemberService;
import com.web.GBG_project.member.validator.NormalMemberValidator;

@Controller
@SessionAttributes({"LoginOK"})
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	MemberService service;
	@Autowired
	NormalMemberValidator validator;
	
	//定義“登入”導轉頁面
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "login";
	}
	//定義“註冊”導轉頁面
	@GetMapping("/registered")
	public String registered(Model model) {
		MemberBean member = new MemberBean();
		model.addAttribute("sexList", service.getSex());
		model.addAttribute("memberBean", member);
		return "member/registered";
	}
	
	//接收“註冊”頁面資料
	@PostMapping("/registered")
	public String registeredForm(
			@ModelAttribute("memberBean") MemberBean memberBean,
			BindingResult result,
			Model model
			) {
		model.addAttribute("sexList", service.getSex());
		//進行資料檢查
		validator.validate(memberBean, result);
		if (result.hasErrors()) {
			return "member/registered";
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
		return "member/index";
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
	
	
	//使用者登入及資料驗證
	//@RequestParam註釋獲取使用者帳號密碼資訊
	@RequestMapping(value = "/login", method = RequestMethod.POST, params = {"userId", "pswd"})
	public String login(Model model,
			@RequestParam(value = "userId") String userId,
			@RequestParam(value = "pswd") String pswd) {
		// 定義存放錯誤訊息的Map物件
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		
		//使用者資料判斷
		// 如果 userId 欄位為空白，放一個錯誤訊息到 errorMsgMap 之內
		if(userId == null || userId.length() == 0) {
			errorMsgMap.put("AccountEmptyError", "帳號欄必須輸入");
		}
		// 如果 pswd 欄位為空白，放一個錯誤訊息到 errorMsgMap 之內
		if(pswd == null || pswd.trim().length() == 0) {
			errorMsgMap.put("PasswordEmptyError", "密碼欄必須輸");
		}
		
		//如果errorMsgMap內部為空表示資料有誤，回傳錯誤訊息，並且重新導向至login
		if(!errorMsgMap.isEmpty()) {
			model.addAllAttributes(errorMsgMap);
			model.addAttribute("userId", userId);
			model.addAttribute("pswd", pswd);
			return "member/login";
		}
		
		MemberBean mb = null;
		//使用MemberService中的checkIdPassword驗證帳號密碼
		//如果回傳值不是null則表示帳號密碼存在，允許登入
		//否則回傳錯誤訊息，並重新導向至login
		try {
			mb = service.checkIdPassword(userId, pswd);
		} catch (Exception e) {
			e.printStackTrace();
		}
		if (mb != null) {
			model.addAttribute("LoginOK", mb);
			return "member/index";
		} 
		model.addAttribute("LoginError", "帳號或密碼錯誤");
		return "member/login";
	}
	
	@RequestMapping("/logout")
	public String logout(SessionStatus status, HttpSession session) {
		status.setComplete();		// 移除@SessionAttributes({"LoginOK"}) 標示的屬性物件
		session.invalidate();		// 此敘述不能省略	
		return "redirect:member/";
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
