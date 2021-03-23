package com.web.GBG_project.ACT.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.transaction.Transactional;

import org.hibernate.Hibernate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jmx.export.annotation.ManagedAttribute;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.ACT.model.ACT_QES;
import com.web.GBG_project.ACT.model.ACT_STATUS;
import com.web.GBG_project.ACT.service.ACTService;
import com.web.GBG_project.ACT.util.ActUtils;
import com.web.GBG_project.ACT.util.ActUtils.Page;
import com.web.GBG_project.DOS.service.DOSService;
import com.web.GBG_project.course.model.MatchTeamBean;
import com.web.GBG_project.course.service.impl.MatchService;
import com.web.GBG_project.member.model.MemberBean;

@Controller
@RequestMapping("/ACT")
@SessionAttributes({ "LoginOK" })
public class ACTController {
	@Autowired
	ACTService actservice;
	@Autowired
	DOSService dosservice;
	@Autowired
	MatchService matchService;
	@Autowired
	ActUtils common;

	public ACTController() {
		super();
	}

//===================================================權限:訪客
	// 選擇運動種類
	@RequestMapping("/chooseSport")
	public String chooseSport(Model model) {
		model.addAttribute("sports", dosservice.select_sport());
		return "ACT/ACTSport";
	}

	@RequestMapping("/ACT_Main")
	public String act_show(Model model, @RequestParam(value = "state", defaultValue = "0") Integer state,
			@RequestParam(value = "order", defaultValue = "original") String order,
			@RequestParam(value = "start", defaultValue = "0") Integer start,
			@RequestParam(value = "sportid") Integer sportid) {
		Integer count = 5;
		Integer total = actservice.getActBySport(sportid, state, order).size();
		List<ACT> act_all = actservice.getActBySport_Slice(start, count, sportid, state, order);
		List<ACT> spotLight_act = actservice.getSpotLightAct(sportid, count);
		List<ACT_STATUS> status = actservice.select_actstatus();
		ACT_STATUS states = actservice.getACT_STATUS(state);

		model.addAttribute("state", (states != null) ? states : null);
		model.addAttribute("order", order);
		model.addAttribute("sportid", sportid);
		model.addAttribute("status", status.subList(0, 5));
		model.addAttribute("spotLight", spotLight_act);
		model.addAttribute("Act", act_all);

		ActUtils.Page page = common.new Page(start, total, count);
		model.addAttribute("next", page.getNext()); // 下一頁
		model.addAttribute("pre", page.getPre()); // 上一頁
		model.addAttribute("last", page.getLast()); // 最後一頁
		model.addAttribute("allpage", page.getPageArr()); // 全部頁數

		return "ACT/ACT_Main3";
	}

	// 關鍵字搜尋
	@GetMapping("/ACT_search")
	public String act_keywordShow(Model model, @RequestParam(value = "keyword") String keyword,
			@RequestParam(value = "state", defaultValue = "0") Integer state,
			@RequestParam(value = "order", defaultValue = "original") String order,
			@RequestParam(value = "start", defaultValue = "0") Integer start,
			@RequestParam(value = "sportid") Integer sportid) {
		Integer count = 5;
		Integer total = actservice.getActBySport(sportid, state, order, keyword).size();
		List<ACT> act_all = actservice.getActBySport_Slice(start, count, sportid, state, order, keyword);
		List<ACT_STATUS> status = actservice.select_actstatus();
		System.out.println(total);
		model.addAttribute("state", actservice.getACT_STATUS(state));
		model.addAttribute("order", order);
		model.addAttribute("sportid", sportid);
		model.addAttribute("status", status.subList(0, 5));
		model.addAttribute("Act", act_all);

		ActUtils.Page page = common.new Page(start, total, count);
		model.addAttribute("next", page.getNext()); // 下一頁
		model.addAttribute("pre", page.getPre()); // 上一頁
		model.addAttribute("last", page.getLast()); // 最後一頁
		model.addAttribute("allpage", page.getPageArr()); // 全部頁數

		return "ACT/ACT_Main3";
	}

	// 觀看活動詳細資料
	@RequestMapping("/ACT_Main/{actid}")
	public String showDetail(Model model, @PathVariable(value = "actid") Integer actid) {
		model.addAttribute("ActBean", actservice.getACT(actid));
		model.addAttribute("MemberBean", actservice.getACTHolder(actid));
		model.addAttribute("NEWS", actservice.getActNews(actid));
		return "ACT/ACT_Detail";
	}

	@Transactional
	@GetMapping("/ACT_follow/{actid}")
	public String ACT_Follow_state(Model model, 
			@PathVariable(value = "actid") Integer actid,
			@SessionAttribute("LoginOK") MemberBean member) {
		ACT act = actservice.getACT(actid);
		Set<MemberBean> followers = act.getFollowers();
		Hibernate.initialize(followers);
//		if (!followers.contains(member)) {
//			followers.add(member);
//		}
		if ((!followers.contains(member)) 
				? followers.add(member) 
				: followers.remove(member)) {
			actservice.update_ACT_follow(act);
		}
//		正在改這裡!
		return "redirect:/ACT/ACT_Main/" + act.getACT_ID();
	}

//===================================================權限:會員

