//service
package com.web.GBG_project.ACT.service.impl;

import java.io.IOException;
import java.io.Reader;
import java.sql.Clob;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.sql.rowset.serial.SerialClob;
import javax.transaction.Transactional;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.web.GBG_project.ACT.dao.ACTDao;
import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.ACT.model.ACT_QES;
import com.web.GBG_project.ACT.model.ACT_RFORM;
import com.web.GBG_project.ACT.model.ACT_RULE;
import com.web.GBG_project.ACT.model.ACT_STATUS;
import com.web.GBG_project.ACT.service.ACTService;
import com.web.GBG_project.DOS.dao.DOSDao;
import com.web.GBG_project.DOS.model.DOS_SPORT;
import com.web.GBG_project.member.dao.MemberDao;
import com.web.GBG_project.member.model.MemberBean;

@Service
public class ACTServiceImpl implements ACTService{
	
	ACTDao actdao;
	@Autowired
	DOSDao dosdao;
	@Autowired
	MemberDao memberDao;
	
    SessionFactory factory;
    @Autowired
    public void setDao(ACTDao actdao) {
		this.actdao = actdao;
	}
	public ACTServiceImpl() {
		
	}	
	@Override
	//接收表單中的datetimepicker後，轉成timeStamp
    public Timestamp changeTS(String date) throws ParseException  {
    	SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:s");
		java.util.Date cdate1 = sdf1.parse(date);
		Timestamp ts = new Timestamp(cdate1.getTime());
		return ts;
    }
	@Override
    public String changeTS2S(Timestamp ts) {
    	String tsStr = "";  
    	DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:s");
    	try {  
    		tsStr = sdf.format(ts);
    		} catch (Exception e) {  
    		e.printStackTrace();  
    		}  
    	
    	return tsStr;  
    }
	
    //針對開放跟截止時間做目前報名狀態
  	public Integer getTime_to_status(String ACT_MAIN_OPENING,String ACT_MAIN_CLOSING)  {
  		Integer s=null;
  		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:00");
  	    java.util.Date date = new java.util.Date();
  	    String current=sdf.format(date);
  	    int result=current.compareTo(ACT_MAIN_OPENING);
  		int result1=current.compareTo(ACT_MAIN_CLOSING);
  		System.out.println(result);
  		System.out.println(result1);
  		if(result<0 && result1<0) {
  			s=1;
  		}
  		else if(result>=0 && result1<=0) {
  			s=2;
  		}
  		else {
  			s=3;
  		}		
  		return s;		
  	}
  	@Transactional
	@Override
	public void insertACT(ACT act_bean){
		actdao.insertACT(act_bean);
	}
  	@Transactional
	@Override
	public void update_ACT_follow(ACT act_bean) {
		actdao.update_ACT_follow(act_bean);
	}
  	@Transactional
	@Override
	public int allACT_Count() {			
		return actdao.allACT_Count();
	}
  	
  	@Transactional
	@Override
	public List<ACT> getACT_Max(int start, int count) {
	      return actdao.getACT_Max(start, count);
	}

  	@Transactional
	@Override
	public List<ACT> select(Integer memberid) {	
		return actdao.select(memberid);
	}

  	@Transactional
	@Override
	public List<ACT> allACT() {							
		return actdao.allACT();
	}

  	@Transactional
	@Override
	public void updateact_status_examlock(ACT bean) {
		actdao.updateact_status_examlock(bean);			
	}

  	@Transactional
	@Override
	public ACT getACT(int act_id) {											
		return actdao.getACT(act_id);
	}

