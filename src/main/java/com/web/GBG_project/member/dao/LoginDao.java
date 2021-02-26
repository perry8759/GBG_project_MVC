package com.web.GBG_project.member.dao;

import java.sql.SQLException;

import com.web.GBG_project.member.model.MemberBean;


public interface LoginDao {
	public MemberBean checkIdPassword(String userId, String password) throws SQLException;
}
