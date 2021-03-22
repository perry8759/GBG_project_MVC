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
	//每輪新增幾場資訊
	@PostMapping(value="/MATCH_ACT_AllTeam_round_/{index}/{match_status_id}", consumes = MediaType.APPLICATION_JSON_VALUE,
	        produces = MediaType.APPLICATION_JSON_VALUE)
	public @ResponseBody void MATCH_ACT_AllTeam_one_round(@SessionAttribute("LoginOK") MemberBean member,@RequestBody MatchBean matchbean,@PathVariable("index")Integer index,@PathVariable("match_status_id")Integer match_status_id
			){
		matchbean.setMember_id(member.getMember_id());
		matchbean.setMatch_round(index);
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
		model.addAttribute("match_one",match_one);
		Integer n=4;//隊伍數量
		Integer sum=0;//總共幾場比賽
		Integer round=0;//計算此賽程有多少round
		List<Integer> round_main=new ArrayList();
		List<Integer> round_pair=new ArrayList();
		List<List<MatchPairBean>>match_pair_round =new ArrayList<List<MatchPairBean>>();
		while(n!=1){			
			round=round+1; //第n round
			model.addAttribute("n1_"+round,n);//第n個round建立4個pair
			round_pair.add(n);
			List<MatchPairBean>match_pair_one_round =matchService.getAllMatchPair_one_round(round);
			match_pair_round.add(match_pair_one_round);
			System.out.println("11111111111111111111:"+match_pair_one_round.size());
            if(n%2 == 0){
                sum += n/2;
                n = n/2;               
                model.addAttribute("n_"+round,n); //第n個round建立2場比賽
                round_main.add(n);
                System.out.println(round);
            }
        }
		model.addAttribute("round_main",round_main);//總結:每輪多少場
		model.addAttribute("round_pair",round_pair);//總結:每輪多少pair
		model.addAttribute("round",round);//總共round
		model.addAttribute("match_pair_round",match_pair_round);//總共round

		
		
		
		
		
		
		
		
		
        //model.addAttribute("n",n);
		int n1=4;//總共4隊，則建立4張match_pair
		model.addAttribute("n1",n1);
		List<MatchBean> match_all_one=matchService.getAllMatch();
		model.addAttribute("match_all_one",match_all_one);
		
		List<MatchTeamBean>match_all_team=matchService.getAllMatch_team();
		model.addAttribute("match_all_team",match_all_team);
		
//		List<MatchPairBean>match_pair_one_round =matchService.getAllMatchPair_one_round();
//		model.addAttribute("match_pair_one_round",match_pair_one_round);
//		System.out.println(match_pair_one_round.size());
		
        List<MatchStatusBean> aaa1=matchService.getAllMatch_status();
        model.addAttribute("allstatus",aaa1);
        
//        for(int i=0;i<n;i++) {        	
//        	List<MatchPairBean> ss=new ArrayList();
//        	Integer s=match_one.get(i).getMatch_id();
//        	for(int y=0;y<match_pair_one_round.size();y++) {
//            	if(match_pair_one_round.get(y).getMatch_id().getMatch_id()==s) {
//            		ss.add(match_pair_one_round.get(y));
//            	}
//            }
//        	model.addAttribute("match_pair_by_seq_one_round"+i, ss);
//        }
        
        
		return "management_page/ACT/member/MEM_ACT_MATCH";
	}
}
