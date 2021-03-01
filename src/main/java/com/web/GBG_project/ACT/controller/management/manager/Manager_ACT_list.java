package com.web.GBG_project.ACT.controller.management.manager;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.ACT.service.ACTService;

//管理者的活動列表
@Controller
public class Manager_ACT_list  {
	ACTService actservice;
	@Autowired 
	public void setService(ACTService actservice) {
		this.actservice = actservice;
	}
    public Manager_ACT_list() {
        super();
        // TODO Auto-generated constructor stub
    }
    @RequestMapping("/ACT/Manager_ACT_list")
	public String listdos(Model model){
    	List<ACT>  act = actservice.allACT() ;
	    model.addAttribute("AllACT", act);
    	return "management_page/ACT/manager/MGT_ACT_Page";
    }
}
