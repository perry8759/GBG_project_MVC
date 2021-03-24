package com.web.GBG_project.course.service;

import java.util.List;

import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.course.model.MatchBean;
import com.web.GBG_project.course.model.MatchPairBean;
import com.web.GBG_project.course.model.MatchStatusBean;
import com.web.GBG_project.course.model.MatchTeamBean;
import com.web.GBG_project.course.model.RegStatusBean;
import com.web.GBG_project.member.model.MemberBean;

public interface MatchService {

	void update(MatchBean e);

	void deleteMatch(int pk);

	List<MatchBean> getAllMatch();

	MatchStatusBean getStatus(int pk);

	//================
	MatchTeamBean getTeam(int pk);
	
	public void update(MatchTeamBean team);

	void insertTeam(MatchTeamBean team);

	MemberBean getMemberByAccount(String member_account);

	//	List<MatchTeamBean> getTeamsByActid(Integer actid);
	
	List<RegStatusBean> getAllStatus();

	void updateTeamRegState(ACT actBean);

	//********
	List<MatchTeamBean> getAllMatch_team();
	List<MatchStatusBean> getAllMatch_status() ;
	void main_save(MatchBean bean);
	List<MatchBean> getAllMatch_one_round();
	MatchBean getMatchbean(int pk);
	void save_matchpair(MatchPairBean bean);
	List<MatchPairBean> getAllMatchPair_one_round(Integer round_id);
	void score_update(Integer match_pair_id,Integer score);
	MatchPairBean getMatchPairbean(int pk);
}
