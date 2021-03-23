package com.web.GBG_project.util;

public class ValidatorText {
	public static final String EMAIL_CHECK = "[a-zA-Z0-9]{1,}[@][a-zA-Z]{1,}[\\.][a-zA-Z]{1,}";
	public static final String ACCOUNT_AND_PW_CHECK = "[a-zA-Z0-9]{6,10}";
	public static final String TAX_NUMBER_CHECK = "[0-9]{8,8}";
	public static final String MOBILE_PHONE_CHECK = "[0-9]{10,10}";
	public static final String FIXED_LINE_TELEPHONE = "[0-9]{8,8}";
	public ValidatorText() {
		super();
	}
}
