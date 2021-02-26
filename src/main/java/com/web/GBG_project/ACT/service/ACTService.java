package com.web.GBG_project.ACT.service;

import java.sql.Timestamp;
import java.text.ParseException;
import java.util.List;

import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.ACT.model.ACT_RULE;
import com.web.GBG_project.ACT.model.ACT_STATUS;

public interface ACTService {

	void insertACT(ACT act_bean);//新增活動
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
	
	Integer getTime_to_status(String ACT_MAIN_OPENING,String ACT_MAIN_CLOSING);//依據時間判斷目前狀態
	Timestamp changeTS(String date) throws ParseException;//string to timestamp，非dao
	String changeTS2S(Timestamp ts);// timestamp to string，非dao
}
