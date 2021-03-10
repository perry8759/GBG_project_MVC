//dao(盡可能只寫sql語法)
package com.web.GBG_project.ACT.dao.impl;

import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.GBG_project.ACT.dao.ACTDao;
import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.ACT.model.ACT_QES;
import com.web.GBG_project.ACT.model.ACT_RFORM;
import com.web.GBG_project.ACT.model.ACT_RULE;
import com.web.GBG_project.ACT.model.ACT_STATUS;
import com.web.GBG_project.DOS.dao.DOSDao;

@Repository
public class ACTDaoImpl implements ACTDao{
	@Autowired   //重要
	DOSDao dosdao;
	SessionFactory factory;
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
    public ACTDaoImpl() {
		
	}
    //取得該會員所有的活動
	@SuppressWarnings("unchecked")
	@Override
	public List<ACT> select(Integer memberid) {
		Session session=factory.getCurrentSession();
		String hql = "FROM ACT a where a.MEMBER_ID= :member";
		List<ACT> act=session.createQuery(hql).setParameter("member", memberid).list();
		return act;
	}
    @Override
    //新增一筆活動資料
    public void insertACT(ACT act_bean) {
    	Session session=factory.getCurrentSession();
    	act_bean.setDos_id(dosdao.selectid(act_bean.getDos_id().getDOS_ID()));
    	act_bean.setDos_sport(dosdao.select_sportid(act_bean.getDos_sport().getDOS_SPORT_ID()));
    	act_bean.setAct_status(getACT_STATUS(act_bean.getAct_status().getACT_STATUS_ID()));
    	act_bean.setAct_rule(getACT_RULE(act_bean.getAct_rule().getACT_RULE_ID()));
    	session.save(act_bean);   		    	
    }

	@SuppressWarnings("unchecked")
	@Override
	//計數所有資料
	public int allACT_Count() {
		Session session=factory.getCurrentSession();
		int count=0;
		String hql="from ACT";
		List<ACT> list = session.createQuery(hql).getResultList();
		count=list.size();
	    return count;
	}

	@Override
    //取得商品第X筆-第X筆資料(活動狀態不能是未審核跟封鎖)
	//String select3 = "select * from act_main order by ACT_MAIN_ID desc limit ?,? ";
	@SuppressWarnings("unchecked")
	public List<ACT> getACT_Max(int start, int count) {
		Session session=factory.getCurrentSession();
		String hql="FROM ACT where act_status_id != 4 and act_status_id !=5 ORDER BY ACT_ID";
		List<ACT> list = session.createQuery(hql)
			   .setFirstResult(start)
			   .setMaxResults(count)
			   .getResultList();	
		return list;
	}
	//取得所有活動
	@SuppressWarnings("unchecked")
	@Override
	public List<ACT> allACT() {
		Session session=factory.getCurrentSession();
		String hql = "FROM ACT ";
		List<ACT> act=session.createQuery(hql).list();
		return act;
	}
	//更新活動狀態-封鎖
	@Override
	public void updateact_status_examlock(ACT act) {		
		Session session=factory.getCurrentSession();		
		ACT_STATUS act_status=getACT_STATUS(5);//封鎖編號
        act.setAct_status(act_status);
		session.update(act);
	}
	//取得該活動資訊
	public ACT getACT(int act_id) {
		Session session=factory.getCurrentSession();
		ACT act = session.get(ACT.class, act_id);		
		return act;
	}
	//取得該活動狀態
	@Override
	public ACT_STATUS getACT_STATUS(int act_status_id) {
		Session session=factory.getCurrentSession();
		ACT_STATUS act_status = session.get(ACT_STATUS.class, act_status_id);		
		return act_status;
	}
	//取得該活動賽制
	@Override
	public ACT_RULE getACT_RULE(int act_rule_id) {
		Session session=factory.getCurrentSession();
		ACT_RULE act_rule=session.get(ACT_RULE.class, act_rule_id);		
		return act_rule;
	}
	//更新活動狀態-審核通過
	//參數tt為通過的狀態編號
	@Override
	public void updateact_status_exampass(ACT bean,Integer tt) {
		Session session=factory.getCurrentSession();		
		ACT_STATUS act_status=getACT_STATUS(tt);//通過管理員驗證後，自動更新報名狀態
        bean.setAct_status(act_status);
		session.saveOrUpdate(bean);			
	}
	
