package com.web.GBG_project.member.service.impl;

import java.sql.SQLException;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.web.GBG_project.member.dao.LoginDao;
import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.member.service.LoginService;



@Service
public class LoginSeriveImpl implements LoginService{
	SessionFactory factory;
	LoginDao logindao;
	@Autowired
	public void setDao(LoginDao logindao) {
	    this.logindao = logindao;
    }
    public LoginSeriveImpl() {
    	
    }
    @Transactional
	@Override
	public MemberBean checkIdPassword(String userId, String password) throws SQLException {
		return logindao.checkIdPassword(userId, password);
	}

}
