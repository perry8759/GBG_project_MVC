package com.web.GBG_project.DOS.service.impl;
//直接查看dosservice說明即可
import java.util.List;
import javax.persistence.NoResultException;
import javax.transaction.Transactional;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.GBG_project.DOS.dao.DOSDao;
import com.web.GBG_project.DOS.model.DOS;
import com.web.GBG_project.DOS.model.DOS_PICTURE;
import com.web.GBG_project.DOS.model.DOS_SPORT;
import com.web.GBG_project.DOS.service.DOSService;


@Service
public class DOSServiceImpl implements DOSService{
    DOSDao dosdao;
    SessionFactory factory;
    @Autowired
    public void setDao(DOSDao dosdao) {
		this.dosdao = dosdao;
	}
	public DOSServiceImpl() {
		
	}

	@Transactional
	@Override
	public List<DOS> select() {
		return dosdao.select();
	}
	
	@Transactional
	@Override
	public DOS selectid(int dOSID) {
		return dosdao.selectid(dOSID);
	}
	
	@Transactional
	@Override
	public List<DOS_PICTURE> selecallpic(int dOSID) {
		 return dosdao.selecallpic(dOSID);
	}

	//無作用，之後刪除
	@SuppressWarnings("unchecked")
	public List<DOS> selectpic() {
		List<DOS> result;
		//byte[] sImage = null;
		Session session=factory.getCurrentSession();
		Transaction tx=null;
		String hql = "FROM DOS ";
		try {	
	        tx=session.beginTransaction();	        
		    result=(List<DOS>)session.createQuery(hql).list();		    
            tx.commit();
		}catch(NoResultException ex) {
			result=null;
			if(tx!=null) {
				tx.rollback();
			}
			ex.printStackTrace();
			throw new RuntimeException(ex);
		}
		System.out.println(result);
		 return result;
	}
	
	@Transactional
	@Override
	public void updateid(DOS dos) {
		dosdao.updateid(dos);
	}
	
	@Transactional
	@Override
	public void insertid(DOS dos) {
		dosdao.insertid(dos);
	}
	
	@Transactional
	@Override
	public void deleteid(Integer id) {
		dosdao.deleteid(id);		
	}
	
	@Transactional
	@Override
	public List<DOS_SPORT> select_sport() {
		return dosdao.select_sport();
	}
	
	@Transactional
	@Override
	public DOS_SPORT select_sportid(int dOS_sport_id) {
		return dosdao.select_sportid(dOS_sport_id);
	}
	
	@Transactional
	@Override
	public void updateSportId(DOS_SPORT dos_sport) {
		dosdao.updateSportId(dos_sport);
	}
	
	@Transactional
	@Override
	public void insertSportId(DOS_SPORT dos_sport) {
		dosdao.insertSportId(dos_sport);	
	}
	
	@Transactional
	@Override
	public void deleteSportId(Integer id) {
		dosdao.deleteSportId(id);
	}
	@Transactional
	@Override
	public void insertpic(DOS_PICTURE dosp) {
		dosdao.insertpic(dosp);
		
	}
	@Transactional
	@Override
	public int allDOS_Count() {
		return dosdao.allDOS_Count();
	}
	@Transactional
	@Override
	public List<DOS> getDOS_Max(int start, int count) {
		return dosdao.getDOS_Max(start, count);
	}
	@Transactional
	@Override
	public List<DOS> getDOSBySportid(int start, int count, int sportid) {
		return dosdao.getDOSBySportid(start, count, sportid);
	}
	@Transactional
	@Override
	public int allDOSByid(Integer id) {
		// TODO Auto-generated method stub
		return dosdao.allDOSByid(id);
	}
	@Transactional
	@Override
	public List<DOS> get_search_addr(String txt,String txt1) {
		// TODO Auto-generated method stub
		return dosdao.get_search_addr(txt,txt1);
	}
	
	
	
//	@Override
//	public Clob getStringclob(String s) throws SerialException, SQLException, IOException {
//		Clob myClob = new javax.sql.rowset.serial.SerialClob(s.toCharArray());
//		return myClob;
//	}
}
