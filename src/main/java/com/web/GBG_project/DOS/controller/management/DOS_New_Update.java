package com.web.GBG_project.DOS.controller.management;

import java.sql.Blob;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.ServletContext;
import javax.sql.rowset.serial.SerialBlob;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.web.GBG_project.DOS.model.DOS;
import com.web.GBG_project.DOS.model.DOS_PICTURE;
import com.web.GBG_project.DOS.model.DOS_SPORT;
import com.web.GBG_project.DOS.service.DOSService;

//管理(更新場地)
@Controller
public class DOS_New_Update {
	
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
    public DOS_New_Update() {
        super();
        // TODO Auto-generated constructor stub
    }
    //取得場地資訊，傳給編輯頁面
    @GetMapping("/DOS/DOS_edit")
    public String editDOSForm(Model model, @RequestParam("dosid") Integer id) {
    	DOS dosBean=dosservice.selectid(id);
    	
        List<DOS_SPORT> dos_sport=dosservice.select_sport();
		model.addAttribute("dosBean", dosBean);
		
		model.addAttribute("dos_sport", dos_sport);
		return "management_page/DOS/EDIT_DOS_PAGE";
	}
    //接收dosBean，給service做更新
    @PostMapping("/DOS/DOS_edit")
	public String editDOSForm2(DOS dosBean) { 
			dosservice.updateid(dosBean);	
			return "redirect: ../DOS/DOS_list";
	}
    
    //new新的DOS ，傳給頁面
    @GetMapping("/DOS/DOS_new")
	public String showDOSForm(Model model) {
    	
		DOS bean = new DOS();
		model.addAttribute("dosBean", bean);
		List<DOS_SPORT> dos_sport=dosservice.select_sport();
		
		model.addAttribute("dos_sport", dos_sport);
		return "management_page/DOS/EDIT_DOS_PAGE";
	}
    //新增DOS
    @PostMapping("/DOS/DOS_new")
	public String DOSAdd(DOS dosBean){    	   	
    	dosservice.insertid(dosBean);
		//map.put("emplists", employeeDao.getAll());
		return "redirect: ../DOS/DOS_list";
	}
    
    
  //new新的DOS ，傳給頁面
    @GetMapping("/DOS/DOSP_new")
	public String showDOSPForm(Model model, @RequestParam("dosid") Integer id) {
    	DOS dosBean=dosservice.selectid(id);
		DOS_PICTURE bean = new DOS_PICTURE();
		model.addAttribute("dospBean", bean);
		model.addAttribute("dosBean", dosBean);
		return "management_page/DOS/EDIT_DOSP_PAGE";
	}
    //新增DOS
    @PostMapping("/DOS/DOSP_new")
	public String DOSPAdd(DOS_PICTURE dosp,DOS dos){
    	dosp.setDos_id(dos);
    	MultipartFile picture = dosp.getUploadImage();
		if (picture != null && !picture.isEmpty() && picture.getSize() != 0) {
			try {
				byte[] b = picture.getBytes();
				
				dosp.setDOS_PICTURE_PIC(b);
			} catch (Exception e) {
				e.printStackTrace();
				throw new RuntimeException("檔案上傳發生異常: " + e.getMessage());
			}
		}
    	dosservice.insertpic(dosp);
		//map.put("emplists", employeeDao.getAll());
		return "redirect: ../DOS/DOS_list";
	}
    
    
    //優先運作
    @ModelAttribute
	public DOS editDOSBean(@RequestParam(value="dosid", required = false) Integer id) {
		DOS dosbean = new DOS();
		if (id != null) {
			dosbean = dosservice.selectid(id);
			
		} else {
			
		}
		return dosbean;
	}
}
