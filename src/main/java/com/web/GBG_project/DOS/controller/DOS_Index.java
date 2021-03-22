//導向場地主頁(使用者畫面)SportDOS.jsp
package com.web.GBG_project.DOS.controller;

import java.util.List;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.DOS.model.DOS;
import com.web.GBG_project.DOS.service.DOSService;


@Controller
public class DOS_Index  {
	DOSService dosservice;

	@Autowired 
	public void setService(DOSService dosservice) {
		this.dosservice = dosservice;
	}
    public DOS_Index() {
        super();
        // TODO Auto-generated constructor stub
    }
 
    @RequestMapping("/DOS/DOS_Index")
	public String list(Model model,@RequestParam(value = "start", defaultValue = "0") Integer Start
			) {
    	model.addAttribute("dossports", dosservice.select_sport());
    	Integer start=0;
		Integer count=3;
		Integer total=0;
		Vector<Integer> pageArr = new Vector<Integer>();
		total=dosservice.allDOS_Count();//活動總數量
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
    	List<DOS>  list = dosservice.getDOS_Max(start, count);
    	model.addAttribute("next", next);	//下一頁
	    model.addAttribute("pre", pre);	//上一頁
	    model.addAttribute("last",last);	//最後一頁
	    model.addAttribute("allpage",pageArr);	//全部頁數
		model.addAttribute("DOS", list);
		
		return "DOS/SportDOS";
    	
    		
    	
	}
 
    
    @RequestMapping(value="/DOS/DOS_Index/{actid}")
	public String list1(Model model,@RequestParam(value = "start", defaultValue = "0") Integer Start
			,@PathVariable(value = "actid") Integer actid) {
    	model.addAttribute("dossports", dosservice.select_sport());
    	Integer start=0;
		Integer count=3;
		Integer total=0;
		Vector<Integer> pageArr = new Vector<Integer>();
		total=dosservice.allDOSByid(actid);//活動總數量
		System.out.println(total);
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
    	List<DOS>  list = dosservice.getDOSBySportid(start, count, actid);
    	model.addAttribute("next", next);	//下一頁
	    model.addAttribute("pre", pre);	//上一頁
	    model.addAttribute("last",last);	//最後一頁
	    model.addAttribute("allpage",pageArr);	//全部頁數
		model.addAttribute("DOS2", list);
		return "DOS/SportDOS";
	}
    
    @RequestMapping(value="/DOS/search_dos")
	public String list2(Model model,@RequestParam(value = "start", defaultValue = "0") Integer Start
			,@RequestParam("freetext") String freetext,@RequestParam("dosselect") String dosselect) {
    	model.addAttribute("dossports", dosservice.select_sport());
    	Integer start=0;
		Integer count=3;
		Integer total=0;
		Vector<Integer> pageArr = new Vector<Integer>();
		total=dosservice.get_search_addr(freetext,dosselect).size();//活動總數量
		System.out.println(total);
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
    	List<DOS>  list = dosservice.get_search_addr(freetext,dosselect);
    	model.addAttribute("next", next);	//下一頁
	    model.addAttribute("pre", pre);	//上一頁
	    model.addAttribute("last",last);	//最後一頁
	    model.addAttribute("allpage",pageArr);	//全部頁數
		model.addAttribute("DOS3", list);
		model.addAttribute("dosselect", dosselect);
		model.addAttribute("freetext", freetext);
		return "DOS/SportDOS";
	}
}
