package com.web.GBG_project.DOS.service;

import java.util.List;

import com.web.GBG_project.DOS.model.DOS;
import com.web.GBG_project.DOS.model.DOS_PICTURE;
import com.web.GBG_project.DOS.model.DOS_SPORT;

public interface DOSService {
        //運動種類資訊
		DOS_SPORT select_sportid(int  dOS_sport_id);//找出該編號的運動種類
		void updateSportId(DOS_SPORT dos_sport);//更新該運動種類
		void insertSportId(DOS_SPORT dos_sport);//新增一筆運動種類
		void deleteSportId(Integer id);//刪除點選之編號的運動種類
		List<DOS_SPORT> select_sport();//列出所有的運動種類
		
		//場地圖像集動作
		List<DOS_PICTURE> selecallpic(int  dOSID);//找出該單一場地的所有照片
		void insertpic(DOS_PICTURE dosp);
		//場地資訊動作
		List<DOS> select();//列出所有場地資訊
		DOS selectid(int  dOSID);//查詢單一場地
		void updateid(DOS dos);//更新單一場地
		void insertid(DOS dos);//新增單一場地
		void deleteid(Integer id);//刪除單一場地
		int allDOS_Count();
		List<DOS> getDOS_Max(int start, int count);
		
		List<DOS> selectpic();//無作用，之後刪除
		//Clob getStringclob(String s) throws SerialException, SQLException, IOException;//string to clob
}
