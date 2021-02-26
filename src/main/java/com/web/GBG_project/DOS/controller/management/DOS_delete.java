package com.web.GBG_project.DOS.controller.management;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.GBG_project.DOS.service.DOSService;

//管理(刪除場地)
@Controller
public class DOS_delete {
	
	DOSService dosservice;
	@Autowired 
	public void setService(DOSService dosservice) {
		this.dosservice = dosservice;
	}
    public DOS_delete() {
        super();
        // TODO Auto-generated constructor stub
    }

    @RequestMapping("/DOS/DOS_delete")
	public String deleteDOSById(@RequestParam("dosid") Integer dosid, Model model){
    	dosservice.deleteid(dosid);
    	return "redirect:/DOS/DOS_list";
    }
}
