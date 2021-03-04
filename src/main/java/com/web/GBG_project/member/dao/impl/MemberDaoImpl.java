package com.web.GBG_project.member.dao.impl;

import java.util.List;

import javax.persistence.NoResultException;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.GBG_project.member.dao.MemberDao;
import com.web.GBG_project.member.model.ManageStatusBean;
import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.member.model.MemberPermBean;
import com.web.GBG_project.member.model.MemberSexBean;

@Repository
public class MemberDaoImpl implements MemberDao {
	
	@Autowired
	private SessionFactory factory;
	
	@Override
	public MemberBean checkIdPassword(String account, String password) {
		MemberBean mb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean m WHERE m.member_account = :mid and m.member_pw = :pswd";
		try {
			mb = (MemberBean) session.createQuery(hql)
									 .setParameter("mid", account)
									 .setParameter("pswd", password)
									 .getSingleResult();
		} catch (NoResultException ex) {
			ex.printStackTrace();
		}
		return mb;
	}
	// 儲存MemberBean物件，將參數mb新增到Member表格內。
	@Override
	public void saveMember(MemberBean mb) {
		Session session = factory.getCurrentSession();
		session.save(mb);
	}
	
	//搜尋資料庫中性別資料
	@Override
	public List<MemberSexBean> getSex() {
		String hql = "FROM MemberSexBean";
		Session session = factory.getCurrentSession();
		return session.createQuery(hql).getResultList();
	}
	
	//藉由id資訊搜尋MemberSex之單筆資料
	@Override
	public MemberSexBean getMemberSex(int memberSexId) {
		Session session = factory.getCurrentSession();
		return session.get(MemberSexBean.class, memberSexId);
	}
	
	//藉由id資訊搜尋MemberPerm之單筆資料
	@Override
	public MemberPermBean getMemberPerm(int memberPermId) {
		Session session = factory.getCurrentSession();
		return session.get(MemberPermBean.class, memberPermId);
	}
	
	//藉由id資訊搜尋ManageStatus之單筆資料
	@Override
	public ManageStatusBean getManageStatus(int manageStatusId) {
		Session session = factory.getCurrentSession();
		return session.get(ManageStatusBean.class, manageStatusId);
	}
	@Override
	public MemberBean checkId(String account) {
		MemberBean mb = null;
		Session session = factory.getCurrentSession();
		String hql = "FROM MemberBean m WHERE m.member_account = :mid";
		try {
			mb = (MemberBean) session.createQuery(hql)
									 .setParameter("mid", account)
									 .getSingleResult();
		} catch (NoResultException ex) {
			ex.printStackTrace();
		}
		return mb;
	}
	@Override
	public MemberBean getMember(int memberId) {
		Session session = factory.getCurrentSession();
		return session.get(MemberBean.class, memberId);
	}
	@Override
	public void updateMember(MemberBean member) {
		Session session = factory.getCurrentSession();
		session.update(member);
	}
	@Override
	public MemberBean checkMemberHashCode(String hashCode) {
		String hql = "FROM MemberBean m WHERE m.member_verification_code = :hashCode AND manage_status_id = 3";
		Session session = factory.getCurrentSession();
		return (MemberBean) session.createQuery(hql).setParameter("hashCode", hashCode).getSingleResult();
	}
	@Override
	public void updateMemberStatus(int memberId) {
		String hql = "UPDATE MemberBean m SET m.manage_status_id = 1 WHERE m.member_id = :memberId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("memberId", memberId).executeUpdate();
	}
	@Override
	public void clearVerificationCode(int memberId) {
		String hql = "UPDATE MemberBean m SET m.member_verification_code = null WHERE m.member_id = :memberId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("memberId", memberId).executeUpdate();
	}
	@Override
	public MemberBean checkIdMail(String account, String email) {
		String hql = "FROM MemberBean m WHERE m.member_account = :account AND m.member_email = :email";
		Session session = factory.getCurrentSession();
		return (MemberBean) session.createQuery(hql).setParameter("account", account).setParameter("email", email).getSingleResult();
	}
	@Override
	public void updatePassword(String memberId, String password) {
		String hql = "UPDATE MemberBean m SET m.member_pw = :pw WHERE m.member_id = :memberId";
		Session session = factory.getCurrentSession();
		session.createQuery(hql).setParameter("pw", password).setParameter("memberId", memberId).executeUpdate();
	}
}
