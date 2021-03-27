//dao(盡可能只寫sql語法)
package com.web.GBG_project.ACT.dao.impl;

import java.util.List;
import java.util.Set;

import javax.transaction.Transactional;

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
import com.web.GBG_project.DOS.model.DOS;
import com.web.GBG_project.DOS.model.DOS_SPORT;
import com.web.GBG_project.member.model.MemberBean;

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
    @Override
    public void update_ACT_follow(ACT act_bean) {
    	Session session=factory.getCurrentSession();	
    	session.merge(act_bean);
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
		String hql="FROM ACT where act_status_id != 6 and act_status_id !=7 ORDER BY ACT_ID";
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
		ACT_STATUS act_status=getACT_STATUS(8);//封鎖編號
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
//        ACT_RULE act_rule=getACT_RULE(bean.getAct_rule().getACT_RULE_ID());
//        DOS_SPORT dosp=dosdao.select_sportid(bean.getDos_sport().getDOS_SPORT_ID());
//        DOS dos=dosdao.selectid(bean.getDos_id().getDOS_ID());
//        session.evict(act_rule);
//        session.evict(dosp);
//        session.evict(dos);
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
		String hql = "FROM ACT a where a.act_status=8";
		List<ACT> act_lock_status =session.createQuery(hql).list();
		return act_lock_status;
	}
    @SuppressWarnings("unchecked")
	@Override
	public List<ACT> getall_act_nopass_status() {
		Session session=factory.getCurrentSession();
		String hql = "FROM ACT a where a.act_status=9";		
		List<ACT> act_lock_status =session.createQuery(hql).list();
		return act_lock_status;
	}
    @SuppressWarnings("unchecked")
	@Override
	public List<ACT> getall_act_pass_status() {
		Session session=factory.getCurrentSession();
		String hql = "FROM ACT a where a.act_status=1 or a.act_status=2 or a.act_status=3 or a.act_status=4 or a.act_status=5 or a.act_status=6";		
		List<ACT> act_lock_status =session.createQuery(hql).list();
		return act_lock_status;
	}
    
//    @SuppressWarnings("unchecked")
//	@Override
//	public List<ACT> getall_act_one_status(Integer sportid) {
//		Session session=factory.getCurrentSession();
//		String hql = "FROM ACT a where a.act_status=1 and dos_sport_id = :sportid";		
//		List<ACT> act_lock_status =session.createQuery(hql).setParameter("sportid", sportid).getResultList();
//		return act_lock_status;
//	}
//    @Override
//  	@SuppressWarnings("unchecked")
//  	public List<ACT> getall_act_one_status_max(int start, int count,Integer sportid) {
//  		Session session = factory.getCurrentSession();
//  		String hql = "FROM ACT a where a.act_status=1 and dos_sport_id = :sportid";
//  		List<ACT> list = session.createQuery(hql)
//  								.setParameter("sportid", sportid)
//  								.setFirstResult(start).setMaxResults(count)
//  								.getResultList();
//  		return list;
//  	}
//    @SuppressWarnings("unchecked")
//	@Override
//	public List<ACT> getall_act_two_status(Integer sportid) {
//    	Session session=factory.getCurrentSession();
//		String hql = "FROM ACT a where a.act_status=2 and dos_sport_id = :sportid";		
//		List<ACT> act_lock_status =session.createQuery(hql).setParameter("sportid", sportid).getResultList();
//		return act_lock_status;
//	}
//    @Override
//  	@SuppressWarnings("unchecked")
//  	public List<ACT> getall_act_two_status_max(int start, int count,Integer sportid) {
//  		Session session = factory.getCurrentSession();
//  		String hql = "FROM ACT a where a.act_status=2 and dos_sport_id = :sportid";
//  		List<ACT> list = session.createQuery(hql)
//  								.setParameter("sportid", sportid)
//  								.setFirstResult(start).setMaxResults(count)
//  								.getResultList();
//  		return list;
//  	}
//    @SuppressWarnings("unchecked")
//	@Override
//	public List<ACT> getall_act_three_status(Integer sportid) {
//    	Session session=factory.getCurrentSession();
//		String hql = "FROM ACT a where a.act_status=3 and dos_sport_id = :sportid";		
//		List<ACT> act_lock_status =session.createQuery(hql).setParameter("sportid", sportid).getResultList();
//		return act_lock_status;
//	}
//    @Override
//  	@SuppressWarnings("unchecked")
//  	public List<ACT> getall_act_three_status_max(int start, int count,Integer sportid) {
//  		Session session = factory.getCurrentSession();
//  		String hql = "FROM ACT a where a.act_status=3 and dos_sport_id = :sportid";
//  		List<ACT> list = session.createQuery(hql)
//  								.setParameter("sportid", sportid)
//  								.setFirstResult(start).setMaxResults(count)
//  								.getResultList();
//  		return list;
//  	}

