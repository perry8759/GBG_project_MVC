package com.web.GBG_project.course.service.impl;

import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.GBG_project.ACT.dao.ACTDao;
import com.web.GBG_project.course.dao.impl.MatchDao;
import com.web.GBG_project.course.model.MatchBean;
import com.web.GBG_project.course.model.MatchStatusBean;
import com.web.GBG_project.course.model.MatchTeamBean;
import com.web.GBG_project.course.model.RegStatusBean;
import com.web.GBG_project.member.dao.MemberDao;
import com.web.GBG_project.member.model.MemberBean;

@Service
public class MatchServiceImpl implements MatchService {
	@Autowired
	MatchDao matchDao ;
	@Autowired
	ACTDao actDao;
	@Autowired
	MemberDao memberDao;
	public MatchServiceImpl() {
	}

	@Transactional
	@Override
	public void update(MatchBean e) {
		matchDao.update(e);
	}
	@Transactional
	@Override
	public void deleteMatch(int pk) {
		matchDao.deleteMatch(pk);
	}
	@Transactional
	@Override
	public List<MatchBean> getAllMatch() {
		return matchDao.getAllMatch();
	}
	@Transactional
	@Override
	public MatchStatusBean getStatus(int pk) {
		return matchDao.getStatus(pk);
	}
//================team
	@Transactional
	@Override
	public MatchTeamBean getTeam(int pk) {
		return matchDao.getTeam(pk);
	}
	
	@Transactional
	@Override
	public void insertTeam(MatchTeamBean team, Set<MemberBean> set) {
		team.setMembers(set);
		team.setAct_id(actDao.getACT(team.getAct_id().getACT_ID()));
		team.setReg_status_id(matchDao.getRegStatus(1));
		matchDao.save(team);
	}
	
	@Transactional
	@Override
	public void update(MatchTeamBean team, Set<MemberBean> set) {
		team.setMembers(set);
		team.setAct_id(actDao.getACT(team.getAct_id().getACT_ID()));
		team.setReg_status_id(matchDao.getRegStatus(team.getReg_status_id().getReg_status_id()));
		matchDao.update(team);
	}
	
	
}
