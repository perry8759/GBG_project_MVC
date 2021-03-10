package com.web.GBG_project.ACT.dao;

import java.util.List;

import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.ACT.model.ACT_QES;
import com.web.GBG_project.ACT.model.ACT_RFORM;
import com.web.GBG_project.ACT.model.ACT_RULE;
import com.web.GBG_project.ACT.model.ACT_STATUS;


public interface ACTDao {
    //直接查看ACTService說明
	void insertACT(ACT act_bean);
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
//===============
	//依運動種類選活動
	public List<ACT> getACTBySportid(int start, int count,int sportid);
	public int getACTCountBySportid(int sportid) ;
	//--------Act
	Object save(ACT act);
	void update(ACT bean);
	//--------Qes
	Object save(ACT_QES qes);
	ACT_QES getQesById(int pk);
	void update(ACT_QES qes);
	void deleteQes(int pk);
	//--------Form
	Object save(ACT_RFORM form);
	ACT_RFORM getFormById(int pk);
	void update(ACT_RFORM form);
	void deleteForm(int pk);
}
