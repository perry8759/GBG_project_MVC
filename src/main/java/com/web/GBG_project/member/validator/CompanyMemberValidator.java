package com.web.GBG_project.member.validator;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.member.service.MemberService;
import com.web.GBG_project.member.util.ValidatorText;

@Component
public class CompanyMemberValidator implements Validator{
	private boolean runModel;
	@Autowired
	MemberService service;
	
	//設定檢查模式
	public void setOpenRegister(boolean runModel) {
			this.runModel = runModel;
	}

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
		if (runModel) {
			String account = member.getMember_account();
			//檢查帳號是否存在
			if (service.checkId(account) != null) {
				errors.rejectValue("member_account", "", "帳號已存在");
			}
			if (!account.matches(ValidatorText.ACCOUNT_AND_PW_CHECK)) {
				errors.rejectValue("member_account", "", "請輸入6 ~ 10個大小寫英文字母或數字");
			}
			//密碼
			//輸入文字檢查
			String pw = member.getMember_pw();
			if (!pw.matches(ValidatorText.ACCOUNT_AND_PW_CHECK)) {
				errors.rejectValue("member_pw", "", "請輸入6 ~ 10個大小寫英文字母或數字");
			}
			//確認密碼
			ValidationUtils.rejectIfEmptyOrWhitespace(errors, "again_pw", "", "與密碼不相符");
			String againPw = member.getAgain_pw();
			if (!againPw.equals(pw)) {
				errors.rejectValue("again_pw", "", "與密碼不相符");
			}
		}
		
		//真實姓名
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_real_name", "", "此為必填欄位，請輸入資料");
		//暱稱
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_user_name", "", "此為必填欄位，請輸入資料");
		//Email
		//輸入格式檢查
		String email = member.getMember_email();
		if (!email.matches(ValidatorText.EMAIL_CHECK) || email.length() > 30) {
			errors.rejectValue("member_email", "", "email格式不符");
		}
		//性別
		//輸入文字檢查
		Integer sex = member.getMember_sex_id().getMember_sex_id();
		if (sex == -1) {
			errors.rejectValue("member_sex_id", "", "請選擇性別");
		}
		//手機電話
		String mobilePhone = member.getMember_mobile_phone();
		if (!mobilePhone.matches(ValidatorText.MOBILE_PHONE_CHECK)) {
			errors.rejectValue("member_mobile_phone", "", "請輸入正確的手機號碼");
		}
		//聯絡人姓名
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "member_cp_name", "", "此為必填欄位，請輸入資料");
		//統一編號
		String taxNumber = member.getMember_tax_id_number();
		if (!taxNumber.matches(ValidatorText.TAX_NUMBER_CHECK)) {
			errors.rejectValue("member_tax_id_number", "", "統一編號不符合格式");
		}
		//室內電話
		String telephonePhone = member.getMember_fixed_line_telephone();
		if (!telephonePhone.matches(ValidatorText.FIXED_LINE_TELEPHONE) && telephonePhone.length() != 0) {
			errors.rejectValue("member_fixed_line_telephone", "", "請輸入正確的號碼");
		}
	}
}
