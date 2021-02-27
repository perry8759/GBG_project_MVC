package com.web.GBG_project.member.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.member.service.MemberService;

@Component
public class NormalMemberValidator implements Validator{
	private final String accountAndPwWordCheck = "[a-zA-Z0-9]{6,10}";
	private final String emailCheck = "[a-zA-Z0-9]{1,}[@][a-zA-Z]{1,}[\\.][a-zA-Z]{1,}";
	
	@Autowired
	MemberService service;

	@Override
	public boolean supports(Class<?> clazz) {
		boolean b = MemberBean.class.isAssignableFrom(clazz);
		return b;
	}

	@Override
	public void validate(Object target, Errors errors) {
		MemberBean member = (MemberBean)target;
		//帳號
		//輸入文字檢查
		
		String account = member.getMember_account();
		//檢查帳號是否存在
		if (service.checkId(account) != null) {
			errors.rejectValue("member_account", "", "帳號已存在");
		}
		if (!account.matches(accountAndPwWordCheck)) {
			errors.rejectValue("member_account", "", "請輸入6 ~ 10字合法字元(大小寫英文字母、數字及@#$符號)");
		}
		//密碼
		//輸入文字檢查
		String pw = member.getMember_pw();
		if (!pw.matches(accountAndPwWordCheck)) {
			errors.rejectValue("member_pw", "", "請輸入6 ~ 10字合法字元(大小寫英文字母、數字及@#$符號)");
		}
		//確認密碼
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "again_pw", "", "與密碼不相符");
		String againPw = member.getAgain_pw();
		if (!againPw.equals(pw)) {
			errors.rejectValue("again_pw", "", "與密碼不相符");
		}
		//真實姓名
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_real_name", "", "此為必填欄位，請輸入資料");
		//暱稱
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_user_name", "", "此為必填欄位，請輸入資料");
		//Email
		//輸入格式檢查
		String email = member.getMember_email();
		if (!email.matches(emailCheck) || email.length() > 30) {
			errors.rejectValue("member_email", "", "email格式不符");
		}
		//性別
		//輸入文字檢查
		Integer sex = member.getMember_sex_id().getMember_sex_id();
		if (sex == -1) {
			errors.rejectValue("member_sex_id", "", "請選擇性別");
		}
		//手機電話
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_mobile_phone", "", "此為必填欄位，請輸入資料");
		//生日
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_birthday", "", "此為必填欄位，請輸入資料");
	}
}
