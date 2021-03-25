package _00_init.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.web.GBG_project.ACT.model.ACT_RULE;
import com.web.GBG_project.ACT.model.ACT_STATUS;
import com.web.GBG_project.DOS.model.DOS_SPORT;
import com.web.GBG_project.course.model.MatchStatusBean;
import com.web.GBG_project.course.model.RegStatusBean;
import com.web.GBG_project.member.model.ManageStatusBean;
import com.web.GBG_project.member.model.MemberPermBean;
import com.web.GBG_project.member.model.MemberSexBean;

public class InitValCreate {
	public static void main(String arg[]) {

//		MemberPermBean memberPerm1 = new MemberPermBean("normal_member");
//		MemberPermBean memberPerm2 = new MemberPermBean("company_member");
//		MemberPermBean memberPerm3 = new MemberPermBean("manager");
//		
//		MemberSexBean memberSex1 = new MemberSexBean("male");
//		MemberSexBean memberSex2 = new MemberSexBean("female");
//
		ManageStatusBean manageStatus1 = new ManageStatusBean("通行");
		ManageStatusBean manageStatus2 = new ManageStatusBean("鎖定");
		ManageStatusBean manageStatus3 = new ManageStatusBean("未驗證");
		
		DOS_SPORT sport1=new DOS_SPORT(null,"籃球");
		DOS_SPORT sport2=new DOS_SPORT(null,"桌球");
		
		ACT_STATUS act_status1=new ACT_STATUS(null,"未開始報名");
		ACT_STATUS act_status2=new ACT_STATUS(null,"開放報名中");
		ACT_STATUS act_status3=new ACT_STATUS(null,"報名截止");
		ACT_STATUS act_status4=new ACT_STATUS(null,"賽事未開始");
		ACT_STATUS act_status5=new ACT_STATUS(null,"賽事進行中");
		ACT_STATUS act_status6=new ACT_STATUS(null,"賽事已結束");
		ACT_STATUS act_status7=new ACT_STATUS(null,"賽事已凍結");
		ACT_STATUS act_status8=new ACT_STATUS(null,"審核未通過");
		
		
		ACT_RULE act_rule1=new ACT_RULE(null,"單淘汰");
		ACT_RULE act_rule2=new ACT_RULE(null,"雙淘汰");
		ACT_RULE act_rule3=new ACT_RULE(null,"循環");
		
		MatchStatusBean match_status1=new MatchStatusBean("未開始");
		MatchStatusBean match_status2=new MatchStatusBean("開始");
		MatchStatusBean match_status3=new MatchStatusBean("結束");
		
		RegStatusBean regs_Status1=new RegStatusBean("審核中");
		RegStatusBean regs_Status2=new RegStatusBean("已審核");
		RegStatusBean regs_Status3=new RegStatusBean("已繳款");
		RegStatusBean regs_Status4=new RegStatusBean("未通過");
		
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			
//			session.persist(memberPerm1);
//			session.persist(memberPerm2);
//			session.persist(memberPerm3);
//			
//			session.persist(memberSex1);
//			session.persist(memberSex2);
//		
			session.persist(manageStatus1);
			session.persist(manageStatus2);
			session.persist(manageStatus3);
			
			session.persist(sport1);
			session.persist(sport2);
			
			session.persist(act_status1);
			session.persist(act_status2);
			session.persist(act_status3);
			session.persist(act_status4);
			session.persist(act_status5);
			session.persist(act_status6);
			session.persist(act_status7);
			session.persist(act_status8);
			
			session.persist(act_rule1);
			session.persist(act_rule2);
			session.persist(act_rule3);
			
			session.persist(match_status1);
			session.persist(match_status2);
			session.persist(match_status3);
			
			session.persist(regs_Status1);
			session.persist(regs_Status2);
			session.persist(regs_Status3);
			session.persist(regs_Status4);
			tx.commit();
			System.out.println("資料新增完畢");
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			// 需要印出錯誤訊息
			e.printStackTrace();
			throw new RuntimeException(e);
		} finally {
			// 關閉Session物件
			if (session != null)
				session.close();
		}
		factory.close();
	}
}
