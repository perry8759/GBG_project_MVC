package com.web.GBG_project.ACT.controller;
////查詢活動主頁(使用者畫面)ACT_Main.jsp
//package com.web.GBG_project.ACT.controller;
//
//import java.util.ArrayList;
//import java.util.LinkedHashSet;
//import java.util.List;
//import java.util.Set;
//import java.util.Vector;
//
//import javax.transaction.Transactional;
//
//import org.hibernate.Hibernate;
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.RequestParam;
//import org.springframework.web.bind.annotation.SessionAttribute;
//
//import com.web.GBG_project.ACT.model.ACT;
//import com.web.GBG_project.ACT.model.ACT_QES;
//import com.web.GBG_project.ACT.service.ACTService;
//import com.web.GBG_project.member.model.MemberBean;
//
//
//
////查詢全部活動資料+分頁
//@Controller
//public class ACT_Main {
//	ACTService actservice;
//	@Autowired 
//	public void setService(ACTService actservice) {
//		this.actservice = actservice;
//	}
//	public ACT_Main() {
//        super();
//        // TODO Auto-generated constructor stub
//    }
//	@Transactional
//	@RequestMapping("/ACT_Main/one")
//	public String showDetail(Model model,@RequestParam(value = "start", defaultValue = "0") Integer Start
//			,@RequestParam(value = "sportid") Integer sportid) {
//		Integer start = 0;
//		Integer count = 5;
//		Integer total = 0;
//		Vector<Integer> pageArr = new Vector<Integer>();
//		total = actservice.getall_act_one_status(sportid).size();
//		Integer ri=1;
//		if(total % count == 0) {
//	    	for(ri=1;ri<=total / count;ri++) {
//	    		pageArr.add(ri);
//	    	}
//	    //總共21筆資料 每頁5個，則最後一頁開始就是第20筆
//	    }else {
//	    	for(ri=1;ri<=total / count;ri++) {
//	    		pageArr.add(ri);
//	    	}
//	    	pageArr.add(ri);
//	    }		
//		try {
//			start = Start;// 取得jsp上的start參數
//		} catch (NumberFormatException e) {
//			System.out.println("沒有起始值");
//		}
//		// 0+5=5，下一頁就從第5筆開始
//		int next = start + count;
//		// 5-5=0，上一頁就從第0筆開始
//		int pre = start - count;
//
//		int last;
//		// 總共10筆資料 每頁5個 ，則最後一頁開始就是第5筆
//		if (total % count == 0) {
//			last = total - count;
//			// 總共21筆資料 每頁5個，則最後一頁開始就是第20筆
//		} else {
//			last = total - total % count;
//		}
//		// 邊界
//		pre = pre < 0 ? 0 : pre;
//		next = next > last ? last : next;
//		List<ACT> act_all = actservice.getall_act_one_status_max(start, count, sportid);
//		model.addAttribute("next", next); // 下一頁
//		model.addAttribute("pre", pre); // 上一頁
//		model.addAttribute("last", last); // 最後一頁
//		model.addAttribute("Act_one", act_all);
//		model.addAttribute("allpage",pageArr);	//全部頁數
//		model.addAttribute("sportid", sportid);
//		
//
//		return "ACT/ACT_Main2";
//	}
//	
//	@RequestMapping("/ACT_Main/two")
//	public String showDetail1(Model model,@RequestParam(value = "start", defaultValue = "0") Integer Start
//			,@RequestParam(value = "sportid") Integer sportid) {
//		Integer start = 0;
//		Integer count = 5;
//		Integer total = 0;
//		Vector<Integer> pageArr = new Vector<Integer>();
//		total = actservice.getall_act_two_status(sportid).size();
//		Integer ri=1;
//		if(total % count == 0) {
//	    	for(ri=1;ri<=total / count;ri++) {
//	    		pageArr.add(ri);
//	    	}
//	    //總共21筆資料 每頁5個，則最後一頁開始就是第20筆
//	    }else {
//	    	for(ri=1;ri<=total / count;ri++) {
//	    		pageArr.add(ri);
//	    	}
//	    	pageArr.add(ri);
//	    }		
//		try {
//			start = Start;// 取得jsp上的start參數
//		} catch (NumberFormatException e) {
//			System.out.println("沒有起始值");
//		}
//		// 0+5=5，下一頁就從第5筆開始
//		int next = start + count;
//		// 5-5=0，上一頁就從第0筆開始
//		int pre = start - count;
//
//		int last;
//		// 總共10筆資料 每頁5個 ，則最後一頁開始就是第5筆
//		if (total % count == 0) {
//			last = total - count;
//			// 總共21筆資料 每頁5個，則最後一頁開始就是第20筆
//		} else {
//			last = total - total % count;
//		}
//		// 邊界
//		pre = pre < 0 ? 0 : pre;
//		next = next > last ? last : next;
//		List<ACT> act_all = actservice.getall_act_two_status_max(start, count, sportid);
//		model.addAttribute("next", next); // 下一頁
//		model.addAttribute("pre", pre); // 上一頁
//		model.addAttribute("last", last); // 最後一頁
//		model.addAttribute("Act_two", act_all);
//		model.addAttribute("allpage",pageArr);	//全部頁數
//		model.addAttribute("sportid", sportid);
//		return "ACT/ACT_Main2";
//	}
//	@RequestMapping("/ACT_Main/three")
//	public String showDetail2(Model model,@RequestParam(value = "start", defaultValue = "0") Integer Start
//			,@RequestParam(value = "sportid") Integer sportid) {
//		Integer start = 0;
//		Integer count = 5;
//		Integer total = 0;
//		Vector<Integer> pageArr = new Vector<Integer>();
//		total = actservice.getall_act_three_status(sportid).size();
//		Integer ri=1;
//		if(total % count == 0) {
//	    	for(ri=1;ri<=total / count;ri++) {
//	    		pageArr.add(ri);
//	    	}
//	    //總共21筆資料 每頁5個，則最後一頁開始就是第20筆
//	    }else {
//	    	for(ri=1;ri<=total / count;ri++) {
//	    		pageArr.add(ri);
//	    	}
//	    	pageArr.add(ri);
//	    }		
//		try {
//			start = Start;// 取得jsp上的start參數
//		} catch (NumberFormatException e) {
//			System.out.println("沒有起始值");
//		}
//		// 0+5=5，下一頁就從第5筆開始
//		int next = start + count;
//		// 5-5=0，上一頁就從第0筆開始
//		int pre = start - count;
//
//		int last;
//		// 總共10筆資料 每頁5個 ，則最後一頁開始就是第5筆
//		if (total % count == 0) {
//			last = total - count;
//			// 總共21筆資料 每頁5個，則最後一頁開始就是第20筆
//		} else {
//			last = total - total % count;
//		}
//		// 邊界
//		pre = pre < 0 ? 0 : pre;
//		next = next > last ? last : next;
//		List<ACT> act_all = actservice.getall_act_three_status_max(start, count, sportid);
//		model.addAttribute("next", next); // 下一頁
//		model.addAttribute("pre", pre); // 上一頁
//		model.addAttribute("last", last); // 最後一頁
//		model.addAttribute("Act_three", act_all);
//		model.addAttribute("allpage",pageArr);	//全部頁數
//		model.addAttribute("sportid", sportid);
//		return "ACT/ACT_Main2";
//	}
//	
//	// 新增QES
//	    @Transactional
//		@GetMapping("/ACT/ACT_follow/one/{actid}")
//		public String ACT_Follow_one(Model model, @PathVariable(value = "actid") Integer actid,
//				@SessionAttribute("LoginOK") MemberBean member) {   	
//			ACT act=actservice.getACT(actid);
//			Set<MemberBean> followers=act.getFollowers();
//			if(!followers.contains(member)) {
//				Hibernate.initialize(followers);		    
//		        followers.add(member);
//		        actservice.update_ACT_follow(act);
//			}            				  				
//			return "redirect:/ACT_Main/one?sportid="+act.getDos_sport().getDOS_SPORT_ID();
//		}
//	    
//	    @Transactional
//		@GetMapping("/ACT/ACT_follow/two/{actid}")
//		public String ACT_Follow_two(Model model, @PathVariable(value = "actid") Integer actid,
//				@SessionAttribute("LoginOK") MemberBean member) {   	
//			ACT act=actservice.getACT(actid);
//			Set<MemberBean> followers=act.getFollowers();
//			if(!followers.contains(member)) {
//				Hibernate.initialize(followers);		    
//		        followers.add(member);
//		        actservice.update_ACT_follow(act);
//			}            				  				
//			return "redirect:/ACT_Main/two?sportid="+act.getDos_sport().getDOS_SPORT_ID();
//		}
//	    
//	    @Transactional
//		@GetMapping("/ACT/ACT_follow/three/{actid}")
//		public String ACT_Follow_three(Model model, @PathVariable(value = "actid") Integer actid,
//				@SessionAttribute("LoginOK") MemberBean member) {   	
//			ACT act=actservice.getACT(actid);
//			Set<MemberBean> followers=act.getFollowers();
//			if(!followers.contains(member)) {
//				Hibernate.initialize(followers);		    
//		        followers.add(member);
//		        actservice.update_ACT_follow(act);
//			}            				  				
//			return "redirect:/ACT_Main/three?sportid="+act.getDos_sport().getDOS_SPORT_ID();
//		}
//	    
//	    @Transactional
//		@GetMapping("/ACT/ACT_follow/up")
//	    public String ACT_Follow_up(Model model,@RequestParam(value = "start", defaultValue = "0") Integer Start
//	    		,@RequestParam(value = "sportid") Integer sportid
//	    		) {   	
//	    	Integer start = 0;
//			Integer count = 5;
//			Integer total = 0;
//			Vector<Integer> pageArr = new Vector<Integer>();
//			total = actservice.getall_act_follow_up(0, 100, sportid).size();//懶得再寫總數 == 
//			Integer ri=1;
//			if(total % count == 0) {
//		    	for(ri=1;ri<=total / count;ri++) {
//		    		pageArr.add(ri);
//		    	}
//		    //總共21筆資料 每頁5個，則最後一頁開始就是第20筆
//		    }else {
//		    	for(ri=1;ri<=total / count;ri++) {
//		    		pageArr.add(ri);
//		    	}
//		    	pageArr.add(ri);
//		    }		
//			try {
//				start = Start;// 取得jsp上的start參數
//			} catch (NumberFormatException e) {
//				System.out.println("沒有起始值");
//			}
//			// 0+5=5，下一頁就從第5筆開始
//			int next = start + count;
//			// 5-5=0，上一頁就從第0筆開始
//			int pre = start - count;
//
//			int last;
//			// 總共10筆資料 每頁5個 ，則最後一頁開始就是第5筆
//			if (total % count == 0) {
//				last = total - count;
//				// 總共21筆資料 每頁5個，則最後一頁開始就是第20筆
//			} else {
//				last = total - total % count;
//			}
//			// 邊界
//			pre = pre < 0 ? 0 : pre;
//			next = next > last ? last : next;	    	
//	    	List<ACT> aaa=actservice.getall_act_follow_up(start, count, sportid);			
//			model.addAttribute("next", next); // 下一頁
//			model.addAttribute("pre", pre); // 上一頁
//			model.addAttribute("last", last); // 最後一頁
//			model.addAttribute("Act_up", aaa);
//			model.addAttribute("allpage",pageArr);	//全部頁數
//			model.addAttribute("sportid", sportid);
//			return "ACT/ACT_Main2";
//		}
//	    
//	    @Transactional
//		@GetMapping("/ACT/ACT_follow_one/up")
//	    public String ACT_Follow_one_up(Model model, @RequestParam(value = "sportid") Integer sportid,
//	    		@RequestParam(value = "start", defaultValue = "0") Integer Start) {   	
//	    	Integer start = 0;
//			Integer count = 5;
//			Integer total = 0;
//			Vector<Integer> pageArr = new Vector<Integer>();
//			total = actservice.getall_act_follow_one_up(0, 100, sportid).size();//懶得再寫總數 == 
//			Integer ri=1;
//			if(total % count == 0) {
//		    	for(ri=1;ri<=total / count;ri++) {
//		    		pageArr.add(ri);
//		    	}
//		    //總共21筆資料 每頁5個，則最後一頁開始就是第20筆
//		    }else {
//		    	for(ri=1;ri<=total / count;ri++) {
//		    		pageArr.add(ri);
//		    	}
//		    	pageArr.add(ri);
//		    }		
//			try {
//				start = Start;// 取得jsp上的start參數
//			} catch (NumberFormatException e) {
//				System.out.println("沒有起始值");
//			}
//			// 0+5=5，下一頁就從第5筆開始
//			int next = start + count;
//			// 5-5=0，上一頁就從第0筆開始
//			int pre = start - count;
//
//			int last;
//			// 總共10筆資料 每頁5個 ，則最後一頁開始就是第5筆
//			if (total % count == 0) {
//				last = total - count;
//				// 總共21筆資料 每頁5個，則最後一頁開始就是第20筆
//			} else {
//				last = total - total % count;
//			}
//			// 邊界
//			pre = pre < 0 ? 0 : pre;
//			next = next > last ? last : next;	    	
//	    	List<ACT> aaa=actservice.getall_act_follow_one_up(start, count, sportid);			
//			model.addAttribute("next", next); // 下一頁
//			model.addAttribute("pre", pre); // 上一頁
//			model.addAttribute("last", last); // 最後一頁
//			model.addAttribute("Act_one_up", aaa);
//			model.addAttribute("allpage",pageArr);	//全部頁數
//			model.addAttribute("sportid", sportid);
//			return "ACT/ACT_Main2";
//		}
//	    
//	    @Transactional
//		@GetMapping("/ACT/ACT_follow_two/up")
//	    public String ACT_Follow_two_up(Model model, @RequestParam(value = "sportid") Integer sportid,
//	    		@RequestParam(value = "start", defaultValue = "0") Integer Start) {   	
//	    	Integer start = 0;
//			Integer count = 5;
//			Integer total = 0;
//			Vector<Integer> pageArr = new Vector<Integer>();
//			total = actservice.getall_act_follow_two_up(0, 100, sportid).size();//懶得再寫總數 == 
//			Integer ri=1;
//			if(total % count == 0) {
//		    	for(ri=1;ri<=total / count;ri++) {
//		    		pageArr.add(ri);
//		    	}
//		    //總共21筆資料 每頁5個，則最後一頁開始就是第20筆
//		    }else {
//		    	for(ri=1;ri<=total / count;ri++) {
//		    		pageArr.add(ri);
//		    	}
//		    	pageArr.add(ri);
//		    }		
//			try {
//				start = Start;// 取得jsp上的start參數
//			} catch (NumberFormatException e) {
//				System.out.println("沒有起始值");
//			}
//			// 0+5=5，下一頁就從第5筆開始
//			int next = start + count;
//			// 5-5=0，上一頁就從第0筆開始
//			int pre = start - count;
//
//			int last;
//			// 總共10筆資料 每頁5個 ，則最後一頁開始就是第5筆
//			if (total % count == 0) {
//				last = total - count;
//				// 總共21筆資料 每頁5個，則最後一頁開始就是第20筆
//			} else {
//				last = total - total % count;
//			}
//			// 邊界
//			pre = pre < 0 ? 0 : pre;
//			next = next > last ? last : next;	    	
//	    	List<ACT> aaa=actservice.getall_act_follow_two_up(start, count, sportid);			
//			model.addAttribute("next", next); // 下一頁
//			model.addAttribute("pre", pre); // 上一頁
//			model.addAttribute("last", last); // 最後一頁
//			model.addAttribute("Act_two_up", aaa);
//			model.addAttribute("allpage",pageArr);	//全部頁數
//			model.addAttribute("sportid", sportid);
//			return "ACT/ACT_Main2";
//		}
//	    
//	    @Transactional
//		@GetMapping("/ACT/ACT_follow_three/up")
//	    public String ACT_Follow_three_up(Model model, @RequestParam(value = "sportid") Integer sportid,
//	    		@RequestParam(value = "start", defaultValue = "0") Integer Start) {   	
//	    	Integer start = 0;
//			Integer count = 5;
//			Integer total = 0;
//			Vector<Integer> pageArr = new Vector<Integer>();
//			total = actservice.getall_act_follow_three_up(0, 100, sportid).size();//懶得再寫總數 == 
//			Integer ri=1;
//			if(total % count == 0) {
//		    	for(ri=1;ri<=total / count;ri++) {
//		    		pageArr.add(ri);
//		    	}
//		    //總共21筆資料 每頁5個，則最後一頁開始就是第20筆
//		    }else {
//		    	for(ri=1;ri<=total / count;ri++) {
//		    		pageArr.add(ri);
//		    	}
//		    	pageArr.add(ri);
//		    }		
//			try {
//				start = Start;// 取得jsp上的start參數
//			} catch (NumberFormatException e) {
//				System.out.println("沒有起始值");
//			}
//			// 0+5=5，下一頁就從第5筆開始
//			int next = start + count;
//			// 5-5=0，上一頁就從第0筆開始
//			int pre = start - count;
//
//			int last;
//			// 總共10筆資料 每頁5個 ，則最後一頁開始就是第5筆
//			if (total % count == 0) {
//				last = total - count;
//				// 總共21筆資料 每頁5個，則最後一頁開始就是第20筆
//			} else {
//				last = total - total % count;
//			}
//			// 邊界
//			pre = pre < 0 ? 0 : pre;
//			next = next > last ? last : next;	    	
//	    	List<ACT> aaa=actservice.getall_act_follow_three_up(start, count, sportid);			
//			model.addAttribute("next", next); // 下一頁
//			model.addAttribute("pre", pre); // 上一頁
//			model.addAttribute("last", last); // 最後一頁
//			model.addAttribute("Act_three_up", aaa);
//			model.addAttribute("allpage",pageArr);	//全部頁數
//			model.addAttribute("sportid", sportid);
//			return "ACT/ACT_Main2";
//		}
//}
//
