package com.web.GBG_project.DOS.controller.management;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.GBG_project.DOS.model.DOS_SPORT;
import com.web.GBG_project.DOS.service.DOSService;

//管理(列出所有運動種類之畫面)
@Controller
public class DOS_sport_list {

	DOSService dosservice;
	@Autowired 
	public void setService(DOSService dosservice) {
		this.dosservice = dosservice;
	}     
    public DOS_sport_list() {
        super();
        // TODO Auto-generated constructor stub
    }
    @RequestMapping("/DOS/DOS_sport_list")
	public String listdos(Model model){
    	List<DOS_SPORT>  dos111 = dosservice.select_sport() ;
	    model.addAttribute("AllDOS_sport", dos111);
    	return "management_page/DOS/MGT_DOS_sport_Page";
    }
}
