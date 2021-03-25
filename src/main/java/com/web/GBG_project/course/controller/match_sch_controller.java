package com.web.GBG_project.course.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.web.GBG_project.ACT.service.ACTService;
import com.web.GBG_project.course.model.MatchBean;
import com.web.GBG_project.course.model.MatchPairBean;
import com.web.GBG_project.course.service.MatchService;
import com.web.GBG_project.member.model.MemberBean;

@Controller
public class match_sch_controller {
	@Autowired
	MatchService matchService;
	@Autowired
	ACTService actservice;
	public match_sch_controller() {
		// TODO Auto-generated constructor stub
	}
	@GetMapping("/ACT/MATCH_ACT_sch")
	public String ACT_ALLTEAM(Model model,@RequestParam("Actid")Integer Actid) {
		model.addAttribute("ActBean", actservice.getACT(Actid));
		List<MatchBean> allmatch=matchService.getAllMatch();
		ArrayList<List<MatchPairBean>>match_all_round =new ArrayList<List<MatchPairBean>>();
		for(int i=1;i<=allmatch.size();i++) {
		List<MatchPairBean>aaa=matchService.getall_pair_by_matchmain(i, Actid);
		match_all_round.add(aaa);
		}
		model.addAttribute("match_all_round", match_all_round);
		model.addAttribute("round", match_all_round.size());
		return "management_page/ACT/member/MEM_ACT_SCH";
	}
}
