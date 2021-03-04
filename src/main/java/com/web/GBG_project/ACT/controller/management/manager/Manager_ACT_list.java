package com.web.GBG_project.ACT.controller.management.manager;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
    
    // ajax 所有活動
 	@GetMapping(value="/ACT_LIST",produces = { "application/json;charset=UTF-8" })
 	public @ResponseBody List<ACT> showAll_ACT() {
 		List<ACT> act = actservice.allACT();
 		return act;
 	}
 	// ajax 分類-活動為封鎖
 	@GetMapping(value="/ACT_LOCK_LIST",produces = { "application/json;charset=UTF-8" })
 	public @ResponseBody List<ACT> showAll_LOCK_ACT() {
 		List<ACT> act = actservice.getall_act_lock_status();
 		return act;
 	}
    // ajax 分類-活動為未審核
  	@GetMapping(value="/ACT_NOPASS_LIST",produces = { "application/json;charset=UTF-8" })
  	public @ResponseBody List<ACT> showAll_NOPASS_ACT() {
  		List<ACT> act = actservice.getall_act_nopass_status();
  		return act;
  	}
 // ajax 分類-活動為審核通過
   	@GetMapping(value="/ACT_PASS_LIST",produces = { "application/json;charset=UTF-8" })
   	public @ResponseBody List<ACT> showAll_PASS_ACT() {
   		List<ACT> act = actservice.getall_act_pass_status();
   		return act;
   	}
}
