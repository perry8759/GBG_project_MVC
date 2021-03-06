package com.web.GBG_project.ACT.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.ACT.model.ACT_QES;
import com.web.GBG_project.ACT.service.ACTService;
import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.util.CommonUtils;
import com.web.GBG_project.util.CommonUtils.Page;

@Controller
@RequestMapping("/ACT")
@SessionAttributes({ "LoginOK" })
public class QesAct {
	@Autowired
	ACTService actservice;
	@Autowired
	CommonUtils common;
	
	public QesAct() {
		super();
	}
//問答 權限:會員
	
	// 列出所有問答(依活動) / 新增問答
	@GetMapping("/ACT_Qes")
	public String showQes(Model model,
			@RequestParam("Actid") Integer actid,
			@RequestParam(value = "start", defaultValue = "0") Integer start,
			@SessionAttribute("LoginOK") MemberBean member) {
		ACT act=actservice.getACT(actid);
		
		List<String> time=new ArrayList<String>();
		time.add(common.TimestampToString(act.getACT_SIGN_O()).substring(0, 10));
		time.add(common.TimestampToString(act.getACT_SIGN_C()).substring(0, 10));
		time.add(common.TimestampToString(act.getACT_RUN_O()).substring(0, 10));
		time.add(common.TimestampToString(act.getACT_RUN_C()).substring(0, 10));
		model.addAttribute("time", time);
		
		Integer count = 5;
		Integer total = act.getAct_qes().size();
		Page page=common.getPage(start, total, count);
		model.addAttribute("next", page.getPageNum().get("next")); // 下一頁
		model.addAttribute("pre", page.getPageNum().get("pre")); // 上一頁
		model.addAttribute("last", page.getPageNum().get("last")); // 最後一頁
		model.addAttribute("allpage", page.getPageArr()); // 全部頁數
		
		model.addAttribute("Qes", actservice.getActQes(actid));
		model.addAttribute("ActBean", act );
//		========新增留言
		ACT_QES qes = new ACT_QES();
		qes.setAct(act);
		qes.setMEMBER_ID(member.getMember_id());
		model.addAttribute("QesBean", qes);
		
		return "ACT/ACT_Qes";
	}

	// 列出所有問答(依會員)
	@Transactional
	@RequestMapping("/listQesByMem")
	public String listQesByMember(Model model, @SessionAttribute("LoginOK") MemberBean member) {
		Map<ACT, Map<ACT_QES, String>> map = actservice.getQesByMem(member.getMember_id());
		model.addAttribute("AllQes", map);
		return "management_page/ACT/member/MEM_ACTQes_Page";
	}
	

	// 處理新增問答
	@PostMapping("/ACT_Qes")
	public String doQesForm(Model model, @ModelAttribute("QesBean") ACT_QES qesBean,
			@ModelAttribute("comment") String comment) {
		if (actservice.insertQes(qesBean, comment)== 0) {
			model.addAttribute("error","輸入失敗");
			System.out.println("輸入失敗");
			return "ACT/ACT_Qes";
		} 
		return "redirect:/ACT/ACT_Qes?Actid=" + qesBean.getAct().getACT_ID();
	}

	// 修改問答
	@GetMapping("/ACT_QesEditForm")
	public String toQesEditForm(Model model, 
			@RequestParam(value = "qesid") Integer qesid) {
		ACT_QES qes = actservice.getQesById(qesid);
		model.addAttribute("QesBean", qes);
		model.addAttribute("comment", common.ClobToString(qes.getACT_QES_COM()));
		return "ACT/ACTQesForm";
	}
	
	// 處理修改問答
	@PostMapping("/ACT_QesEditForm")
	public String doQesEditForm(Model model, @ModelAttribute("QesBean") ACT_QES qesBean,
			@ModelAttribute("comment") String comment) {
		int n = actservice.updateQes(qesBean, comment);
		if (n != 0) {
			return "redirect:/ACT/listQesByMem";
		} else {
			return "ACT/ACTQesForm";
		}
	}

	// 刪除問答
	@GetMapping("/ACT_QesDelete")
	public String QesDelete(Model model, @RequestParam(value = "qesid") Integer qesid) {
		actservice.deleteQes(qesid);
		return "redirect:/ACT/listQesByMem";
	}
}
