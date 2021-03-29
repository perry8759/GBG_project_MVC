package com.web.GBG_project.ACT.controller;

import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collectors;

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

import com.web.GBG_project.ACT.controller.vo.RegVo;
import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.ACT.service.ACTService;
import com.web.GBG_project.DOS.service.DOSService;
import com.web.GBG_project.course.model.MatchTeamBean;
import com.web.GBG_project.course.service.MatchService;
import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.member.service.MemberService;

@Controller
@RequestMapping("/ACT")
@SessionAttributes({ "LoginOK" })
public class RegisterAct {
	@Autowired
	ACTService actservice;
	@Autowired
	DOSService dosservice;
	@Autowired
	MatchService matchService;
	@Autowired
	MemberService memberService;

	public RegisterAct() {
		super();
	}
//報名 權限:一般會員

	// 依會員id查詢有報名ㄉ活動
	@Transactional
	@RequestMapping("/ListActByMemR")
	public String listActByMemberR(Model model, @SessionAttribute("LoginOK") MemberBean member) {
		member=memberService.getMember(member.getMember_id());
		List<MatchTeamBean> set = member.getTeams();
		model.addAttribute("AllTeam", set);
		return "management_page/ACT/member/MEM_ACTReg_Page";
	}

	// 新增報名
	@GetMapping("/ACT_reg")
	public String toRegForm(Model model, @RequestParam(value = "Actid") Integer actid) {
		RegVo binder= new RegVo();
		ACT act=actservice.getACT(actid);
		List<String> members = new LinkedList<>();
		for (int i = 0; i < act.getACT_MAX_PNUM(); i++) {
			members.add(new String());
		}
		binder.setMembers_account(members);
		binder.setAct_id(actid);
		model.addAttribute("RegVo",binder);
		model.addAttribute("ActBean", act);
		model.addAttribute("action", "insert");
		return "ACT/ACTRegForm";
	}

	// 處理報名
	@PostMapping("/ACT_reg")
	public String doRegForm(Model model,
			@ModelAttribute("RegVo") RegVo binder,
			@SessionAttribute("LoginOK") MemberBean self) {
		
		// 處理隊伍成員
		List<String> list=binder.getMembers_account()
				.stream()
				.filter( m 	-> m!=null
							&& !m.isBlank())
				.collect( Collectors.toList()); //去除為空與空白值
		if(list.stream()
				.collect(Collectors.toSet())
				.size() != list.size() ? true : false) {
			model.addAttribute("AccountError","重複輸入");
			System.out.println("重複輸入");
			return "ACT/ACTRegForm";
		}
		binder.setMembers_account(list.add(self.getMember_account())?list:list);
		if(matchService.insertTeam(binder)) {
			return "redirect:/ACT/ACT_Main/" + binder.getAct_id();
		}else {
			model.addAttribute("AccountError","此帳號不存在");
			System.out.println("此帳號不存在");
			return "ACT/ACTRegForm";
		}
	}
	
	// 修改報名
	@Transactional
	@GetMapping("/ACT_regEdit")
	public String toRegEditForm(Model model, 
			@SessionAttribute("LoginOK") MemberBean member,
			@RequestParam(value = "teamid") Integer teamid) {
		RegVo binder= new RegVo();
		MatchTeamBean team=matchService.getTeam(teamid);
		binder.setMatch_team_id(teamid);
		List<String> members = team.getMembers().stream()
				.map(m->m.getMember_account())
				.filter( m -> !m.equals(member.getMember_account())) //不印出自己的帳號
				.collect( Collectors.toList());
		
		for (int i = members.size(); i < team.getAct_id().getACT_MAX_PNUM(); i++) {
			members.add(new String());
		}
		binder.setMembers_account(members);
		binder.setAct_id(team.getAct_id().getACT_ID());
		binder.setTeam_name(team.getTeam_name());
		binder.setTeam_unit(team.getTeam_unit());
		//		team.setMembers(members); 
		//		不可以在這邊set，這樣會直接把該team的報名資訊中的LoginOK會員清掉
		model.addAttribute("RegVo",binder);
		model.addAttribute("ActBean", team.getAct_id());
		model.addAttribute("action", "update");
		return "ACT/ACTRegForm";
	}

	// 處理修改報名
	@PostMapping("/ACT_regEdit")
	public String doRegEditForm(Model model, 
			@ModelAttribute("RegVo") RegVo binder,
			@SessionAttribute("LoginOK") MemberBean self) {
		// 處理隊伍成員
		List<String> list=binder.getMembers_account()
				.stream()
				.filter( m 	-> m!=null
							&& !m.isBlank())
				.collect(Collectors.toList()); //去除為空與空白值
		if(list.stream()
				.collect(Collectors.toSet())
				.size() != list.size() ? true : false) {
			model.addAttribute("AccountError","重複輸入");
			return "ACT/ACTRegForm";
		}
		binder.setMembers_account(list.add(self.getMember_account())?list:list);
		if(matchService.update(binder)) {
			return "redirect:/ACT/ACT_Main/" + binder.getAct_id();
		}else {
			model.addAttribute("AccountError","此帳號不存在");
			return "ACT/ACTRegForm";
		}
	}
}
