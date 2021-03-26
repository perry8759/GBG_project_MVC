package _00_init.util.init;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Blob;
import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.web.GBG_project.member.model.ManageStatusBean;
import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.member.model.MemberPermBean;
import com.web.GBG_project.member.model.MemberSexBean;
import com.web.GBG_project.util.CommonUtils;

import _00_init.util.HibernateUtils;

public class MemberTableResetHibernateGBG {

	public void load() {
		final String PATH = "src/main/resources/mysqlData/";
		final String IMG_PATH = "src/main/resources/mysqlData/memberImg/";
		String line = "";
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		CommonUtils common = new CommonUtils();

		//新增member資料
		try (
				InputStreamReader isr = new InputStreamReader(new FileInputStream(PATH + "member.dat"), "UTF-8");
				BufferedReader br = new BufferedReader(isr);
			) {
			tx = session.beginTransaction();
			int count = 0;
			while ((line = br.readLine()) != null) {
				String[] sa = line.split(",");
				SimpleDateFormat sdf1 =   new SimpleDateFormat("yyyy/MM/dd");
				SimpleDateFormat sdf2 =   new SimpleDateFormat("yyyy-MM-dd HH:mm:ss SSS");
				java.util.Date date = sdf2.parse(sa[10]);
				MemberBean memberBean = new MemberBean();
				memberBean.setMember_account(sa[0]);
				memberBean.setMember_address(sa[1]);
				memberBean.setMember_birthday((sa[2].isEmpty() ? null : new Date(sdf1.parse(sa[2]).getTime())));
				memberBean.setMember_cp_name(sa[3]);
				memberBean.setMember_email(sa[4]);
				memberBean.setMember_fixed_line_telephone(sa[5]);
				
				//處理圖片
				File picf = new File(IMG_PATH + sa[6]);
				long size = picf.length();
				InputStream is = new FileInputStream(picf);
				Blob picb = Hibernate.getLobCreator(session).createBlob(is, size);
				memberBean.setMember_image(picb);
				
				memberBean.setMember_mobile_phone(sa[7]);
				memberBean.setMember_pw(common.getMD5Endocing(sa[8]));
				memberBean.setMember_real_name(sa[9]);
				memberBean.setMember_register_date(new Timestamp(date.getTime()));
				memberBean.setMember_tax_id_number(sa[11]);
				memberBean.setMember_user_name(sa[12]);
				memberBean.setMember_verification_code(sa[13]);
				memberBean.setManage_status_id(session.get(ManageStatusBean.class, Integer.valueOf(sa[14])));
				memberBean.setMember_perm_id(session.get(MemberPermBean.class, Integer.valueOf(sa[15])));
				memberBean.setMember_sex_id(session.get(MemberSexBean.class, Integer.valueOf(sa[16])));
				session.save(memberBean);
				System.out.println("member新增" + count + "筆記錄");
				count++;
			}
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
	}

}
