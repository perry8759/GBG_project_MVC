package com.web.GBG_project.member.service.impl;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.web.GBG_project.member.dao.MemberDao;
import com.web.GBG_project.member.model.ManageStatusBean;
import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.member.model.MemberPermBean;
import com.web.GBG_project.member.model.MemberSexBean;
import com.web.GBG_project.member.service.MemberService;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	MemberDao dao;
	
	public static String getMD5Endocing(String message) {
		
		final StringBuffer buffer = new StringBuffer();
		try {
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(message.getBytes());
			byte[] digest = md.digest();

			for (int i = 0; i < digest.length; ++i) {
				final byte b = digest[i];
				final int value = Byte.toUnsignedInt(b);
				buffer.append(value < 16 ? "0" : "");
				buffer.append(Integer.toHexString(value));
			}
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
			return null;
		}
		return buffer.toString();
	}
	
	@Override
	@Transactional
	public void saveMember(MemberBean mb) {
		MemberSexBean sex = dao.getMemberSex(mb.getMember_sex_id().getMember_sex_id());
		MemberPermBean perm = dao.getMemberPerm(mb.getMember_perm_id().getMember_perm_id());
		ManageStatusBean manageStatus = dao.getManageStatus(mb.getManage_status_id().getManage_status_id());
		Timestamp memberRegisterDate = new Timestamp(System.currentTimeMillis());
		mb.setMember_pw(getMD5Endocing(mb.getMember_pw()));
		mb.setMember_sex_id(sex);
		mb.setMember_perm_id(perm);
		mb.setManage_status_id(manageStatus);
		mb.setMember_register_date(memberRegisterDate);
		dao.saveMember(mb);
	}
	
	@Override
	@Transactional
	public MemberBean checkIdPassword(String userId, String password) {
		return dao.checkIdPassword(userId, password);
	}
	
	@Transactional
	@Override
	public List<MemberSexBean> getSex() {
		return dao.getSex();
	}
	
	@Transactional
	@Override
	public MemberBean checkId(String userId) {
		return dao.checkId(userId);
	}

}
