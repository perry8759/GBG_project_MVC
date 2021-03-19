package com.web.GBG_project.course.service.impl;

import java.util.List;
import java.util.Set;

import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.course.model.MatchBean;
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

	void insertTeam(MatchTeamBean team, Set<MemberBean> set);

//	List<MatchTeamBean> getTeamsByActid(Integer actid);
	
	List<RegStatusBean> getAllStatus();

	void updateTeamRegState(ACT actBean);

}