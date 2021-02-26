package com.web.GBG_project.DOS.controller.management;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.GBG_project.DOS.model.DOS;
import com.web.GBG_project.DOS.service.DOSService;

//管理(列出所有場地之畫面)

@Controller
public class DOS_list {
	DOSService dosservice;
	@Autowired 
	public void setService(DOSService dosservice) {
		this.dosservice = dosservice;
	}
    public DOS_list() {
        super();
        // TODO Auto-generated constructor stub
    }
    @RequestMapping("/DOS/DOS_list")
	public String listdos(Model model){
    	List<DOS>  dos111 = dosservice.select() ;
	    model.addAttribute("AllDOS", dos111);
    	return "management_page/DOS/MGT_DOS_Page";
    }
}
