package com.web.GBG_project.member.service;

import java.util.List;

import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.member.model.MemberSexBean;

public interface MemberService {
	void saveMember(MemberBean mb);
	MemberBean checkIdPassword(String userId, String password);
	List<MemberSexBean> getSex();
	MemberBean checkId(String userId);
	MemberBean getMember(int memberId);
	void updateMember(MemberBean member);
}