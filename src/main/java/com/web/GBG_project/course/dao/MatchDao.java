package com.web.GBG_project.course.dao;

import java.util.List;

import com.fasterxml.jackson.databind.deser.DataFormatReaders.Match;
import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.course.model.MatchBean;
import com.web.GBG_project.course.model.MatchPairBean;
import com.web.GBG_project.course.model.MatchStatusBean;
import com.web.GBG_project.course.model.MatchTeamBean;
import com.web.GBG_project.course.model.RegStatusBean;
import com.web.GBG_project.member.model.MemberBean;

public interface MatchDao {

	Object save(MatchBean bean);

	MatchBean getMatch(int pk);

	void update(MatchBean newData);

	// 刪除紀錄
	void deleteMatch(int pk);

	//	// 查詢所有紀錄
	List<MatchBean> getAllMatch();

	//================
	MatchStatusBean getStatus(int pk);
	
	List<RegStatusBean> getAllStatus();
	//================
	Object save(MatchTeamBean bean);

	MatchTeamBean getTeam(int pk);

	void update(MatchTeamBean newData);
	
	MemberBean getMemberByAccount(String account);
	//================

	RegStatusBean getRegStatus(int pk);

//	List<MatchTeamBean> getTeamsByActid(ACT act);
	//********
	List<MatchTeamBean> getAllMatch_team();
	List<MatchStatusBean> getAllMatch_status();
	List<MatchBean> getAllMatch_one_round();
	void main_save(MatchBean bean);
	MatchBean getMatchbean(int pk);
	void save_matchpair(MatchPairBean bean);
	List<MatchPairBean> getAllMatchPair_one_round(Integer round_id,int actid);
	void score_update(Integer match_pair_id,Integer score);
	MatchPairBean getMatchPairbean(int pk);
	List<MatchBean> getAllMatch_by_act(int  actID);
	List<MatchTeamBean> getAllMatch_team_by_act(int  actID);
	List<MatchPairBean> getall_pair_by_matchmain(Integer matchseq,int actid);
}
