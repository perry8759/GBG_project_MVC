package com.web.GBG_project.member.service;

import java.sql.SQLException;

import com.web.GBG_project.member.model.MemberBean;

public interface LoginService {
	MemberBean checkIdPassword(String userId, String password) throws SQLException;
}
