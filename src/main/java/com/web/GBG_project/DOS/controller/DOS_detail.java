//導向場地詳細資料(使用者畫面)DOSDetail.jsp
package com.web.GBG_project.DOS.controller;

import java.util.ArrayList;
import java.util.Base64;
import java.util.Iterator;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.GBG_project.DOS.model.DOS;
import com.web.GBG_project.DOS.model.DOS_PICTURE;
import com.web.GBG_project.DOS.service.DOSService;

@Controller
public class DOS_detail  {
	DOSService dosservice;
	@Autowired 
	public void setService(DOSService dosservice) {
		this.dosservice = dosservice;
	}
	@RequestMapping("/DOS/DOS_detail")
	public String getDOSById(@RequestParam("DOSID") Integer dosid, Model model){
		DOS selectid=dosservice.selectid(dosid);
        List<DOS_PICTURE> selectid1=dosservice.selecallpic(dosid);
        Iterator<DOS_PICTURE> iter =selectid1.iterator();
        List<String> dos_pictures=new ArrayList<String>();
        while(iter.hasNext()) {
      	  DOS_PICTURE dosp=(DOS_PICTURE) iter.next();
      	  dos_pictures.add(Base64.getEncoder().encodeToString(dosp.getDOS_PICTURE_PIC()));
        }
		model.addAttribute("DOSID", selectid);
		model.addAttribute("DOSPICID", dos_pictures);
		return "DOS/DOSDetail";
	}
}
