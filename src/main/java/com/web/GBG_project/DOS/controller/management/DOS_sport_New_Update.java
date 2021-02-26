package com.web.GBG_project.DOS.controller.management;

import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.GBG_project.DOS.model.DOS_SPORT;
import com.web.GBG_project.DOS.service.DOSService;

//管理(更新運動種類)

@Controller
public class DOS_sport_New_Update {
	
	ServletContext context;
	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}
	DOSService dosservice;
	@Autowired 
	public void setService(DOSService dosservice) {
		this.dosservice = dosservice;
	}
    public DOS_sport_New_Update() {
        super();
        // TODO Auto-generated constructor stub
    }

  //取得運動種類資訊，傳給編輯頁面
    @GetMapping("/DOS/DOS_sport_edit")
    public String editDOS_sport_Form(Model model, @RequestParam("dos_sport_id") Integer id) {
    	DOS_SPORT dossportBean=dosservice.select_sportid(id);
		model.addAttribute("dossportBean", dossportBean);
		return "management_page/DOS/EDIT_DOS_sport_PAGE";
	}
    //接收dossportBean，給service做更新
    @PostMapping("/DOS/DOS_sport_edit")
	public String editDOS_sport_Form2(DOS_SPORT dossportBean) {   	    
			dosservice.updateSportId(dossportBean);	
			return "redirect: ../DOS/DOS_sport_list";
	}
    
    //new新的DOS_sport ，傳給頁面
    @GetMapping("/DOS/DOS_sport_new")
	public String showDOS_sport_Form(Model model) {
    	DOS_SPORT bean = new DOS_SPORT();
		model.addAttribute("dossportBean", bean);
		return "management_page/DOS/EDIT_DOS_sport_PAGE";
	}
    //新增DOS_sport
    @PostMapping("/DOS/DOS_sport_new")
	public String DOS_sport_Add(DOS_SPORT dossportBean){
    	dosservice.insertSportId(dossportBean);
		return "redirect: ../DOS/DOS_sport_list";
	}
    
    //優先運作
    @ModelAttribute
	public DOS_SPORT editDOS_sport_Bean(@RequestParam(value="dos_sport_id", required = false) Integer id) {
		DOS_SPORT dossportbean = new DOS_SPORT();
		if (id != null) {
			dossportbean = dosservice.select_sportid(id);
			
		} else {
			
		}
		return dossportbean;
	}
}
