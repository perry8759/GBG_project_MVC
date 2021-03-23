package com.web.GBG_project.course.dao.impl;

import java.util.List;

import com.fasterxml.jackson.databind.deser.DataFormatReaders.Match;
import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.course.model.MatchBean;
import com.web.GBG_project.course.model.MatchPairBean;
import com.web.GBG_project.course.model.MatchStatusBean;
import com.web.GBG_project.course.model.MatchTeamBean;
import com.web.GBG_project.course.model.RegStatusBean;

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
	List<MatchPairBean> getAllMatchPair_one_round(Integer round_id);
	void score_update(Integer match_pair_id,Integer score);
	MatchPairBean getMatchPairbean(int pk);
}