  	@Transactional
	@Override
	public ACT_STATUS getACT_STATUS(int act_status_id) {					
		return actdao.getACT_STATUS(act_status_id);
	}
  	@Transactional
	@Override
	public void updateact_status_exampass(ACT bean,Integer tt) {				
		actdao.updateact_status_exampass(bean,tt);					
	}
  	@Transactional
	@Override
	public ACT_RULE getACT_RULE(int act_rule_id) {
		return actdao.getACT_RULE(act_rule_id);
	}
  	@Transactional
	@Override
	public List<ACT_STATUS> select_actstatus() {
		return actdao.select_actstatus();
	}
	@Transactional
	@Override
	public List<ACT_RULE> select_actrule() {
		return actdao.select_actrule();
	}
	@Transactional
	@Override
	public List<ACT> getall_act_lock_status() {		
		return actdao.getall_act_lock_status();
	}
	@Transactional
	@Override
	public List<ACT> getall_act_nopass_status() {
		return actdao.getall_act_nopass_status();
	}
	@Transactional
	@Override
	public List<ACT> getall_act_pass_status() {
		return actdao.getall_act_pass_status();
	}
	
//	@Transactional
//	@Override
//	public List<ACT> getall_act_one_status(Integer sportid) {
//		return actdao.getall_act_one_status(sportid);
//	}
//	@Transactional
//	@Override
//	public List<ACT> getall_act_one_status_max(int start, int count,Integer sportid) {
//		return actdao.getall_act_one_status_max(start, count, sportid);
//	}
//	@Transactional
//	@Override
//	public List<ACT> getall_act_two_status(Integer sportid) {
//		return actdao.getall_act_two_status(sportid);
//	}
//	@Transactional
//	@Override
//	public List<ACT> getall_act_two_status_max(int start, int count,Integer sportid) {
//		return actdao.getall_act_two_status_max(start, count, sportid);
//	}
//	@Transactional
//	@Override
//	public List<ACT> getall_act_three_status(Integer sportid) {
//		return actdao.getall_act_three_status(sportid);
//	}
//	@Transactional
//	@Override
//	public List<ACT> getall_act_three_status_max(int start, int count,Integer sportid) {
//		return actdao.getall_act_three_status_max(start, count, sportid);
//	}
//	@Transactional
//	@Override
//	public List<ACT> getall_act_follow_up(int start, int count,Integer sportid){
//		return actdao.getall_act_follow_up(start, count, sportid);
//	}
//	@Transactional
//	@Override
//	public List<ACT> getall_act_follow_one_up(int start, int count,Integer sportid){
//		return actdao.getall_act_follow_one_up(start, count, sportid);
//	}
//	@Transactional
//	@Override
//	public List<ACT> getall_act_follow_two_up(int start, int count,Integer sportid){
//		return actdao.getall_act_follow_two_up(start, count, sportid);
//	}
//	@Transactional
//	@Override
//	public List<ACT> getall_act_follow_three_up(int start, int count,Integer sportid){
//		return actdao.getall_act_follow_three_up(start, count, sportid);
//	}
//==============================================================================
	@Transactional
	@Override
	public List<ACT> getActBySport(Integer sportid, Integer status, String order){
		return actdao.getActBySport(sportid, status, order);
	}
	
	@Transactional
	@Override
	public List<ACT> getActBySport_Slice(int start, int count, Integer sportid, Integer status, String order){
		return actdao.getActBySport_Slice(start, count, sportid, status, order);
	}
	
	@Transactional
	@Override
	public List<ACT> getActBySport_Slice(Integer start, Integer count, Integer sportid, Integer status, String order, String keyword) {
		List<ACT> list=actdao.getActBySport(sportid, status, order);
		list.removeIf(s -> !s.getACT_TITLE().contains(keyword));
		if(list.size()>start+count) {
			list.subList(start,start+count);
		}else {
			list.subList(start,list.size());
		}
		return list;
	}
	@Transactional
	@Override
	public List<ACT> getActBySport(Integer sportid,  Integer status, String order, String keyword) {
		List<ACT> list=actdao.getActBySport(sportid, status, order);
		list.removeIf(s -> !s.getACT_TITLE().contains(keyword));
		return list;
	}
	
	@Transactional
	@Override
	public List<ACT> getSpotLightAct(Integer sportid,Integer count) {
		return actdao.getSpotLightAct(sportid,count);
	}

	//依會員id找所主辦的活動
	@Transactional
	@Override
	public List<ACT> getActByMem(Integer member_id){
		return actdao.getActByMem(member_id);
	}
	@Transactional
	@Override
	public String getActNews(Integer actid) {
		if (actdao.getACT(actid).getACT_NEWS() == null) {
			return "暫無公告";
		}
		return ClobToString(actdao.getACT(actid).getACT_NEWS());
	}