	@GetMapping("/manageAct")
	public String MemManageAct(@ModelAttribute("LoginOK") MemberBean member, Model model) {
		if (member != null) {
			int permId = member.getMember_perm_id().getMember_perm_id();
			if (permId == 1) {
				return "redirect:/ACT/ListActByMemR";
			} else if (permId == 2) {
				return "redirect:/ACT/ListActByMem";
			}
		}
		return "index";
	}

//===================================================權限:單位會員
	// 依會員id查詢活動
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
	public String editActNew(Model model, @RequestParam(value = "actid") Integer actid) {
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
	public String doEditActNew(Model model, @ModelAttribute("actBean") ACT actBean,
			@ModelAttribute("news") String news) {
		actservice.updateNews(news, actBean);
		return "redirect:/ACT/ACT_Main/" + actBean.getACT_ID();
	}

//===================================================權限:一般會員    
//報名
	// 新增報名
	@GetMapping("/ACT_reg")
	public String toRegForm(Model model, @RequestParam(value = "Actid") Integer actid) {
		model.addAttribute("ActBean", actservice.getACT(actid));
		MatchTeamBean team = new MatchTeamBean();
		model.addAttribute("MatchTeamBean", team);
		return "ACT/ACTRegForm";
	}

	// 處理報名(先只存報名者)
	@PostMapping("/ACT_reg")
	public String doRegForm(RedirectAttributes attr, @ModelAttribute("MatchTeamBean") MatchTeamBean team,
			@SessionAttribute("LoginOK") MemberBean member) {
		// 處理隊伍成員
		Set<MemberBean> set = new HashSet<>();
		set.add(member);
		matchService.insertTeam(team, set);

		return "redirect:/ACT/ACT_Main/" + team.getAct_id().getACT_ID();
	}

	// 依會員id查詢有報名ㄉ活動
	@Transactional
	@RequestMapping("/ListActByMemR")
	public String listActByMemberR(Model model, @SessionAttribute("LoginOK") MemberBean member) {
		Set<MatchTeamBean> set = member.getTeams();
// 		Hibernate.initialize(set);
		model.addAttribute("AllTeam", set);
		return "management_page/ACT/member/MEM_ACTReg_Page";
	}

	// 修改報名
	@GetMapping("/ACT_regEdit")
	public String toRegEditForm(Model model, @RequestParam(value = "teamid") Integer teamid) {
		MatchTeamBean team = matchService.getTeam(teamid);
		ACT act = team.getAct_id();
		model.addAttribute("ActBean", act);
		model.addAttribute("MatchTeamBean", team);
		return "ACT/ACTRegForm";
	}

	// 處理修改報名(未做更新隊員功能)
	@PostMapping("/ACT_regEdit")
	public String doRegEditForm(Model model, @ModelAttribute("MatchTeamBean") MatchTeamBean team) {
		matchService.update(team);
		return "redirect:/ACT/ACT_Main/" + team.getAct_id().getACT_ID();
	}

//問答
	// 列出所有問答(依活動)
	@RequestMapping("/ACT_Qes")
	public String showQes(Model model, @RequestParam(value = "Actid") Integer actid) {
		model.addAttribute("Qes", actservice.getActQes(actid));
		model.addAttribute("Actid", actid);
		return "ACT/ACT_Qes";
	}

	// 新增問答
	@GetMapping("/ACT_QesForm")
	public String toQesForm(Model model, @RequestParam(value = "Actid") Integer actid,
			@SessionAttribute("LoginOK") MemberBean member) {
		ACT_QES qes = new ACT_QES();
		qes.setAct(actservice.getACT(actid));
		qes.setMEMBER_ID(member.getMember_id());
		model.addAttribute("QesBean", qes);
		return "ACT/ACTQesForm";
	}

	// 處理新增問答
	@PostMapping("/ACT_QesForm")
	public String doQesForm(Model model, @ModelAttribute("QesBean") ACT_QES qesBean,
			@ModelAttribute("comment") String comment) {
		int n = actservice.insertQes(qesBean, comment);
		if (n != 0) {

			return "redirect:/ACT/ACT_Qes?Actid=" + qesBean.getAct().getACT_ID();
		} else {
			return "ACT/ACTQesForm";
		}
	}

	// 列出所有問答(依會員)
	@Transactional
	@RequestMapping("/listQesByMem")
	public String listQesByMember(Model model, @SessionAttribute("LoginOK") MemberBean member) {
		Map<ACT, Map<ACT_QES, String>> map = actservice.getQesByMem(member.getMember_id());
		model.addAttribute("AllQes", map);
		return "management_page/ACT/member/MEM_ACTQes_Page";
	}

	// 修改問答
	@GetMapping("/ACT_QesEditForm")
	public String toQesEditForm(Model model, @RequestParam(value = "qesid") Integer qesid) {
		ACT_QES qes = actservice.getQesById(qesid);
		model.addAttribute("QesBean", qes);
		model.addAttribute("comment", actservice.ClobToString(qes.getACT_QES_COM()));
		return "ACT/ACTQesForm";
	}

	// 處理修改問答
	@PostMapping("/ACT_QesEditForm")
	public String doQesEditForm(Model model, @ModelAttribute("QesBean") ACT_QES qesBean,
			@ModelAttribute("comment") String comment) {
		int n = actservice.updateQes(qesBean, comment);
		if (n != 0) {

			return "redirect:/ACT/ACT_Qes?Actid=" + qesBean.getAct().getACT_ID();
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
