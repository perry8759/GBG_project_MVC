package com.web.GBG_project.ACT.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.ACT.model.ACT_STATUS;
import com.web.GBG_project.ACT.service.ACTService;
import com.web.GBG_project.DOS.service.DOSService;
import com.web.GBG_project.util.CommonUtils;
import com.web.GBG_project.util.CommonUtils.Page;

@Controller
@RequestMapping("/ACT")
@SessionAttributes({ "LoginOK" })
public class ShowAct {
	@Autowired
	ACTService actservice;
	@Autowired
	DOSService dosservice;

	@Autowired
	CommonUtils common;

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
		
		Page page=common.getPage(start, total, count);
		model.addAttribute("next", page.getPageNum().get("next")); // 下一頁
		model.addAttribute("pre", page.getPageNum().get("pre")); // 上一頁
		model.addAttribute("last", page.getPageNum().get("last")); // 最後一頁
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
		List<ACT> spotLight_act = actservice.getSpotLightAct(sportid, count);
		List<ACT_STATUS> status = actservice.select_actstatus();
		ACT_STATUS states = actservice.getACT_STATUS(state);

		model.addAttribute("state", (states != null) ? states : null);
		model.addAttribute("order", order);
		model.addAttribute("sportid", sportid);
		model.addAttribute("status", status.subList(0, 5));
		model.addAttribute("spotLight", spotLight_act);
		model.addAttribute("Act", act_all);

		Page page=common.getPage(start, total, count);
		model.addAttribute("next", page.getPageNum().get("next")); // 下一頁
		model.addAttribute("pre", page.getPageNum().get("pre")); // 上一頁
		model.addAttribute("last", page.getPageNum().get("last")); // 最後一頁
		model.addAttribute("allpage", page.getPageArr()); // 全部頁數

		return "ACT/ACT_Main3";
	}

	// 觀看活動詳細資料 //修改公告
	@GetMapping("/ACT_Main/{actid}")
	public String showDetail(Model model, 
			@PathVariable(value = "actid") Integer actid) {
		ACT act=actservice.getACT(actid);
		model.addAttribute("ActBean", act);
		List<String> time=new ArrayList<String>();
		time.add(common.TimestampToString(act.getACT_SIGN_O()).substring(0, 10));
		time.add(common.TimestampToString(act.getACT_SIGN_C()).substring(0, 10));
		time.add(common.TimestampToString(act.getACT_RUN_O()).substring(0, 10));
		time.add(common.TimestampToString(act.getACT_RUN_C()).substring(0, 10));
		model.addAttribute("time", time);
		model.addAttribute("MemberBean", actservice.getACTHolder(actid));
//		==========公告
		if (act.getACT_NEWS() != null) {
			model.addAttribute("NEWS", actservice.getActNews(actid));
		} else {
			model.addAttribute("NEWS", "暫無公告");
		}
		return "ACT/ACT_Detail";
	}
	// 處理修改公告
		@PostMapping("/ACT_Main/{actid}")
		public String doEditActNew(Model model, 
				@ModelAttribute("actBean") ACT actBean,
				@ModelAttribute("news") String news) {
			actservice.updateNews(news, actBean);
			return "redirect:/ACT/ACT_Main/" + actBean.getACT_ID();
		}
	
}
