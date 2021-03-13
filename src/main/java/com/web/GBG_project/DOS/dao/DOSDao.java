//dao(盡可能只寫sql資料)
//hibernate需有交易,web-inf需有lib,bind必備,jstl1.2以上需引號
package com.web.GBG_project.DOS.dao;

import java.util.List;

import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.DOS.model.DOS;
import com.web.GBG_project.DOS.model.DOS_PICTURE;
import com.web.GBG_project.DOS.model.DOS_SPORT;


//請查看DOSService說明
public interface DOSDao {
	List<DOS> select();
	List<DOS_SPORT> select_sport();
	DOS selectid(int  dOSID);

	List<DOS_PICTURE> selecallpic(int  dOSID);
	void updateid(DOS dos);
	void insertid(DOS dos);
	void deleteid(Integer id);
	void insertpic(DOS_PICTURE dosp);
	DOS_SPORT select_sportid(int  dOS_sport_id);
	void updateSportId(DOS_SPORT dos_sport);
	void insertSportId(DOS_SPORT dos_sport);
	void deleteSportId(Integer id);
	int allDOS_Count() ;
	List<DOS> getDOS_Max(int start, int count) ;
	List<DOS> getDOSBySportid(int start, int count,int sportid);
	int allDOSByid(Integer id);
	List<DOS> get_search_addr(String txt,String txt1);
}
