package com.web.GBG_project.course.controller;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.ACT.service.ACTService;
import com.web.GBG_project.DOS.model.DOS;
import com.web.GBG_project.course.model.MatchBean;
import com.web.GBG_project.course.model.MatchPairBean;
import com.web.GBG_project.course.model.MatchStatusBean;
import com.web.GBG_project.course.model.MatchTeamBean;
import com.web.GBG_project.course.service.impl.MatchService;
import com.web.GBG_project.member.model.MemberBean;
@Controller
public class matchcontroller {
	@Autowired
	MatchService matchService;
	@Autowired
	ACTService actservice;
	public matchcontroller() {
		
	}
	@GetMapping("/MATCH_ACT_AllTeam")
	public String ACT_ALLTEAM(Model model,
			@SessionAttribute("LoginOK") MemberBean member) {
		model.addAttribute("allmatch", matchService.getAllMatch_team());
        ACT act=actservice.getACT(1);
        model.addAttribute("act",act);
        
		return "management_page/ACT/member/MEM_ACT_MATCH";
	}
	@PostMapping(value="/MATCH_ACT_AllTeam_one_round/{match_status_id}", consumes = MediaType.APPLICATION_JSON_VALUE,
	        produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody void MATCH_ACT_AllTeam_one_round(@SessionAttribute("LoginOK") MemberBean member,@RequestBody MatchBean matchbean,@PathVariable("match_status_id")Integer match_status_id){
		matchbean.setMember_id(member.getMember_id());
		matchbean.setMatch_round(1);
		matchbean.setAct_id(actservice.getACT(1));
		matchbean.setMatch_status_id(matchService.getStatus(match_status_id));
    	matchService.main_save(matchbean);				
	}
	
	@PostMapping(value="/MATCH_ACT_AllTeam_one_round_pair/{match_id}/{match_team_id}", consumes = MediaType.APPLICATION_JSON_VALUE,
	        produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody void MATCH_ACT_AllTeam_one_round_pair(@SessionAttribute("LoginOK") MemberBean member,@RequestBody MatchPairBean matchpairbean,@PathVariable("match_id")Integer match_id
			,@PathVariable("match_team_id")Integer match_team_id){
		matchpairbean.setMatch_id(matchService.getMatchbean(match_id));
		matchpairbean.setMatch_team_id(matchService.getTeam(match_team_id));
    	matchService.save_matchpair(matchpairbean);				
	}
	
	@ModelAttribute
	public String ACT_ALLTEAM11(Model model,MatchBean matchbean) {
		List<MatchBean> match_one=matchService.getAllMatch_one_round();
		
		int n=4/2;//總共4隊 第一round為2場比賽
		model.addAttribute("match_one",match_one);
        model.addAttribute("n",n);
		int n1=4;//總共4隊，則建立4張match_pair
		model.addAttribute("n1",n1);
		List<MatchBean> match_all_one=matchService.getAllMatch();
		model.addAttribute("match_all_one",match_all_one);
		
		List<MatchTeamBean>match_all_team=matchService.getAllMatch_team();
		model.addAttribute("match_all_team",match_all_team);
		
        List<MatchStatusBean> aaa1=matchService.getAllMatch_status();
        model.addAttribute("allstatus",aaa1);
		return "management_page/ACT/member/MEM_ACT_MATCH";
	}
}
