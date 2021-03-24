package com.web.GBG_project.ACT.controller.normal;

import java.util.List;

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
import com.web.GBG_project.ACT.service.ACTService;
import com.web.GBG_project.DOS.service.DOSService;
import com.web.GBG_project.course.service.impl.MatchService;
import com.web.GBG_project.member.model.MemberBean;

@Controller
@RequestMapping("/ACT")
@SessionAttributes({ "LoginOK" })
public class HostAct {
	@Autowired
	ACTService actservice;
	@Autowired
	DOSService dosservice;
	@Autowired
	MatchService matchService;

	public HostAct() {
		super();
	}
//主辦 權限:單位會員
	// 依會員id查詢主辦的活動
	@RequestMapping("/ListActByMem")
	public String listActByMember(Model model, @SessionAttribute("LoginOK") MemberBean member) {
		List<ACT> act = actservice.getActByMem(member.getMember_id());
		model.addAttribute("AllACT", act);
		return "management_page/ACT/member/MEM_ACT_Page";
	}

	// 修改主辦
	@GetMapping("/ActEdit")
	public String toActEditForm(Model model, @RequestParam(value = "actid") Integer actid) {
		ACT act = actservice.getACT(actid);
		model.addAttribute("actBean", act);
		model.addAttribute("dos_sport", dosservice.select_sport());
		model.addAttribute("act_rule", actservice.select_actrule());
		return "ACT/ACT_Main_Form";
	}

	// 處理修改主辦 (未處理form)
	@PostMapping("/ActEdit")
	public String doActEditForm(Model model, @ModelAttribute("actBean") ACT actBean) {
		actservice.update(actBean);
		return "redirect:/ACT/ACT_Main/" + actBean.getACT_ID();
	}

	// 顯示已報名該活動隊伍
	@GetMapping("/CheckRegTeamState")
	public String showRegTeam(Model model, @RequestParam(value = "actid") Integer actid) {
		model.addAttribute("actBean", actservice.getACT(actid));
		model.addAttribute("RegStatus", matchService.getAllStatus());
		return "management_page/ACT/member/MEM_RegTeam_Page";
	}

	// 更改報名隊伍狀態
	@PostMapping("/CheckRegTeamState")
	public String checkRegTeamState(Model model, @ModelAttribute("actBean") ACT actBean) {
		matchService.updateTeamRegState(actBean);
		return "redirect:/ACT/CheckRegTeamState?actid=" + actBean.getACT_ID();
	}

	// 修改活動公告
	@GetMapping("/EditActNew")
	public String editActNew(Model model, 
			@RequestParam(value = "actid") Integer actid) {
		ACT act = new ACT();
		act.setACT_ID(actid);
		model.addAttribute("actBean", act);
		if (act.getACT_NEWS() != null) {
			model.addAttribute("news", actservice.ClobToString(act.getACT_NEWS()));
		} else {
			model.addAttribute("news", "暫無公告");
		}
		return "ACT/ACTNewsForm";
	}

	// 處理修改公告
	@PostMapping("/EditActNew")
	public String doEditActNew(Model model, 
			@ModelAttribute("actBean") ACT actBean,
			@ModelAttribute("news") String news) {
		actservice.updateNews(news, actBean);
		return "redirect:/ACT/ACT_Main/" + actBean.getACT_ID();
	}
}