	//查詢所有活動狀態
    @SuppressWarnings("unchecked")
	@Override
	public List<ACT_STATUS> select_actstatus() {
		Session session=factory.getCurrentSession();
		String hql = "FROM ACT_STATUS ";
		List<ACT_STATUS> act_status =session.createQuery(hql).list();
		return act_status;
	}
	//查詢所有活動賽制
    @SuppressWarnings("unchecked")
	@Override
	public List<ACT_RULE> select_actrule() {
		Session session=factory.getCurrentSession();
		String hql = "FROM ACT_RULE ";
		List<ACT_RULE> act_rule =session.createQuery(hql).list();
		return act_rule;
	}
	//查詢所有活動賽制
    @SuppressWarnings("unchecked")
	@Override
	public List<ACT> getall_act_lock_status() {
		Session session=factory.getCurrentSession();
		String hql = "FROM ACT a where a.act_status=5";
		List<ACT> act_lock_status =session.createQuery(hql).list();
		return act_lock_status;
	}
    @SuppressWarnings("unchecked")
	@Override
	public List<ACT> getall_act_nopass_status() {
		Session session=factory.getCurrentSession();
		String hql = "FROM ACT a where a.act_status=4";		
		List<ACT> act_lock_status =session.createQuery(hql).list();
		return act_lock_status;
	}
    @SuppressWarnings("unchecked")
	@Override
	public List<ACT> getall_act_pass_status() {
		Session session=factory.getCurrentSession();
		String hql = "FROM ACT a where a.act_status=1 or a.act_status=2 or a.act_status=3";		
		List<ACT> act_lock_status =session.createQuery(hql).list();
		return act_lock_status;
	}
//=============
  	
  	@Override
  	@SuppressWarnings("unchecked")
  	public List<ACT> getACTBySportid(int start, int count,int sportid) {
  		Session session = factory.getCurrentSession();
  		String hql = "FROM ACT where act_status_id != 4 and act_status_id !=5 and dos_sport_id = :sportid ORDER BY ACT_ID";
  		List<ACT> list = session.createQuery(hql)
  								.setParameter("sportid", sportid)
  								.setFirstResult(start).setMaxResults(count)
  								.getResultList();
  		return list;
  	}
  	@Override
  	@SuppressWarnings("unchecked")
  	public int getACTCountBySportid(int sportid) {
  		Session session = factory.getCurrentSession();
  		String hql = "FROM ACT where act_status_id != 4 and act_status_id !=5 and dos_sport_id = :sportid";
  		List<ACT> list = session.createQuery(hql)
  								.setParameter("sportid", sportid)
  								.getResultList();
  		return list.size();
  		
  	} //計算活動數量(篩選運動類別)

  	// --------Act
  	@Override
  	public Object save(ACT act) {
  		Session session = factory.getCurrentSession();
  		return session.save(act);
  	}

  	@Override
  	// 更新actid活動紀錄 //目前先不使用hql下特定欄位更新指令，等spring之後再弄)
  	public void update(ACT bean) {
  		Session session = factory.getCurrentSession();
  		session.saveOrUpdate(bean);
  	}

  	// --------Qes
  	@Override
  	public Object save(ACT_QES qes) {
  		Session session = factory.getCurrentSession();
  		return session.save(qes);
  	}

  	// 經由Session介面的get()查詢資料庫內的紀錄
  	@Override
  	public ACT_QES getQesById(int pk) {
  		Session session = factory.getCurrentSession();
  		return (ACT_QES) session.get(ACT_QES.class, pk);
  	}

//  		 更新紀錄
  	@Override
  	public void update(ACT_QES qes) {
  		Session session = factory.getCurrentSession();
  		session.update(qes);
  		return;
  	}

  	// 刪除紀錄
  	@Override
  	public void deleteQes(int pk) {
  		Session session = factory.getCurrentSession();
  		ACT_QES qes = new ACT_QES();
  		qes.setACT_QES_ID(pk);
  		session.delete(qes);
  		return;
  	}

  	// --------Form
  	@Override
  	public Object save(ACT_RFORM form) {
  		Session session = factory.getCurrentSession();
  		return session.save(form);
  	}

  	@Override
  	public ACT_RFORM getFormById(int pk) {
  		Session session = factory.getCurrentSession();
  		return (ACT_RFORM) session.get(ACT_RFORM.class, pk);
  	}

  	// 更新紀錄
  	@Override
  	public void update(ACT_RFORM form) {
  		Session session = factory.getCurrentSession();
  		session.update(form);
  		return;
  	}

  	// 刪除紀錄
  	@Override
  	public void deleteForm(int pk) {
  		Session session = factory.getCurrentSession();
  		ACT_RFORM qes = new ACT_RFORM();
  		qes.setACT_RFORM_id(pk);
  		session.delete(qes);
  		return;
  	}

}
