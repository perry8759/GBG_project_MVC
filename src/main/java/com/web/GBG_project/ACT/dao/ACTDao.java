package com.web.GBG_project.ACT.dao;

import java.sql.Clob;
import java.util.List;

import org.hibernate.Session;

import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.ACT.model.ACT_QES;
import com.web.GBG_project.ACT.model.ACT_RFORM;
import com.web.GBG_project.ACT.model.ACT_RULE;
import com.web.GBG_project.ACT.model.ACT_STATUS;


public interface ACTDao {
    //直接查看ACTService說明
	void insertACT(ACT act_bean);
	void update_ACT_follow(ACT act_bean);
	int allACT_Count() ;
	List<ACT> getACT_Max(int start, int count) ;
	List<ACT> select(Integer memberid);
	List<ACT> allACT();
	void updateact_status_examlock(ACT bean);
	void updateact_status_exampass(ACT bean,Integer tt);
	ACT getACT(int act_id);
	ACT_STATUS getACT_STATUS(int act_status_id);
	ACT_RULE getACT_RULE(int act_rule_id);
	List<ACT_STATUS> select_actstatus();
	List<ACT_RULE> select_actrule();
	List<ACT> getall_act_lock_status();
	List<ACT> getall_act_nopass_status();
	List<ACT> getall_act_pass_status();
//	List<ACT> getall_act_one_status(Integer sportid);
//	List<ACT> getall_act_one_status_max(int start, int count,Integer sportid);
//	List<ACT> getall_act_two_status(Integer sportid);
//	List<ACT> getall_act_two_status_max(int start, int count,Integer sportid);
//	List<ACT> getall_act_three_status(Integer sportid);
//	List<ACT> getall_act_three_status_max(int start, int count,Integer sportid);
//	List<ACT> getall_act_follow_up(int start, int count,Integer sportid);
//	List<ACT> getall_act_follow_one_up(int start, int count,Integer sportid);
//	List<ACT> getall_act_follow_two_up(int start, int count,Integer sportid);
//	List<ACT> getall_act_follow_three_up(int start, int count,Integer sportid);
//============================================================================
	//篩選活動
	List<ACT> getActBySport(Integer sportid, Integer status, String order);
	List<ACT> getActBySport_Slice(int start, int count, Integer sportid, Integer status, String order);
	
	List<ACT> getSpotLightAct(Integer sportid,Integer count);

	//依會員選活動
	List<ACT> getActByMem(Integer member_id);

	//--------Act
	Object save(ACT act);
	void update(ACT bean);
	void updateNews(Clob news, ACT act);
	//--------Qes
	Object save(ACT_QES qes);
	ACT_QES getQesById(int pk);
	void update(ACT_QES qes);
	void deleteQes(int pk);
	List<ACT_QES> getQesByMemId(int memid);
	//--------Form
	Object save(ACT_RFORM form);
	ACT_RFORM getFormById(int pk);
	void update(ACT_RFORM form);
	void deleteForm(int pk);
}
