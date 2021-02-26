package com.web.GBG_project.DOS.controller.management;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.GBG_project.DOS.service.DOSService;

//管理(刪除運動種類)
@Controller
public class DOS_sport_delete {

	DOSService dosservice;
	@Autowired 
	public void setService(DOSService dosservice) {
		this.dosservice = dosservice;
	}
    public DOS_sport_delete() {
        super();
        // TODO Auto-generated constructor stub
    }
    @RequestMapping("/DOS/DOS_sport_delete")
	public String deleteDOSById(@RequestParam("dos_sport_id") Integer id, Model model){
    	dosservice.deleteSportId(id);
    	return "redirect:/DOS/DOS_sport_list";
    }
}
