package com.web.GBG_project.member.dao.impl;


import java.sql.SQLException;


import javax.persistence.NoResultException;


import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.web.GBG_project.member.dao.LoginDao;
import com.web.GBG_project.member.model.MemberBean;
@Repository
public class LoginDaoImpl implements LoginDao{
	SessionFactory factory;
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	
	public LoginDaoImpl() {
		
	}	
	//檢查帳號密碼
	public MemberBean checkIdPassword(String userId, String password) throws SQLException {
		MemberBean mb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean m WHERE m.member_account = :mid and m.member_pw = :pswd";
		try {
			mb = (MemberBean) session.createQuery(hql)
									 .setParameter("mid", userId)
									 .setParameter("pswd", password)
									 .getSingleResult();
		} catch (NoResultException ex) {
			;
		}
		return mb;
	}
}
