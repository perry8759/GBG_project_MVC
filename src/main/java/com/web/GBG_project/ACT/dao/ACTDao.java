package com.web.GBG_project.ACT.dao;

import java.util.List;

import com.web.GBG_project.ACT.model.ACT;
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
}
