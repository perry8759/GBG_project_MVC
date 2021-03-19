package com.web.GBG_project.ACT.service;

import java.sql.Clob;
import java.sql.Timestamp;
import java.text.ParseException;
import java.util.List;
import java.util.Map;

import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.ACT.model.ACT_QES;
import com.web.GBG_project.ACT.model.ACT_RFORM;
import com.web.GBG_project.ACT.model.ACT_RULE;
import com.web.GBG_project.ACT.model.ACT_STATUS;
import com.web.GBG_project.member.model.MemberBean;

public interface ACTService {

	void insertACT(ACT act_bean);//新增活動
	void update_ACT_follow(ACT act_bean);
	int allACT_Count() ;//計算所有活動數量
	List<ACT> getACT_Max(int start, int count) ;//取得一頁需要幾筆活動
	List<ACT> select(Integer memberid);//依據主辦方編號取得他的活動
	List<ACT> allACT();//取得所有活動
	void updateact_status_examlock(ACT bean);//管理員驗證後，封鎖此活動
	void updateact_status_exampass(ACT bean,Integer tt);//管理員驗證後，通過此活動
	ACT getACT(int act_id);//取得單一活動資訊
	ACT_STATUS getACT_STATUS(int act_status_id);//取得單一活動狀態資訊
	ACT_RULE getACT_RULE(int act_rule_id);//取得單一活動賽制資訊
	List<ACT_STATUS> select_actstatus();//取得所有活動狀態
	List<ACT_RULE> select_actrule();//取得所有活動賽制
	List<ACT> getall_act_lock_status();//取得所有已封鎖的活動
	List<ACT> getall_act_nopass_status();//取得所有未審核的活動
	List<ACT> getall_act_pass_status();//取的所有通過的活動
	List<ACT> getall_act_one_status(Integer sportid);
	List<ACT> getall_act_one_status_max(int start, int count,Integer sportid);
	List<ACT> getall_act_two_status(Integer sportid);
	List<ACT> getall_act_two_status_max(int start, int count,Integer sportid);
	List<ACT> getall_act_three_status(Integer sportid);
	List<ACT> getall_act_three_status_max(int start, int count,Integer sportid);
	List<ACT> getall_act_follow_up(int start, int count,Integer sportid);
	List<ACT> getall_act_follow_one_up(int start, int count,Integer sportid);
	List<ACT> getall_act_follow_two_up(int start, int count,Integer sportid);
	List<ACT> getall_act_follow_three_up(int start, int count,Integer sportid);
	Integer getTime_to_status(String ACT_MAIN_OPENING,String ACT_MAIN_CLOSING);//依據時間判斷目前狀態
	Timestamp changeTS(String date) throws ParseException;//string to timestamp，非dao
	String changeTS2S(Timestamp ts);// timestamp to string，非dao
//===============================================================================
	List<ACT> getACTBySportid(int start, int count,int sportid) ;//取得一頁需要幾筆活動(篩選運動類別)
	int getACTCountBySportid(int sportid) ;//計算活動數量(篩選運動類別)
	List<ACT> getActByMem(Integer member_id);
	
	Integer getTime_to_status(ACT act) ;
	void update(ACT actBean);
	
	ACT_QES getQesById(int pk);
	int updateQes(ACT_QES qes,String comment);
	int insertQes(ACT_QES qesBean, String comment);
	void deleteQes(Integer qesid);
	Map<String, List<String>> getActQes(Integer actid);
	Map<ACT, Map<ACT_QES,String>> getQesByMem(Integer memid);
	
	Object save(ACT_RFORM form);
	ACT_RFORM getFormById(int pk);
	MemberBean getACTHolder(Integer actid);

	String getActNews(Integer actid);
	void updateNews(String news, ACT actBean);
	
	 Clob StringToClob(String string);
	 String ClobToString(Clob clob) ;
}
