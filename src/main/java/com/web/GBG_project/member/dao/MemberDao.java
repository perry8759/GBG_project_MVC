package com.web.GBG_project.member.dao;

import java.util.List;

import com.web.GBG_project.member.model.ManageStatusBean;
import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.member.model.MemberPermBean;
import com.web.GBG_project.member.model.MemberSexBean;

public interface MemberDao {
	MemberBean checkIdPassword(String userId, String password);
	MemberBean checkId(String userId);
	void saveMember(MemberBean mb);
	List<MemberSexBean> getSex();
	MemberSexBean getMemberSex(int memberSexId);
	MemberPermBean getMemberPerm(int memberPermId);
	ManageStatusBean getManageStatus(int manageStatusId);
	MemberBean getMember(int memberId);
}