package com.web.GBG_project.ACT.controller;

import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.Vector;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.ACT.model.ACT_QES;
import com.web.GBG_project.ACT.model.ACT_RULE;
import com.web.GBG_project.ACT.service.ACTService;
import com.web.GBG_project.DOS.model.DOS_SPORT;
import com.web.GBG_project.DOS.service.DOSService;
import com.web.GBG_project.course.model.MatchTeamBean;
import com.web.GBG_project.course.service.impl.MatchService;
import com.web.GBG_project.member.model.MemberBean;

@Controller
@RequestMapping("/ACT")
public class ACTController {
	@Autowired
	ACTService actservice;
	@Autowired
	DOSService dosservice;
	@Autowired
	MatchService matchService;

	public ACTController() {
		super();
	}

//前台
	// 選擇運動種類
	@RequestMapping("/chooseSport")
	public String chooseSport(Model model) {
		model.addAttribute("sports", dosservice.select_sport());
		return "ACT/ACTSport";
	}

	// 依運動種類查詢活動主頁
	@RequestMapping("/ACT_Main")
	public String listActBySport(Model model, @RequestParam(value = "start", defaultValue = "0") Integer Start,
			@RequestParam(value = "sportid") Integer sportid) {
		Integer start = 0;
		Integer count = 5;
		Integer total = 0;
		Vector<Integer> pageArr = new Vector<Integer>();
		total = actservice.getACTCountBySportid(sportid);
		Integer ri=1;
		if(total % count == 0) {
	    	for(ri=1;ri<=total / count;ri++) {
	    		pageArr.add(ri);
	    	}
	    //總共21筆資料 每頁5個，則最後一頁開始就是第20筆
	    }else {
	    	for(ri=1;ri<=total / count;ri++) {
	    		pageArr.add(ri);
	    	}
	    	pageArr.add(ri);
	    }
		try {
			start = Start;// 取得jsp上的start參數
		} catch (NumberFormatException e) {
			System.out.println("沒有起始值");
		}
		// 0+5=5，下一頁就從第5筆開始
		int next = start + count;
		// 5-5=0，上一頁就從第0筆開始
		int pre = start - count;

		int last;
		// 總共10筆資料 每頁5個 ，則最後一頁開始就是第5筆
		if (total % count == 0) {
			last = total - count;
			// 總共21筆資料 每頁5個，則最後一頁開始就是第20筆
		} else {
			last = total - total % count;
		}
		// 邊界
		pre = pre < 0 ? 0 : pre;
		next = next > last ? last : next;
		List<ACT> act_all = actservice.getACTBySportid(start, count, sportid);
		model.addAttribute("next", next); // 下一頁
		model.addAttribute("pre", pre); // 上一頁
		model.addAttribute("last", last); // 最後一頁
		model.addAttribute("Act", act_all);
		model.addAttribute("allpage",pageArr);	//全部頁數
		model.addAttribute("sportid", sportid);
		List<ACT> aaa=actservice.getall_act_follow_up(start, count, sportid);
		model.addAttribute("Act_up_main", aaa);
		return "ACT/ACT_Main2";
	}

	// 觀看活動詳細資料
	@RequestMapping("/ACT_Main/{actid}")
	public String showDetail(Model model, 
			@PathVariable(value = "actid") Integer actid) {
		model.addAttribute("ActBean", actservice.getACT(actid));
		model.addAttribute("MemberBean", actservice.getACTHolder(actid));
		return "ACT/ACT_Detail";
	}

//後台
	// 依會員id查詢活動
	// (未做，目前是列出全部的活動)
	@RequestMapping("/ListActByMem")
	public String listActByMember(Model model,
			@SessionAttribute("LoginOK") MemberBean member) {
		List<ACT> act = actservice.allACT();
		model.addAttribute("AllACT", act);
		return "management_page/ACT/member/MEM_ACT_Page";
	}
	
	// 依會員id查詢有報名ㄉ活動
	@RequestMapping("/ListActByMemR")
	public String listActByMemberR(Model model,
			@SessionAttribute("LoginOK") MemberBean member) {
		Set<MatchTeamBean> set=member.getTeams();
		model.addAttribute("AllTeam", set);
		return "management_page/ACT/member/MEM_ACTReg_Page";
	}
//	===================================================權限:單位會員
//主辦(修改)  PS.新增功能是寫在ACT_Main_new那裏
	
