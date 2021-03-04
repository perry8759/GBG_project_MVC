package com.web.GBG_project.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.member.service.MemberService;
import com.web.GBG_project.member.util.ValidatorText;

@Controller
@SessionAttributes({"LoginOK", "ForgotPwOK"})
@RequestMapping("/member")
public class LoginController {
	
	@Autowired
	MemberService service;
	
	//定義“登入”導轉頁面
	@RequestMapping("/loginForm")
	public String loginForm() {
		return "member/login";
	}
	
	//使用者登入及資料驗證
	//@RequestParam註釋獲取使用者帳號密碼資訊
	@PostMapping(value = "/login", params = {"userId", "pswd"})
	public String login(Model model,
			@RequestParam(value = "userId") String userId,
			@RequestParam(value = "pswd") String pswd,
			HttpSession session
			) {
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
			return "redirect:/";
		} 
		model.addAttribute("LoginError", "帳號或密碼錯誤");
		return "member/login";
	}
	
	//登出
	@RequestMapping("/logout")
	public String logout(SessionStatus status, HttpSession session) {
		status.setComplete();		// 移除@SessionAttributes({"LoginOK"}) 標示的屬性物件
		//銷毀回收 HttpSession 物件
		session.invalidate();		// 此敘述不能省略	
		return "redirect:/";
	}
	
	//忘記密碼頁面導轉
	@GetMapping("/forgotPassword")
	public String forgotPasswordForm() {
		return "member/forgotPasswordForm";
	}
	
	//忘記密碼輸入表單，判斷輸入內容，如驗證正確則發送修改密碼的mail
	@PostMapping(value = "/editPasswordForm", params = {"email", "account"})
	public String editPasswordForm(
				Model model,
				@RequestParam String email,
				@RequestParam String account
			) {
		Map<String, String> errorMsgMap = new HashMap<String, String>();
		if (!email.matches(ValidatorText.EMAIL_CHECK)) {
			errorMsgMap.put("EmailError", "請輸入合法的Email格式");
		}
		if (!account.matches(ValidatorText.ACCOUNT_AND_PW_CHECK)) {
			errorMsgMap.put("AccountError", "請輸入合法的帳號格式");
		}
		
		if (!errorMsgMap.isEmpty()) {
			model.addAttribute("ErrorCode", errorMsgMap);
			model.addAttribute("email", email);
			model.addAttribute("account", account);
			return "member/forgotPasswordForm";
		}
		
		MemberBean member = null;
		try {
			member = service.checkIdMail(account, email);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		if (member == null) {
			model.addAttribute("AccountEmailError", "帳號或Email錯誤");
			return "member/forgotPasswordForm";
		}
		return "redirect:/member/login";
	}
	
	@GetMapping("/member/forgotPw/{hashCode}")
	public String editPasswordForm() {
		return "member/editPasswordForm";
	}
}
