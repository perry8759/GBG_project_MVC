﻿package com.web.GBG_project.course.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.ACT.service.ACTService;
import com.web.GBG_project.course.dao.MatchDao;
import com.web.GBG_project.course.model.MatchBean;
import com.web.GBG_project.course.model.MatchPairBean;
import com.web.GBG_project.course.model.MatchStatusBean;
import com.web.GBG_project.course.model.MatchTeamBean;
import com.web.GBG_project.course.model.RegStatusBean;
import com.web.GBG_project.member.model.MemberBean;

@Repository
public class MatchDaoImpl implements MatchDao {
	@Autowired
	SessionFactory factory;
	@Autowired
	ACTService actservice;
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
//		session.evict(team);
//		session.update(team);
		session.merge(team);
		return;
	}
	
	@Override
	public MemberBean getMemberByAccount(String account) {
		String hql = "FROM MemberBean m WHERE m.member_account = :account";
		Session session = factory.getCurrentSession();
		MemberBean member=null;
		try {
			member=(MemberBean) session.createQuery(hql)
										.setParameter("account", account)
										.getSingleResult();
		}catch (Exception e) {
			System.out.println("查無此帳號:"+account);
			e.printStackTrace();
		}
		return member;
	}
	
//	@SuppressWarnings("unchecked")
//	@Override
//	public List<MatchTeamBean> getTeamsByActid(ACT act){
//		Session session = factory.getCurrentSession();
//		String hql = "FROM MatchTeamBean a where a.act_id= :act";
//		List<MatchTeamBean> list = session.createQuery(hql)
//					.setParameter("act", act).getResultList();
//		return list;
//	}
	//================

	@Override
	public RegStatusBean getRegStatus(int pk) {
		Session session = factory.getCurrentSession();
		RegStatusBean bean= (RegStatusBean) session.get(RegStatusBean.class, pk);

		return bean;
	}
	
	@Override
	@SuppressWarnings("unchecked")
	public List<RegStatusBean> getAllStatus(){
		Session session = factory.getCurrentSession();
		List<RegStatusBean> allMatchStatus = session.createQuery("FROM RegStatusBean").getResultList();

		return allMatchStatus;
	}
	
	
	//**************
	@Override
	@SuppressWarnings("unchecked")
	public List<MatchTeamBean> getAllMatch_team() {
		Session session = factory.getCurrentSession();
		List<MatchTeamBean> allMatch = session.createQuery("FROM MatchTeamBean").getResultList();

		return allMatch;
	}


	@Override
	public List<MatchStatusBean> getAllMatch_status() {
		Session session = factory.getCurrentSession();
		List<MatchStatusBean> allMatch = session.createQuery("FROM MatchStatusBean").getResultList();

		return allMatch;
	}


	@Override
	public void main_save(MatchBean bean) {		
		Session session = factory.getCurrentSession();
		session.save(bean);
	}


	@Override
	public List<MatchBean> getAllMatch_one_round() {
		Session session = factory.getCurrentSession();
		List<MatchBean> allMatch = session.createQuery("FROM MatchBean m ").getResultList();
		return  allMatch ;
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<MatchBean> getAllMatch_by_act(int  actID) {
		Session session = factory.getCurrentSession();
		ACT act=actservice.getACT(actID);
		Integer s=act.getACT_ID();
		String hql="from MatchBean where act_id.ACT_ID=:actid";
		List<MatchBean> allMatch = (List<MatchBean>)session.createQuery(hql).setParameter("actid", s).list();
		return  allMatch ;
	}

	@Override
	@SuppressWarnings("unchecked")
	public List<MatchTeamBean> getAllMatch_team_by_act(int  actID) {
		Session session = factory.getCurrentSession();
		List<MatchTeamBean> allMatch = session.createQuery("FROM MatchTeamBean where act_id.ACT_ID=:actid").setParameter("actid", actID).getResultList();

		return allMatch;
	}

	@Override
	public MatchBean getMatchbean(int pk) {
		Session session = factory.getCurrentSession();
		MatchBean bean= (MatchBean) session.get(MatchBean.class, pk);
		return bean;
	}


	@Override
	public void save_matchpair(MatchPairBean bean) {
		Session session = factory.getCurrentSession();
		session.merge(bean);		
	}


	@Override
	public List<MatchPairBean> getAllMatchPair_one_round(Integer round_id,int actid) {
		Session session = factory.getCurrentSession();
		List<MatchPairBean> allMatch = session.createQuery("select m FROM MatchPairBean m left join m.match_id s where s.match_round= :m_round and s.act_id.ACT_ID=:actid").setParameter("actid", actid).setParameter("m_round", round_id).getResultList();
		return allMatch;
	}


	@Override
	public void score_update(Integer match_pair_id,Integer score) {
		Session session = factory.getCurrentSession();
		MatchPairBean mpb=getMatchPairbean(match_pair_id);
		mpb.setMatch_pair_score(score);
		session.saveOrUpdate(mpb);
	}


	@Override
	public MatchPairBean getMatchPairbean(int pk) {
		Session session = factory.getCurrentSession();
		MatchPairBean bean= (MatchPairBean) session.get(MatchPairBean.class, pk);
		return bean;
	}
	
	
	@Override
	@SuppressWarnings("unchecked")
public List<MatchPairBean> getall_pair_by_matchmain(Integer matchseq,int actid){
	Session session = factory.getCurrentSession();
	String sql1 = "select m FROM MatchPairBean m left join m.match_id s where s.match_seq= :matchseq and s.act_id.ACT_ID=:actid";
		List<MatchPairBean> list = session.createQuery(sql1).setParameter("actid", actid).setParameter("matchseq", matchseq).list();
		return list;
}
}
