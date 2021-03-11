package com.web.GBG_project.course.dao.impl;

import java.util.List;

import com.web.GBG_project.course.model.MatchBean;
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

	//================
	Object save(MatchTeamBean bean);

	MatchTeamBean getTeam(int pk);

	void update(MatchTeamBean newData);
	//================

	RegStatusBean getRegStatus(int pk);

}