package com.web.GBG_project.ACT.controller.normal;

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
import com.web.GBG_project.member.service.MemberService;

@Controller
@RequestMapping("/ACT")
@SessionAttributes({ "LoginOK" })
public class ShowAct {
	@Autowired
	ACTService actservice;
	@Autowired
	DOSService dosservice;
	@Autowired
	ActUtils common;

	public ShowAct() {
		super();
	}

//瀏覽活動 權限:訪客
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
	public String showDetail(Model model, 
			@PathVariable(value = "actid") Integer actid) {
		model.addAttribute("ActBean", actservice.getACT(actid));
		model.addAttribute("MemberBean", actservice.getACTHolder(actid));
		model.addAttribute("NEWS", actservice.getActNews(actid));
		return "ACT/ACT_Detail";
	}
}
