package com.web.GBG_project.member.dao;

import java.util.List;

import com.web.GBG_project.member.model.ManageStatusBean;
import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.member.model.MemberPermBean;
import com.web.GBG_project.member.model.MemberSexBean;

public interface MemberDao {
	MemberBean checkIdPassword(String account, String password);
	MemberBean checkId(String account);
	void saveMember(MemberBean mb);
	List<MemberSexBean> getSex();
	List<ManageStatusBean> getManageStatus();
	List<MemberBean> getAllMember();
	MemberSexBean getMemberSex(int memberSexId);
	MemberPermBean getMemberPerm(int memberPermId);
	ManageStatusBean getManageStatus(int manageStatusId);
	MemberBean getMember(int memberId);
	void updateMember(MemberBean member);
	MemberBean checkMemberHashCode(String hashCode, Integer memberStatusId);
	void updateMemberStatus(int memberId);
	void clearVerificationCode(int memberId);
	MemberBean checkIdMail(String account, String email);
	void updatePassword(int memberId, String password);
	
}