﻿package com.web.GBG_project.course.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.GBG_project.course.model.MatchBean;
import com.web.GBG_project.course.model.MatchStatusBean;
import com.web.GBG_project.course.model.MatchTeamBean;
import com.web.GBG_project.course.model.RegStatusBean;

@Repository
public class MatchDaoImpl implements MatchDao {
	@Autowired
	SessionFactory factory;

	public MatchDaoImpl() {
	}

	
	@Override
	public Object save(MatchBean bean) {
		Session session = factory.getCurrentSession();
		return session.save(bean);
	}


	@Override
	public MatchBean getMatch(int pk) {
		Session session = factory.getCurrentSession();
		MatchBean bean = (MatchBean) session.get(MatchBean.class, pk);

		return bean;
	}

	@Override
	public void update(MatchBean newData) {
		Session session = factory.getCurrentSession();
		MatchBean bean = (MatchBean) session.get(MatchBean.class, newData.getMatch_id());
		if (bean != null) {
				bean.setAct_id(newData.getAct_id());
				bean.setMatch_status_id(newData.getMatch_status_id());
				bean.setMatch_seq(newData.getMatch_seq());
				bean.setMatch_time(newData.getMatch_time());
		}
		return;
	}

	// 刪除紀錄
	@Override
	public void deleteMatch(int pk) {
		Session session = factory.getCurrentSession();
		MatchBean bean = new MatchBean();
		bean.setMatch_id(pk);
		session.delete(bean);
		return;
	}
	
//	// 查詢所有紀錄
	@Override
	@SuppressWarnings("unchecked")
	public List<MatchBean> getAllMatch() {
		Session session = factory.getCurrentSession();
		List<MatchBean> allMatch = session.createQuery("FROM MatchBean").getResultList();

		return allMatch;
	}
	//================
	@Override
	public MatchStatusBean getStatus(int pk) {
		Session session = factory.getCurrentSession();
		MatchStatusBean bean = (MatchStatusBean) session.get(MatchStatusBean.class, pk);

		return bean;
	}
	
	//================
	@Override
	public Object save(MatchTeamBean bean) {
		Session session = factory.getCurrentSession();
		return session.save(bean);
	}

	@Override
	public MatchTeamBean getTeam(int pk) {
		Session session = factory.getCurrentSession();
		MatchTeamBean bean = (MatchTeamBean) session.get(MatchTeamBean.class, pk);
		return bean;
	}


	@Override
	public void update(MatchTeamBean team) {
		Session session = factory.getCurrentSession();
		session.update(team);
		return;
	}
	//================

	@Override
	public RegStatusBean getRegStatus(int pk) {
		Session session = factory.getCurrentSession();
		RegStatusBean bean= (RegStatusBean) session.get(RegStatusBean.class, pk);

		return bean;
	}

}