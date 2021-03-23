package com.web.GBG_project.ACT.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.web.GBG_project.ACT.model.ACT;
@Component
public class ActEditValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return ACT.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		ACT act=(ACT)target;
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ACT_ID", "", "更新活動資訊錯誤"); //如果要設要設flag，判斷是新增還修改
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "MEMBER_ID", "", "請重新登入");
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dos_id.DOS_ID", "", "場地資訊遺失，請重選場地");
		//標題
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ACT_TITLE", "", "標題不可為空，請輸入資料");
//以下應該皆非必填?
		//簡章
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ACT_DESC", "", "此為必填欄位，請輸入資料");
		//每隊最大人數
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ACT_MAX_TEAM", "", "此為必填欄位，請輸入資料");
		//活動最大人數
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ACT_MAX_PNUM", "", "此為必填欄位，請輸入資料");
		//報名費用
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "ACT_PAY", "", "此為必填欄位，請輸入資料");
		//頭貼照片
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "uploadImage", "", "此為必填欄位，請輸入資料");
//		MultipartFile image = act.getUploadImage();
	}

}
