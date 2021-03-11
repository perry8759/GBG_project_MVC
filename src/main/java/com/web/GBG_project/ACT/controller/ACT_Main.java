//查詢活動主頁(使用者畫面)ACT_Main.jsp
package com.web.GBG_project.ACT.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.ACT.service.ACTService;



//查詢全部活動資料+分頁
@Controller
public class ACT_Main {
	ACTService actservice;
	@Autowired 
	public void setService(ACTService actservice) {
		this.actservice = actservice;
	}
	public ACT_Main() {
        super();
        // TODO Auto-generated constructor stub
    }
//	@RequestMapping("/ACT/ACT_Main")
	public String list(Model model,@RequestParam(value = "start", defaultValue = "0") Integer Start
			) {
		Integer start=0;
		Integer count=5;
		Integer total=0;
		total=actservice.allACT_Count();//活動總數量
		try {
		    start=Start;//取得jsp上的start參數 
		}catch (NumberFormatException e) {
            System.out.println("沒有起始值");
        }
		//0+5=5，下一頁就從第5筆開始
	    int next=start+count;
	    //5-5=0，上一頁就從第0筆開始
	    int pre=start-count;
	    
	    int last;
	    //總共10筆資料 每頁5個 ，則最後一頁開始就是第5筆
	    if(total % count == 0) {
	    	last=total-count;
	    //總共21筆資料 每頁5個，則最後一頁開始就是第20筆
	    }else {
	    	last=total-total%count;
	    }
	    //邊界
	    pre=pre<0 ? 0 : pre;
	    next=next>last ? last : next;
	    List<ACT> act_all=actservice.getACT_Max(start, count);
	    model.addAttribute("next", next);	//下一頁
	    model.addAttribute("pre", pre);	//上一頁
	    model.addAttribute("last",last);	//最後一頁
	    model.addAttribute("Act", act_all); 
		return "/ACT/ACT_Main";
	}
}

