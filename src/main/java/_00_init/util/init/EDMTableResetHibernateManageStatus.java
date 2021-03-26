package _00_init.util.init;

/*  
    程式說明：建立表格與設定初始測試資料。
*/
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.sql.Blob;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.Hibernate;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.web.GBG_project.member.model.ManageStatusBean;
import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.product.model.CustomerCategoryBean;
import com.web.GBG_project.product.model.ProductBean;
import com.web.GBG_project.product.model.ProductCategoryBean;
import com.web.GBG_project.product.model.ProductDetailBean;
import com.web.GBG_project.product.model.ProductPicBean;
import com.web.GBG_project.product.model.ProductStausBean;
import com.web.GBG_project.shoppingCart.model.OrderDetailsBean;
import com.web.GBG_project.shoppingCart.model.OrderSatusBean;
import com.web.GBG_project.shoppingCart.model.OrdersBean;

import _00_init.util.HibernateUtils;

public class EDMTableResetHibernateManageStatus {
	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public static void main(String args[]) {

		String line = "";
		String path = "src/main/resources/mysqlData/";

		int count = 0;
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		// -------------讀取manage_status資料，寫入資料庫----------------
				try (
						InputStreamReader isr0 = new InputStreamReader(new FileInputStream(path + "manage_status.dat"), "UTF-8");
						BufferedReader br = new BufferedReader(isr0);) {
					tx = session.beginTransaction();
					while ((line = br.readLine()) != null) {
						String[] sa = line.split("\\|");
						ManageStatusBean manageStatus = new ManageStatusBean();
						manageStatus.setManage_status_id(null);
						manageStatus.setManage_status_name(sa[0]);
						session.save(manageStatus);

						count++;
						System.out.println("新增" + count + "筆記錄:" + sa[0]);
					}
					tx.commit();
				} catch (Exception e) {
					e.printStackTrace();
					tx.rollback();
				}

//========================================================
		HibernateUtils.close();
	}
}