//    @Override
//  	@SuppressWarnings("unchecked")
//    public List<ACT> getall_act_follow_up(int start, int count,Integer sportid){
//    	Session session = factory.getCurrentSession();
//    	String sql1 = "select a FROM MemberBean m left join m.followActs a WHERE dos_sport_id=:sportid GROUP BY a.ACT_ID ORDER BY COUNT(m.member_id) asc";
//  		List<ACT> list = session.createQuery(sql1).setParameter("sportid", sportid).setFirstResult(start).setMaxResults(count).getResultList();
//  		return list;
//    }
//    
    
//    @Override
//  	@SuppressWarnings("unchecked")
//    public List<ACT> getall_act_follow_one_up(int start, int count,Integer sportid){
//    	Session session = factory.getCurrentSession();
//    	String sql1 = "select a FROM MemberBean m left join m.followActs a WHERE a.act_status=1 AND dos_sport_id=:sportid GROUP BY a.ACT_ID ORDER BY COUNT(m.member_id) asc";
//  		List<ACT> list = session.createQuery(sql1).setParameter("sportid", sportid).list();
//  		return list;
//    }
//    
//    @Override
//  	@SuppressWarnings("unchecked")
//    public List<ACT> getall_act_follow_two_up(int start, int count,Integer sportid){
//    	Session session = factory.getCurrentSession();
//    	String sql1 = "select a FROM MemberBean m left join m.followActs a WHERE a.act_status=2 AND dos_sport_id=:sportid GROUP BY a.ACT_ID ORDER BY COUNT(m.member_id) asc";
//  		List<ACT> list = session.createQuery(sql1).setParameter("sportid", sportid).list();
//  		return list;
//    }
//    
//    
//    @Override
//  	@SuppressWarnings("unchecked")
//    public List<ACT> getall_act_follow_three_up(int start, int count,Integer sportid){
//    	Session session = factory.getCurrentSession();
//    	String sql1 = "select a FROM MemberBean m left join m.followActs a WHERE a.act_status=3 AND dos_sport_id=:sportid GROUP BY a.ACT_ID ORDER BY COUNT(m.member_id) asc";
//  		List<ACT> list = session.createQuery(sql1).setParameter("sportid", sportid).list();
//  		return list;
//    }
    
