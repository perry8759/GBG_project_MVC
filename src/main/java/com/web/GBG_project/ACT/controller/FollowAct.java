package com.web.GBG_project.ACT.controller;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.GBG_project.ACT.service.ACTService;
import com.web.GBG_project.member.model.MemberBean;

@Controller
@RequestMapping("/ACT")
@SessionAttributes({ "LoginOK" })
public class FollowAct {
	@Autowired
	ACTService actservice;

	public FollowAct() {
		super();
	}

//關注&取消關注活動 權限:會員
	
	@Transactional
	@GetMapping("/ACT_follow/{actid}")
	public String ACT_Follow_state(Model model, 
			@PathVariable(value = "actid") Integer actid,
			@SessionAttribute("LoginOK") MemberBean member) {
		actservice.updateFollowAct(member.getMember_id(),actid);
//		return "redirect:/ACT/ACT_Main/" + act.getACT_ID();
		return "redirect:/ACT/ACT_Main?sportid="+ actservice.getACT(actid).getDos_sport().getDOS_SPORT_ID();
	}
}
