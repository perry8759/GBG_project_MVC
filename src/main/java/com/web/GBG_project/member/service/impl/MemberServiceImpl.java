package com.web.GBG_project.member.service.impl;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Timestamp;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

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
	
	//文字加密
	private static String getMD5Endocing(String message) {
		
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
	
	//公用會員外鍵賦值方法
	private void injectionMemberRelation(MemberBean member) {
		MemberSexBean sex = dao.getMemberSex(member.getMember_sex_id().getMember_sex_id());
		MemberPermBean perm = dao.getMemberPerm(member.getMember_perm_id().getMember_perm_id());
		ManageStatusBean manageStatus = dao.getManageStatus(member.getManage_status_id().getManage_status_id());
		member.setMember_sex_id(sex);
		member.setMember_perm_id(perm);
		member.setManage_status_id(manageStatus);
	}
	
	@Transactional
	@Override
	//儲存會員資料
	public void saveMember(MemberBean member) {
		//呼叫公用外鍵賦值
		injectionMemberRelation(member);
		//將密碼加密，並setting到member物件中
		member.setMember_pw(getMD5Endocing(member.getMember_pw()));
		//製作時間戳記，並setting到member物件中
		member.setMember_register_date(new Timestamp(System.currentTimeMillis()));
		//製作會員註冊認證碼，並setting到member物件中
		member.setMember_verification_code(getMD5Endocing(member.getMember_account()) + getMD5Endocing(String.valueOf((Math.random() * 10000) + 1)));
		//將member物件送進資料庫
		dao.saveMember(member);
		//發送認證信至使用者信箱
		sendRegisterMail(member);
	}
	
	@Transactional
	@Override
	//帳號密碼驗證
	public MemberBean checkIdPassword(String userId, String password) {
		return dao.checkIdPassword(userId, getMD5Endocing(password));
	}
	
	@Transactional
	@Override
	//取得會員性別資料表
	public List<MemberSexBean> getSex() {
		return dao.getSex();
	}
	
	@Transactional
	@Override
	//確認帳號是否存在
	public MemberBean checkId(String account) {
		return dao.checkId(account);
	}
	
	@Transactional
	@Override
	//藉由會員編號搜尋會員資料
	public MemberBean getMember(int memberId) {
		return dao.getMember(memberId);
	}

	@Transactional
	@Override
	//更新會員資料
	public void updateMember(MemberBean member) {
		injectionMemberRelation(member);
		dao.updateMember(member);
	}

	//此為email server組態設定，如想發送信件認證信建請呼叫sendMemberMail方法
	private Session getMemberConfig(String userName, String password) {
		Properties properties = new Properties();
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.host", "smtp.gmail.com");
		properties.put("mail.smtp.port", "587");
		Session session = Session.getDefaultInstance(properties, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(userName, password);
			}
		});
		return session;
	}
	
	//此為email公用發送方法，根據email位址及信件內容發送訊息
	private void sendMemberMail(MemberBean member, String title, String htmlCode) {
		String userName = "progbg88@gmail.com";
		String password = "gbgjava015";
		Session session = getMemberConfig(userName, password);
		try {
			Message message = new MimeMessage(session);
			message.setFrom(new InternetAddress(userName));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(member.getMember_email()));
			message.setSubject(title);
			message.setContent(htmlCode,"text/html;charset=UTF-8");
			Transport.send(message);
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	//寄出會員註冊認證email
	private void sendRegisterMail(MemberBean member) {
		//編寫信件內文
		String htmlCode = "<h1>感謝您註冊GBG會員</h1>\n"
				+ "    <h3>\n"
				+ "        請點選此連結進行驗證： <a href=\"http://localhost:8080/GBG_project_mvc/member/register/" + member.getMember_verification_code() + "\">驗證</a>\n"
				+ "    </h3>\n"
				+ "    此電子郵件由系統自動發出，請勿直接回覆，謝謝您。<br>\n"
				+ "    如有任何疑問歡迎\b使用以下email信箱進行詢問<br>\n"
				+ "    GBG會員中心信箱：progbg88@gmail.com<br>\n"
				+ "    </h5>";
		//將member物件、信件title、信件內文送入sendMemberMail，並發送email
		sendMemberMail(member, "GBG註冊驗證", htmlCode);
	}
	//寄出會員忘記密碼email
	private void sendForgotPwMail(MemberBean member) {
		member.setMember_verification_code(getMD5Endocing(member.getMember_account()) + getMD5Endocing(String.valueOf((Math.random() * 10000) + 1)));
		//編寫信件內文
		String htmlCode = "<h1>GBG密碼重置</h1>\n"
				+ "    <h3>\n"
				+ "        請點選此連結進行密碼重設： <a href=\"http://localhost:8080/GBG_project_mvc/member/forgotPw/" + member.getMember_verification_code() + "\">驗證</a>\n"
				+ "    </h3>\n"
				+ "    此電子郵件由系統自動發出，請勿直接回覆，謝謝您。<br>\n"
				+ "    如有任何疑問歡迎\b使用以下email信箱進行詢問<br>\n"
				+ "    GBG會員中心信箱：progbg88@gmail.com<br>\n"
				+ "    </h5>";
		//將member物件、信件title、信件內文送入sendMemberMail，並發送email
		sendMemberMail(member, "GBG密碼重置驗證", htmlCode);
	}
	
	@Transactional
	@Override
	public void registerVerification(String hashCode) {
		try {
			MemberBean member = dao.checkMemberHashCode(hashCode, 3);
			dao.updateMemberStatus(member.getMember_id());
			dao.clearVerificationCode(member.getMember_id());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	@Transactional
	@Override
	public MemberBean checkIdMail(String account, String email) {
		MemberBean member = dao.checkIdMail(account, email);
		if (member != null) {
			member.setMember_verification_code(getMD5Endocing(member.getMember_account()) + getMD5Endocing(String.valueOf((Math.random() * 10000) + 1)));
			dao.updateMember(member);
			sendForgotPwMail(member);
		}
		return member;
	}
	
	@Transactional
	@Override
	//確認hashCode是否存在
	public MemberBean checkMemberHashCode(String hashCode, Integer memberStatusId) {
		return dao.checkMemberHashCode(hashCode, memberStatusId);
	}
	
	@Transactional
	@Override
	public void updatePassword(int memberId, String password) {
		dao.updatePassword(memberId, getMD5Endocing(password));
	}
	
	@Transactional
	@Override
	public void clearVerificationCode(int memberId) {
		dao.clearVerificationCode(memberId);
	}
	
	@Transactional
	@Override
	public List<MemberBean> getAllMember() {
		return dao.getAllMember();
	}
	
	@Transactional
	@Override
	public List<ManageStatusBean> getManageStatus() {
		return dao.getManageStatus();
	}
	
	@Transactional
	@Override
	public void updateManagerStatus(int memberId, int managerStatusId) {
		dao.updateManagerStatus(memberId, managerStatusId);
	}
	
}
