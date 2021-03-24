package com.web.GBG_project.course.service.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.LinkedList;
import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.GBG_project.ACT.dao.ACTDao;
import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.course.dao.impl.MatchDao;
import com.web.GBG_project.course.model.MatchBean;
import com.web.GBG_project.course.model.MatchPairBean;
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
	public void insertTeam(MatchTeamBean team) {
		List<MemberBean> members = new LinkedList<>();
		for(MemberBean member: team.getMembers()) {
			System.out.println(member.getMember_account());
			members.add(memberDao.getMember(member.getMember_id()));
		}
		team.setMembers(members);
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
	public MemberBean getMemberByAccount(String member_account) {
		return matchDao.getMemberByAccount(member_account);
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
	
	@Transactional
	@Override
	public List<MatchTeamBean> getAllMatch_team() {
		return matchDao.getAllMatch_team();
	}
	@Transactional
	@Override
	public List<MatchStatusBean> getAllMatch_status() {
		
		return matchDao.getAllMatch_status();
	}
	@Transactional
	@Override
	public void main_save(MatchBean bean) {
		matchDao.main_save(bean);
		
	}
	@Transactional
	@Override
	public List<MatchBean> getAllMatch_one_round() {
		return matchDao.getAllMatch_one_round();
	}
	@Transactional
	@Override
	public MatchBean getMatchbean(int pk) {
		return matchDao.getMatch(pk);
	}
	@Transactional
	@Override
	public void save_matchpair(MatchPairBean bean) {
		matchDao.save_matchpair(bean);		
	}
	//***************
	@Transactional
	@Override
	public List<MatchPairBean> getAllMatchPair_one_round(Integer round_id) {
		return matchDao.getAllMatchPair_one_round( round_id);
	}
	@Transactional
	@Override
	public void score_update(Integer match_pair_id, Integer score) {
		matchDao.score_update(match_pair_id, score);
		
	}
	@Transactional
	@Override
	public MatchPairBean getMatchPairbean(int pk) {
		return matchDao.getMatchPairbean(pk);
	}
	
}
