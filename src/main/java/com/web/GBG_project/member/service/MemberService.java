package com.web.GBG_project.member.service;

import java.util.List;

import javax.mail.Session;

import com.web.GBG_project.member.model.ManageStatusBean;
import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.member.model.MemberSexBean;

public interface MemberService {
	void saveMember(MemberBean mb);
	MemberBean checkIdPassword(String userId, String password);
	List<MemberSexBean> getSex();
	MemberBean checkId(String account);
	MemberBean getMember(int memberId);
	void updateMember(MemberBean member);
	void registerVerification(String HashCode);
	MemberBean checkIdMail(String account, String email);
	MemberBean checkMemberHashCode(String hashCode, Integer memberStatusId);
	void updatePassword(int memberId, String password);
	void clearVerificationCode(int memberId);
	List<MemberBean> getAllMember();
	List<ManageStatusBean> getManageStatus();
}