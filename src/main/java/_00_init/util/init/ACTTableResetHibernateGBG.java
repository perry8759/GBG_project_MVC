package _00_init.util.init;

/*  
    程式說明：建立表格與設定初始測試資料。
*/
import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStreamReader;
import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.ACT.model.ACT_QES;
import com.web.GBG_project.ACT.model.ACT_RULE;
import com.web.GBG_project.ACT.model.ACT_STATUS;
import com.web.GBG_project.DOS.model.DOS;
import com.web.GBG_project.DOS.model.DOS_PICTURE;
import com.web.GBG_project.DOS.model.DOS_SPORT;
import com.web.GBG_project.course.model.MatchTeamBean;
import com.web.GBG_project.course.model.RegStatusBean;
import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.util.CommonUtils;

import _00_init.util.HibernateUtils;

public class ACTTableResetHibernateGBG {
	public static final String UTF8_BOM = "\uFEFF"; // 定義 UTF-8的BOM字元

	public  void load() {

		String line = "";
		String path = "src/main/resources/ActInitData/";
		String IMGpath = "src/main/resources/ActInitData/ActIMG/";

		int count = 0;
		SessionFactory factory = HibernateUtils.getSessionFactory();
		Session session = factory.openSession();
		Transaction tx = null;
		CommonUtils commonUtils=new CommonUtils();
		
	// -------------讀取DOS Pic資料，寫入資料庫----------------
		try (
				InputStreamReader isr0 = new InputStreamReader(new FileInputStream(path + "dos_pic.dat"), "UTF-8");
				BufferedReader br = new BufferedReader(isr0);) {
				tx = session.beginTransaction();
				
				while ((line = br.readLine()) != null) {
					String[] sa = line.split("\\|");
					DOS_PICTURE pic=new DOS_PICTURE();
					byte[] fileContent =Files.readAllBytes(new File(IMGpath+sa[0]).toPath());
					pic.setDOS_PICTURE_PIC(fileContent);
					
					count++;
					System.out.println("新增" + count + "筆記錄:" + sa[0]);
				}
				tx.commit();
			} catch (Exception e) {
				e.printStackTrace();
				tx.rollback();
			}
			System.out.println("Dos Pic Complete ========================<" );
		// -------------讀取DOS資料，寫入資料庫----------------
//		場地管理人|場地地址|容納人數|緯度|經度|場地名稱|場地聯絡人|場地費用|場地租借聯絡方式|場地備註|場地交通方式|場地運動種類編號
		try (
			InputStreamReader isr0 = new InputStreamReader(new FileInputStream(path + "dos.dat"), "UTF-8");
			BufferedReader br = new BufferedReader(isr0);) {
			tx = session.beginTransaction();
			
			while ((line = br.readLine()) != null) {
				String[] sa = line.split("\\|");
				DOS dos=new DOS();
				dos.setDOS_AD(sa[0]);
				dos.setDOS_ADDR(sa[1]);
				dos.setDOS_CY(Integer.parseInt(sa[2].trim()));
				dos.setDOS_LAT(Double.parseDouble(sa[3]));
				dos.setDOS_LONG(Double.parseDouble(sa[4]));
				dos.setDOS_NAME(sa[5]);
				dos.setDOS_OFFICER(sa[6]);
				dos.setDOS_PAY(Integer.parseInt(sa[7].trim()));
				dos.setDOS_PHONE(sa[8]);
				dos.setDOS_PS(sa[9]);
				dos.setDOS_TRANS(sa[10]);;
				dos.setDos_sport(session.get(DOS_SPORT.class, Integer.parseInt(sa[11].trim())));
			//  >-----------圖片-----------<
				Set<DOS_PICTURE> set=new HashSet<>();
				String[] ps = sa[12].split("&");
				Arrays.stream(ps).forEach(p->{
					set.add(session.get(DOS_PICTURE.class, Integer.parseInt(p.trim())));
				});
				dos.setDos_picture(set);
				
				session.save(dos);
				count++;
				System.out.println("新增" + count + "筆記錄:" + sa[0]);
			}
			tx.commit();
		} catch (Exception e) {
			e.printStackTrace();
			tx.rollback();
		}
		System.out.println("Dos Complete ========================<" );
		
//		 -------------讀取ACT資料，寫入資料庫----------------
//		活動宗旨|圖片路徑|隊伍數量|隊伍人數|活動公告|報名費用|活動人數|活動結束時間|活動開始時間|報名結束時間|報名開始時間|比賽名稱 |主辦會員id|賽制|比賽狀態|場地id|球類
//		如果報錯: 開mysql的cmd，下指令: set global max_allowed_packet = 20*1024*1024;
				try (
						InputStreamReader isr0 = new InputStreamReader(new FileInputStream(path + "act.dat"), "UTF-8");
						BufferedReader br = new BufferedReader(isr0);) {
					tx = session.beginTransaction();
					while ((line = br.readLine()) != null) {
						String[] sa = line.split("\\|");
						for(String s:sa) {
							s.trim();
						}
						byte[] fileContent = Files.readAllBytes(new File(IMGpath+sa[1]).toPath());
						
						ACT act = new ACT();
						act.setACT_DESC(sa[0]);
						act.setACT_LOGO(fileContent);
						act.setACT_MAX_TEAM(Integer.parseInt(sa[2]));
						act.setACT_MAX_PNUM(Integer.parseInt(sa[3]));
						act.setACT_PAY(Integer.parseInt(sa[5]));
						act.setACT_RUN_C(commonUtils.StringToTimestamp(sa[7]));
						act.setACT_RUN_O(commonUtils.StringToTimestamp(sa[8]));
						act.setACT_SIGN_C(commonUtils.StringToTimestamp(sa[9]));
						act.setACT_SIGN_O(commonUtils.StringToTimestamp(sa[10]));
						act.setACT_TITLE(sa[11]);
						act.setMEMBER_ID(Integer.parseInt(sa[12]));
						act.setAct_rule(session.get(ACT_RULE.class, Integer.parseInt(sa[13])));
						act.setAct_status(session.get(ACT_STATUS.class,Integer.parseInt(sa[14])));
						act.setDos_id(session.get(DOS.class, Integer.parseInt(sa[15])));
						act.setDos_sport(session.get(DOS_SPORT.class,Integer.parseInt(sa[16])));
						session.save(act);
						count++;
						System.out.println("新增" + count + "筆記錄:" + sa[0]);
					}
					tx.commit();
				} catch (Exception e) {
					e.printStackTrace();
					tx.rollback();
				}
				System.out.println("ActDos Complete ========================<" );
				
//				 -------------讀取qes資料，寫入資料庫----------------
//				act,MEMBER_ID,ACT_QES_COM
				try (
						InputStreamReader isr0 = new InputStreamReader(new FileInputStream(path + "qes.dat"), "UTF-8");
						BufferedReader br = new BufferedReader(isr0);) {
					tx = session.beginTransaction();
					while ((line = br.readLine()) != null) {
						String[] sa = line.split(",");
						ACT_QES qes=new ACT_QES();
						qes.setAct(session.get(ACT.class, Integer.parseInt(sa[0].trim()) ));
						qes.setMEMBER_ID(Integer.parseInt(sa[1].trim()));
						qes.setACT_QES_COM(commonUtils.StringToClob(sa[2]));
						
						session.save(qes);
						count++;
						System.out.println("新增qes" + count + "筆記錄:" + sa[0]);
					}
					tx.commit();
				} catch (Exception e) {
					e.printStackTrace();
					tx.rollback();
				}
				System.out.println("qes Complete ========================<" );
				
//				 -------------讀取team資料，寫入資料庫----------------
//		隊伍名稱|單位名稱|活動編號|報名狀態編號
				try (
						InputStreamReader isr0 = new InputStreamReader(new FileInputStream(path + "team_temp.dat"), "UTF-8");
						BufferedReader br = new BufferedReader(isr0);) {
					tx = session.beginTransaction();
					while ((line = br.readLine()) != null) {
						String[] sa = line.split("\\|");
						MatchTeamBean teamBean=new MatchTeamBean();
						teamBean.setTeam_name(sa[0]);
						teamBean.setTeam_unit(sa[1]);
						teamBean.setAct_id(session.get(ACT.class, Integer.parseInt(sa[2])));
						teamBean.setReg_status_id(session.get(RegStatusBean.class, Integer.parseInt(sa[3])));
						List<MemberBean> list=new ArrayList<>();
						list.add(session.get(MemberBean.class, Integer.parseInt(sa[4])));
						teamBean.setMembers(list);
						
						session.save(teamBean);
						count++;
						System.out.println("新增team" + count + "筆記錄:" + sa[0]);
					}
					tx.commit();
				} catch (Exception e) {
					e.printStackTrace();
					tx.rollback();
				}
				System.out.println("Team Complete ========================<" );
	}
}