	@Transactional
	@Override
	public void update(ACT act) {
		ACT data = actdao.getACT(act.getACT_ID());
		if (data.getACT_NEWS() != null) {
			act.setACT_NEWS(data.getACT_NEWS());
		} else {
			act.setACT_NEWS(StringToClob("暫無公告"));
		}
		if (data.getACT_PNUM() != null) {
			act.setACT_PNUM(data.getACT_PNUM());
		} else {
			act.setACT_PNUM(0);
		}
		if (data.getAct_rform() != null) {
			act.setAct_rform(data.getAct_rform());
		}
		if (data.getAct_qes() != null) {
			act.setAct_qes(data.getAct_qes());
		}
		if (data.getMatchs() != null) {
			act.setMatchs(data.getMatchs());
		}
		if (data.getTeams() != null) {
			act.setTeams(data.getTeams());
		}
		if (data.getFollowers() != null) {
			act.setFollowers(data.getFollowers());
		} // 看改掉cascadetype後可不可以就不用重存一遍這些集合

		act.setDos_id(dosdao.selectid(act.getDos_id().getDOS_ID()));
		act.setDos_sport(dosdao.select_sportid(act.getDos_sport().getDOS_SPORT_ID()));
		act.setAct_status(actdao.getACT_STATUS(4));//更新資料後須由管理員重新審核
		act.setAct_rule(actdao.getACT_RULE(act.getAct_rule().getACT_RULE_ID()));
		MultipartFile picture = null;
		if ((picture = act.getUploadImage()) != null) {
			try {
				byte[] b = picture.getBytes();
				act.setACT_LOGO(b);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
		actdao.update(act);
	}

	@Transactional
	@Override
	public MemberBean getACTHolder(Integer actid) {
		return memberDao.getMember(actdao.getACT(actid).getMEMBER_ID());
	}

	@Transactional
	@Override
	public int insertQes(ACT_QES qes, String comment) {
		int n = 0;
		qes.setACT_QES_COM(StringToClob(comment));
		qes.setAct(actdao.getACT(qes.getAct().getACT_ID()));
		actdao.save(qes);
//		ACT act = qes.getAct();
//		Set<ACT_QES> set = act.getAct_qes();
//		set.add(qes);
//		act.setAct_qes(set);
//		actdao.update(act);
		n++;
		return n;
	}

	@Transactional
	@Override
	public ACT_QES getQesById(int pk) {
		return actdao.getQesById(pk);
	}

	@Transactional
	@Override
	public int updateQes(ACT_QES qes, String comment) {
		int n = 0;
		qes.setAct(actdao.getACT(qes.getAct().getACT_ID()));
		qes.setACT_QES_COM(StringToClob(comment));
		actdao.update(qes);
		n++;
		return n;
	}

	@Transactional
	@Override
	public void deleteQes(Integer qesid) {
		actdao.deleteQes(qesid);
	}

	@Transactional
	@Override
	public Map<String, List<String>> getActQes(Integer actid) {
		Map<String, List<String>> map = new HashMap<>();
		Set<ACT_QES> set = actdao.getACT(actid).getAct_qes();
		for (ACT_QES qes : set) {
			String account = memberDao.getMember(qes.getMEMBER_ID()).getMember_account();
			List<String> list = null;
			if ((list = map.get(account)) == null) {
				list = new ArrayList<>();
			}
			list.add(ClobToString(qes.getACT_QES_COM()));

			map.put(account, list);
		}
		return map;
	}

	@Transactional
	@Override
	public Map<ACT, Map<ACT_QES, String>> getQesByMem(Integer memid) {
		List<ACT_QES> list = actdao.getQesByMemId(memid);
		Map<ACT, Map<ACT_QES, String>> map = new HashMap<>();
		for (ACT_QES qes : list) {
			ACT act = qes.getAct();
			Map<ACT_QES, String> qmap = null;
			if ((qmap = map.get(act)) == null) {
				qmap = new HashMap<>();
			}
			qmap.put(qes, ClobToString(qes.getACT_QES_COM()));
			map.put(act, qmap);
		}
		return map;
	}

//	========================================
	@Transactional
	@Override
	public Object save(ACT_RFORM form) {
		return actdao.save(form);
	}

	@Transactional
	@Override
	public ACT_RFORM getFormById(int pk) {
		return actdao.getFormById(pk);
	}

	@Transactional
	@Override
	// 針對開放跟截止時間做目前報名狀態//要再修，邏輯不對
	public Integer getTime_to_status(ACT act) {
		Integer s = null;
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		java.util.Date date = new java.util.Date();
		String current = sdf.format(date);
		int result = current.compareTo(sdf.format(act.getACT_SIGN_O()));
		int result1 = current.compareTo(sdf.format(act.getACT_SIGN_C()));
		int result2 = 0;
		int result3 = 0;
		if (act.getACT_RUN_C() != null) {
			result2 = current.compareTo(sdf.format(act.getACT_RUN_C()));
		}
		if (act.getACT_RUN_C() != null) {
			result3 = current.compareTo(sdf.format(act.getACT_RUN_O()));
		}
		if (result < 0 && result1 < 0) {
			s = 1;// 未開始報名
		} else if (result >= 0 && result1 <= 0) {
			s = 2;// 開放報名中
		} else if (result1 >= 0 && result2 <= 0) {
			s = 3;// 報名截止
		} else if (result2 <= 0 && result3 <= 0) {
			s = 4;// 賽事進行中
		} else {
			s = 5;// 賽事已結束
		}
		return s;
	}

	@Transactional
	@Override
	public void updateNews(String news, ACT data) {
		ACT act = actdao.getACT(data.getACT_ID());
		act.setACT_NEWS(StringToClob(news));
		actdao.update(act);
	}

//	=======================================
	@Override
	public Clob StringToClob(String string) {
		Clob clob = null;
		try {
			clob = new SerialClob(string.toCharArray());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return clob;
	}

	@Override
	public String ClobToString(Clob clob) {
		Reader r;
		StringBuffer buffer = new StringBuffer();
		try {
			r = clob.getCharacterStream();
			int ch;
			while ((ch = r.read()) != -1) {
				buffer.append("" + (char) ch);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return buffer.toString();
	}
}
