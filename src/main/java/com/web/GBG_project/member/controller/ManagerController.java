package com.web.GBG_project.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.GBG_project.member.model.ManageStatusBean;
import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.member.service.MemberService;

@Controller
@RequestMapping("/member")
@SessionAttributes({"LoginOK"})
public class ManagerController {
	
	@Autowired
	MemberService service;
	
	@GetMapping("memberManager")
	public String memberManager(
				Model model
			) {
		List<MemberBean> memberList = service.getAllMember();
		List<ManageStatusBean> manageStatus = service.getManageStatus();
		MemberBean memberBean = new MemberBean();
		model.addAttribute("manageStatusList", manageStatus);
		model.addAttribute("memberList", memberList);
		model.addAttribute("memberBean", memberBean);
		return "member/memberManage";
	}
	
}