//=======================================================================
	
  	private String getHQL(Integer sportid,Integer status,String order) {
  		String hql = null;
  		if(status!=null&&order!=null) {
  			hql 	= "SELECT a FROM ACT a "
					+ " left join a.followers f "
					+ " WHERE act_status_id= :status AND dos_sport_id=:sportid "
					+ " GROUP BY a.ACT_ID "
					+ " ORDER BY COUNT(f.member_id) "+ order;
  		}else if(status!=null){
  			hql = "FROM ACT a where act_status_id = :status and dos_sport_id = :sportid";
  		}else if(order!=null){
  			hql 	= "SELECT a FROM ACT a "
					+ " left join a.followers f "
					+ " WHERE act_status_id != 4 and act_status_id !=5 AND dos_sport_id=:sportid "
					+ " GROUP BY a.ACT_ID "
					+ " ORDER BY COUNT(f.member_id) "+ order;
  		}else {
  			hql = "FROM ACT where act_status_id != 4 and act_status_id !=5 and dos_sport_id = :sportid";
  		}
		return hql;
	}
  	
  	@Override
  	@SuppressWarnings("unchecked")
  	public List<ACT> getActBySport(Integer sportid,Integer status,String order) {
  		Session session = factory.getCurrentSession();
  		List<ACT> list =null;
  		
  		if(status!=0&&!order.equals("original")) {
  			list =session
  					.createQuery(getHQL(sportid,status,order))
  					.setParameter("sportid", sportid)
  					.setParameter("status", status)
  					.getResultList();
  		}else if(status!=0){
  			list =session
  					.createQuery(getHQL(sportid,status,null))
  					.setParameter("status", status)
  					.setParameter("sportid", sportid)
  					.getResultList();
  		}else if(!order.equals("original")){
  			list =session
  					.createQuery(getHQL(sportid,null,order))
  					.setParameter("sportid", sportid)
  					.getResultList();
  		}else {
  			list = session.createQuery(getHQL(sportid,null,null))
  					.setParameter("sportid", sportid)
					.getResultList();
  		}
  		return list;
  	}
  	@Override
  	@SuppressWarnings("unchecked")
  	public List<ACT> getActBySport_Slice(int start, int count,Integer sportid,Integer status,String order){
  		Session session=factory.getCurrentSession();
  		List<ACT> list =null;
  		
  		if(status!=0&&!order.equals("original")) {
  			list =session
  					.createQuery(getHQL(sportid,status,order))
  					.setParameter("status", status)
  					.setParameter("sportid", sportid)
  					.setFirstResult(start).setMaxResults(count)
  					.getResultList();
  		}else if(status!=0){
  			list = session.createQuery(getHQL(sportid,status,null))
  					.setParameter("status", status)
  					.setParameter("sportid", sportid)
  					.setFirstResult(start).setMaxResults(count)
  					.getResultList();
  		}else if(!order.equals("original")){
  			list =session
  					.createQuery(getHQL(sportid,null,order))
  					.setParameter("sportid", sportid)
  					.setFirstResult(start).setMaxResults(count)
  					.getResultList();
  		}else {
  			list = session.createQuery(getHQL(sportid,null,null))
  	   					  .setParameter("sportid", sportid)
  	   					  .setFirstResult(start).setMaxResults(count)
  	   					  .getResultList();
  		}
  		return list;
  	}
  	
  	@SuppressWarnings("unchecked")
	@Override
  	public List<ACT> getSpotLightAct(Integer sportid,Integer count) {
  		Session session = factory.getCurrentSession();
  		String hql = "FROM ACT where dos_sport_id=:sportid ORDER BY ACT_ID";
  		return session.createQuery(hql)
					.setParameter("sportid", sportid)
					.setMaxResults(count)
					.getResultList();
  	}
  	
  	@SuppressWarnings("unchecked")
	@Override
	public List<ACT> getActByMem(Integer memid) {
  		Session session = factory.getCurrentSession();
  		String hql = "FROM ACT where MEMBER_ID = :memid";
  		return session.createQuery(hql)
					.setParameter("memid", memid)
					.getResultList();
	}

  	
  	// --------Act
  	@Override
  	public Object save(ACT act) {
  		Session session = factory.getCurrentSession();
  		return session.save(act);
  	}

	@Override
  	// 更新actid活動紀錄
  	public void update(ACT bean) {
  		Session session = factory.getCurrentSession();
  		session.merge(bean);
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
  	@SuppressWarnings("unchecked")
	@Override
  	public List<ACT_QES> getQesByMemId(int memid) {
  		Session session = factory.getCurrentSession();
  		String hql = "FROM ACT_QES where MEMBER_ID = :memid";
  		return session.createQuery(hql)
					.setParameter("memid", memid)
					.getResultList();
  	}
  	

//  更新紀錄
  	@Override
  	public void update(ACT_QES qes) {
  		Session session = factory.getCurrentSession();
  		session.merge(qes);
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
  		session.merge(form);
  		return;
  	}

  	// 刪除紀錄
  	@Override
  	public void deleteForm(int pk) {
  		Session session = factory.getCurrentSession();
  		ACT_RFORM form = new ACT_RFORM();
  		form.setACT_RFORM_id(pk);
  		session.delete(form);
  		return;
  	}

}
