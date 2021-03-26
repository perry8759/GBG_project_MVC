package _00_init.util.init;

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
import com.web.GBG_project.product.model.CustomerCategoryBean;
import com.web.GBG_project.product.model.ProductCategoryBean;
import com.web.GBG_project.product.model.ProductStausBean;
import com.web.GBG_project.shoppingCart.model.OrderSatusBean;

import _00_init.util.HibernateUtils;

public class InitValCreate {
	
	public void load() {
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.getCurrentSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();

			String[] memberPermVal = {"一般會員","單位會員","管理員"};
			for(String val:memberPermVal) {
				session.persist(new MemberPermBean(val));
			}
			
			String[] memberSexVal = {"男","女"};
			for(String val:memberSexVal) {
				session.persist(new MemberSexBean(val));
			}
			
			String[] manageStatusVal = {"正常","鎖定","未驗證"};
			for(String val:manageStatusVal) {
				session.persist(new ManageStatusBean(val));
			}
			
			String[] sportVal = {"籃球","桌球"};
			for(String val:sportVal) {
				session.persist(new DOS_SPORT(null,val));
			}
			
			String[] act_statusVal = {"未開始報名","開放報名中","報名截止","賽事未開始","賽事進行中","賽事已結束","賽事已凍結","審核未通過","未審核"};
			for(String val:act_statusVal) {
				session.persist(new ACT_STATUS(null,val));
			}

			String[] act_ruleVal = {"單淘汰","雙淘汰","循環"};
			for(String val:act_ruleVal) {
				session.persist(new ACT_RULE(null,val));
			}

			String[] match_statusVal = {"未開始","開始","結束"};
			for(String val:match_statusVal) {
				session.persist(new MatchStatusBean(val));
			}
			
			String[] regs_StatusVal = {"審核中","已審核","已繳款","未通過"};
			for(String val:regs_StatusVal) {
				session.persist(new RegStatusBean(val));
			}

			String[] orderStatusVal = {"處理中","已發貨","完成訂單","取消訂單"};
			for(String val:orderStatusVal) {
				OrderSatusBean orderStatus = new OrderSatusBean();
				orderStatus.setOrder_stname(val);
				session.persist(orderStatus);
			}

			String[] customerCategoryVal = {"男性","女性","兒童","其他"};
			for(String val:customerCategoryVal) {
				CustomerCategoryBean customerCategory = new CustomerCategoryBean();
				customerCategory.setCustomer_category_name(val);
				session.persist(customerCategory);
			}
			
			String[] productCategoryVal = {"上衣","褲子","鞋子","外套","襪子","球具","護具"};
			for(String val:productCategoryVal) {
				ProductCategoryBean productCategory = new ProductCategoryBean();
				productCategory.setCategory_name(val);
				session.persist(productCategory);
			}
			
			String[] productStausVal = {"已上架","已下架"};
			for(String val:productStausVal) {
				ProductStausBean productStaus = new ProductStausBean();
				productStaus.setProduct_st_name(val);
				session.persist(productStaus);
			}
			
			tx.commit();
			System.out.println("初始化 Complete ========================<" );
		} catch (Exception e) {
			if (tx != null)
				tx.rollback();
			// 需要印出錯誤訊息
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
}
