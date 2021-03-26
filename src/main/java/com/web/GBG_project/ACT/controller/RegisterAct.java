package com.web.GBG_project.ACT.controller;

import java.util.LinkedList;
import java.util.List;
import java.util.stream.Collector;
import java.util.stream.Collectors;

import javax.transaction.Transactional;

import org.hibernate.Hibernate;
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
import com.web.GBG_project.course.model.MatchTeamBean;
import com.web.GBG_project.course.service.MatchService;
import com.web.GBG_project.member.model.MemberBean;

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

	public RegisterAct() {
		super();
	}
//報名 權限:一般會員

	// 依會員id查詢有報名ㄉ活動
	@Transactional
	@RequestMapping("/ListActByMemR")
	public String listActByMemberR(Model model, @SessionAttribute("LoginOK") MemberBean member) {
		List<MatchTeamBean> set = member.getTeams();
 		Hibernate.initialize(set);
		model.addAttribute("AllTeam", set);
		return "management_page/ACT/member/MEM_ACTReg_Page";
	}

	// 新增報名
	@GetMapping("/ACT_reg")
	public String toRegForm(Model model, @RequestParam(value = "Actid") Integer actid) {
//		model.addAttribute("ActBean", actservice.getACT(actid));
		MatchTeamBean team = new MatchTeamBean();
		List<MemberBean> set = new LinkedList<>();
		for (int i = 0; i < 10; i++) {
			set.add(new MemberBean());
		}
		team.setMembers(set);
		team.setAct_id(actservice.getACT(actid));
		model.addAttribute("MatchTeamBean", team);
		return "ACT/ACTRegForm";
	}

	// 處理報名
	@PostMapping("/ACT_reg")
	public String doRegForm(Model model, @ModelAttribute("MatchTeamBean") MatchTeamBean team) {
		// 處理隊伍成員
		List<MemberBean> members = new LinkedList<>();
		for (MemberBean member : team.getMembers()) {
			String account = member.getMember_account();
			if (account != null && !account.isBlank()) {
				MemberBean m = matchService.getMemberByAccount(account);
				if (m == null) {
					model.addAttribute("AccountError", "此帳號不存在");
					return "ACT/ACTRegForm";
				} else if (members.contains(m)) {
					model.addAttribute("AccountError", "重複輸入");
					return "ACT/ACTRegForm";
				} else {
					members.add(m);
				}
			}
		}
		team.setMembers(members);
		matchService.insertTeam(team);
		return "redirect:/ACT/ACT_Main/" + team.getAct_id().getACT_ID();
	}

	// 修改報名
	@Transactional
	@GetMapping("/ACT_regEdit")
	public String toRegEditForm(Model model, @SessionAttribute("LoginOK") MemberBean member,
			@RequestParam(value = "teamid") Integer teamid) {
		MatchTeamBean team = matchService.getTeam(teamid);
		List<MemberBean> members = team.getMembers();
		Hibernate.initialize(members);
		members  =	members.stream().filter(m -> !m.getMember_account()
												.equals(member.getMember_account()))
									.collect(Collectors.toList());
		for (int i = members.size(); i < 10; i++) {
			members.add(new MemberBean());
		}
		team.setMembers(members);
		model.addAttribute("MatchTeamBean", team);
		return "ACT/ACTRegForm";
	}

	// 處理修改報名(未做更新隊員功能)
	@PostMapping("/ACT_regEdit")
	public String doRegEditForm(Model model, @ModelAttribute("MatchTeamBean") MatchTeamBean team) {
		// 處理隊伍成員
		List<MemberBean> members = new LinkedList<>();
		for (MemberBean member : team.getMembers()) {
			String account = member.getMember_account();
			if (account != null && !account.isBlank()) {
				MemberBean m = matchService.getMemberByAccount(account);
				if (m == null) {
					model.addAttribute("AccountError", "此帳號不存在");
					return "ACT/ACTRegForm";
				} else if (members.contains(m)) {
					model.addAttribute("AccountError", "重複輸入");
					return "ACT/ACTRegForm";
				} else {
					members.add(m);
				}
			}
		}
		team.setMembers(members);
		matchService.update(team);
		return "redirect:/ACT/ACT_Main/" + team.getAct_id().getACT_ID();
	}
}
