package com.web.GBG_project.ACT.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.course.model.MatchTeamBean;
@Component
public class ActRegValidator implements Validator {

	@Override
	public boolean supports(Class<?> clazz) {
		return MatchTeamBean.class.isAssignableFrom(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		MatchTeamBean team=(MatchTeamBean)target;
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "match_team_id", "", "更新報名資訊錯誤"); //如果要設要設flag，判斷是新增還修改
		//隊伍名稱
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "team_name", "", "隊伍名稱不可為空，請輸入資料");
		//單位名稱
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "team_unit", "", "單位名稱不可為空，請輸入資料");
		//成員
//		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "members", "", "標題不可為空，請輸入資料");

	}

}