    @GetMapping("/ActEdit")
	public String toActEditForm(Model model,
			@RequestParam(value="actid") Integer actid) {
		model.addAttribute("actBean", actservice.getACT(actid));
		List<DOS_SPORT> dos_sport=dosservice.select_sport();
		List<ACT_RULE> act_rule=actservice.select_actrule();
		model.addAttribute("dos_sport", dos_sport);
		model.addAttribute("act_rule", act_rule);
		return "ACT/ACT_Main_Form";
	}

    @PostMapping("/ActEdit")
	public String doActEditForm( Model model,
			@ModelAttribute("actBean") ACT actBean
			){ 
    	actservice.update(actBean);
    	//未處理 LOGO & form
		return "redirect:/ACT/ACT_Main/" + actBean.getACT_ID();
	}
//===================================================權限:一般會員
//報名(新增修改)

	// 準備報名表單所需物件MatchTeamBean
	@GetMapping("/ACT_reg") // 新增
	public String toRegForm(Model model, @RequestParam(value = "Actid") Integer actid) {
		model.addAttribute("ActBean", actservice.getACT(actid));
		MatchTeamBean team = new MatchTeamBean();
		model.addAttribute("MatchTeamBean", team);
		return "ACT/ACTRegForm";
	}

	// 處理報名表單
	@PostMapping("/ACT_reg")
	public String doRegForm(RedirectAttributes attr, @ModelAttribute("MatchTeamBean") MatchTeamBean team,
			@SessionAttribute("LoginOK") MemberBean member) {
		// 處理隊伍成員
		Set<MemberBean> set = new HashSet<>();// (先只存報名者)
		set.add(member);
		matchService.insertTeam(team, set);

		return "redirect:/ACT/ACT_Main/" + team.getAct_id().getACT_ID();
	}

	@GetMapping("/ACT_regEdit") // 修改
	public String toRegEditForm(Model model,
			@RequestParam(value = "teamid") Integer teamid) {
		MatchTeamBean team = matchService.getTeam(teamid);
		ACT act=team.getAct_id();
		model.addAttribute("ActBean", act);
		model.addAttribute("MatchTeamBean", team);
		return "ACT/ACTRegForm";
	}

	@PostMapping("/ACT_regEdit")
	public String doRegEditForm(Model model,
			@ModelAttribute("MatchTeamBean") MatchTeamBean team) {
		// 處理隊伍成員
		Set<MemberBean> set = team.getMembers();//成員更新功能未做
		matchService.update(team, set);

		return "redirect:/ACT/ACT_Main/" + team.getAct_id().getACT_ID();
	}

//問題
	// 顯示該活動的所有問題
	@RequestMapping("/ACT_Qes")
	public String showQes(Model model, @RequestParam(value = "Actid") Integer actid) {
		model.addAttribute("Qes", actservice.getActQes(actid));
		model.addAttribute("Actid", actid);
		return "ACT/ACT_Qes";
	}

	// 新增QES
	@GetMapping("/ACT_QesForm")
	public String toQesForm(Model model, @RequestParam(value = "Actid") Integer actid) {
		model.addAttribute("ActBean", actservice.getACT(actid));
		model.addAttribute("QesBean", new ACT_QES());
		return "ACT/ACTQesForm";
	}

	// 處理新增問題表單
	@PostMapping("/ACT_QesForm")
	public String doQesForm(Model model, @ModelAttribute("QesBean") ACT_QES qesBean,
			@ModelAttribute("comment") String comment, @ModelAttribute("Actid") Integer actid,
			@SessionAttribute("LoginOK") MemberBean member) {
		qesBean.setMEMBER_ID(member.getMember_id());

		int n = actservice.insertQes(actid, qesBean, comment);
		if (n != 0) {

			return "redirect:/ACT/ACT_Qes?Actid=" + actid;
		} else {
			return "ACT/ACTQesForm";
		}
	}

	// 修改QES
	@GetMapping("/ACT_QesEditForm")
	public String toQesEditForm(Model model, @RequestParam(value = "Actid") Integer actid) {
		model.addAttribute("ActBean", actservice.getACT(actid));
		model.addAttribute("QesBean", new ACT_QES());
		return "ACT/ACTQesForm";
	}

	// 處理修改問題表單
	@PostMapping("/ACT_QesEditForm")
	public String doQesEditForm(Model model, @ModelAttribute("QesBean") ACT_QES qesBean,
			@ModelAttribute("comment") String comment, @ModelAttribute("Actid") Integer actid,
			@SessionAttribute("LoginOK") MemberBean member) {
		qesBean.setMEMBER_ID(member.getMember_id());

		int n = actservice.updateQes(qesBean, comment);
		if (n != 0) {

			return "redirect:/ACT/ACT_Qes?Actid=" + actid;
		} else {
			return "ACT/ACTQesForm";
		}
	}
}
