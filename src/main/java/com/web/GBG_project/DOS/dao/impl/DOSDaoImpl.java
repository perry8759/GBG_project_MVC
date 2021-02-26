package com.web.GBG_project.DOS.dao.impl;

import java.util.Iterator;
import java.util.List;
import java.util.Set;
import java.util.Vector;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.web.GBG_project.DOS.dao.DOSDao;
import com.web.GBG_project.DOS.model.DOS;
import com.web.GBG_project.DOS.model.DOS_PICTURE;
import com.web.GBG_project.DOS.model.DOS_SPORT;

@Repository
public class DOSDaoImpl implements DOSDao{
	SessionFactory factory;
	@Autowired
	public void setFactory(SessionFactory factory) {
		this.factory = factory;
	}
	public DOSDaoImpl() {
		
	}
	//查詢所有場地
	@SuppressWarnings("unchecked")
	@Override
	public List<DOS> select() {
		Session session=factory.getCurrentSession();
		String hql = "FROM DOS ";
		List<DOS> dos=session.createQuery(hql).list();
		return dos;
	}
	//查詢所有運動種類
		@SuppressWarnings("unchecked")
		@Override
		public List<DOS_SPORT> select_sport() {
			Session session=factory.getCurrentSession();
			String hql = "FROM DOS_SPORT ";
			List<DOS_SPORT> dos_sport =session.createQuery(hql).list();
			return dos_sport;
		}
	
	
	//依據編號查詢場地
	@Override
	public DOS selectid(int  dOSID) {
		Session session=factory.getCurrentSession();
		String hql = "FROM DOS d WHERE d.DOS_ID = :dosid ";
		DOS dos=(DOS) session.createQuery(hql).setParameter("dosid", dOSID).getSingleResult();	
		return dos;
	}
	//依據編號查詢運動種類
	@Override
	public DOS_SPORT select_sportid(int  dOS_sport_id) {
		Session session=factory.getCurrentSession();
		String hql = "FROM DOS_SPORT d WHERE d.DOS_SPORT_ID = :dos_sportid ";
		DOS_SPORT dos_sport=(DOS_SPORT) session.createQuery(hql).setParameter("dos_sportid", dOS_sport_id).getSingleResult();	
		return dos_sport;
	}
	//查詢此場地的相片集
	@SuppressWarnings("null")
	@Override
	public List<DOS_PICTURE> selecallpic(int  dOSID) {
		DOS dept = selectid(dOSID);
		List<DOS_PICTURE> result=new Vector<DOS_PICTURE>();
		if (dept != null) {
	       for (DOS_PICTURE dosp : dept.getDos_picture()) {
				System.out.println("發現1個圖片"+dosp.getDOS_PICTURE_ID());
				result.add(dosp);				
			   }
		    } else {
		        System.out.println("查無資料");
		    }
	     System.out.print(result.size());
		 return result;
	}
	//更新場地
	@Override
	public void updateid(DOS bean) {
		Session session=factory.getCurrentSession();
		bean.setDos_sport_id(select_sportid(bean.getDos_sport_id().getDOS_SPORT_ID()));//更新時，需要重新設定外鍵
        session.saveOrUpdate(bean);
	}
	//新增場地
	@Override
	public void insertid(DOS dos) {
		Session session = factory.getCurrentSession();
		dos.setDos_sport_id(select_sportid(dos.getDos_sport_id().getDOS_SPORT_ID()));//新增時，需要重新設定外鍵
        session.save(dos);		
	}
	//刪除場地
	@Override
	public void deleteid(Integer id) {
		Session session = factory.getCurrentSession();	
		DOS dos = selectid(id);
		dos.setDos_sport_id(null);//解除關係
		session.delete(dos); 
	}
	//更新運動種類
	@Override
	public void updateSportId(DOS_SPORT bean) {
		Session session=factory.getCurrentSession();
		DOS_SPORT dos_Sport = select_sportid(bean.getDOS_SPORT_ID());
		session.evict(dos_Sport);
        session.saveOrUpdate(bean);
	}
	//新增場地
	@Override
	public void insertSportId(DOS_SPORT dos_sport) {
		Session session = factory.getCurrentSession();
        session.save(dos_sport);
	}
	//刪除場地
	@Override
	public void deleteSportId(Integer id) {
		Session session = factory.getCurrentSession();		
		DOS_SPORT dos_sport = select_sportid(id);		
		Set<DOS> alldos=dos_sport.getDos();//解除關係
		Iterator iter = alldos.iterator();
		while (iter.hasNext()) {
		      DOS x = (DOS) iter.next();
		      x.setDos_sport_id(null);
		}
		dos_sport.setDos(null);
		session.delete(dos_sport);		
	}
	

}
