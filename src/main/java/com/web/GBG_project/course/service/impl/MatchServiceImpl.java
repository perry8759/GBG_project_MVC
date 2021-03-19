package com.web.GBG_project.course.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.GBG_project.ACT.dao.ACTDao;
import com.web.GBG_project.ACT.model.ACT;
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
	
	@Transactional
	@Override
	public List<RegStatusBean> getAllStatus(){
		return matchDao.getAllStatus();
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
	public void update(MatchTeamBean team) {
		MatchTeamBean data=matchDao.getTeam(team.getMatch_team_id());
		team.setMembers(data.getMembers());
		team.setAct_id(data.getAct_id());
		team.setReg_status_id(matchDao.getRegStatus(1)); //更新隊伍資料後，需重新審核資料
		team.setScores(data.getScores());
		matchDao.update(team);
	}
	
	@Transactional
	@Override
	public void updateTeamRegState(ACT actBean) {
		for(MatchTeamBean data:actBean.getTeams()) {
			MatchTeamBean team=matchDao.getTeam(data.getMatch_team_id());
			team.setReg_status_id(matchDao.getRegStatus(data.getReg_status_id().getReg_status_id()));
			matchDao.update(team);
		}
	}
	
//	@Transactional
//	@Override
//	public List<MatchTeamBean> getTeamsByActid(Integer actid) {
//		return matchDao.getTeamsByActid(actDao.getACT(actid));
//	}
	
}
