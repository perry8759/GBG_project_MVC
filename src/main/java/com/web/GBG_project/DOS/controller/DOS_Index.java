//導向場地主頁(使用者畫面)SportDOS.jsp
package com.web.GBG_project.DOS.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.web.GBG_project.DOS.model.DOS;
import com.web.GBG_project.DOS.service.DOSService;


@Controller
public class DOS_Index  {
	DOSService dosservice;

	@Autowired 
	public void setService(DOSService dosservice) {
		this.dosservice = dosservice;
	}
    public DOS_Index() {
        super();
        // TODO Auto-generated constructor stub
    }

    @RequestMapping("/DOS/DOS_Index")
	public String list(Model model) {
    	List<DOS>  list = dosservice.select();
		model.addAttribute("DOS", list);
		return "DOS/SportDOS";
	}
}
