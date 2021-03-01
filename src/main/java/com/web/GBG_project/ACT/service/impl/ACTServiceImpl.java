//service
package com.web.GBG_project.ACT.service.impl;

import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;
import javax.transaction.Transactional;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Service;

import com.web.GBG_project.ACT.dao.ACTDao;
import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.ACT.model.ACT_RULE;
import com.web.GBG_project.ACT.model.ACT_STATUS;
import com.web.GBG_project.ACT.service.ACTService;

@Service
public class ACTServiceImpl implements ACTService{
	
	ACTDao actdao;
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
}
