//新增新的活動表單後，導入到活動主頁ACT_Main
package com.web.GBG_project.ACT.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.context.request.WebRequest;

import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.ACT.model.ACT_RULE;
import com.web.GBG_project.ACT.model.ACT_STATUS;
import com.web.GBG_project.ACT.service.ACTService;
import com.web.GBG_project.DOS.model.DOS;
import com.web.GBG_project.DOS.model.DOS_SPORT;
import com.web.GBG_project.DOS.service.DOSService;
import com.web.GBG_project.member.model.MemberBean;

@Controller
@SessionAttributes({"LoginOK"})
public class ACT_Main_new {
	ServletContext context;
	@Autowired
	public void setContext(ServletContext context) {
		this.context = context;
	}
	ACTService actservice;
	DOSService dosservice;
	@Autowired 
	public void setACTService(ACTService actservice) {
		this.actservice = actservice;
	}
	@Autowired 
	public void setDOSService(DOSService dosservice) {
		this.dosservice = dosservice;
	}
    public ACT_Main_new() {
        super();
        // TODO Auto-generated constructor stub
    }
  //new新的ACT ，傳給頁面
    @GetMapping("/ACT/ACT_Main_new")
	public String showACTForm(Model model,@RequestParam(value="DOSID") Integer id) {
    	DOS dosBean=dosservice.selectid(id);
    	ACT actbean = new ACT();
		actbean.setDos_id(dosBean);
		model.addAttribute("actBean", actbean);
		List<DOS_SPORT> dos_sport=dosservice.select_sport();
		List<ACT_STATUS> act_status=actservice.select_actstatus();
		List<ACT_RULE> act_rule=actservice.select_actrule();
		model.addAttribute("dos_sport", dos_sport);
		model.addAttribute("act_status", act_status);
		model.addAttribute("act_rule", act_rule);
		return "ACT/ACT_Main_Form";
	}
    //新增DOS，並放入loginok
    @PostMapping("/ACT/ACT_Main_new")
	public String ACTAdd( ACT actBean,Model model){ 
    	MemberBean member = (MemberBean) model.getAttribute("LoginOK");
		actBean.setMEMBER_ID(member.getMember_id());
    	actservice.insertACT(actBean);   	
		return "redirect: ACT_Main";
	}
    @InitBinder
	public void initBinder(WebDataBinder binder, WebRequest request) {
		// java.util.Date
		DateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss SSS");
		dateFormat.setLenient(false);
		CustomDateEditor ce = new CustomDateEditor(dateFormat, true); 
		binder.registerCustomEditor(Date.class, ce);
		// java.sql.Date		
		DateFormat dateFormat2 = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat2.setLenient(false);
		CustomDateEditor ce2 = new CustomDateEditor(dateFormat2, true); 
		binder.registerCustomEditor(java.sql.Date.class, ce2);
	}
    //可測試用，找看看member是否正確
//    @ModelAttribute
//	public MemberBean createMemberBean(Model model) {
//		MemberBean mb = (MemberBean) model.getAttribute("LoginOK");
//		System.out.println("1st mb=" + mb);
//		return mb;
//	}
	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doPost(request,response);
//	}
//
//	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		HttpSession session = request.getSession(false);
//		MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
//	    ACTService  rs = new ACTServiceImpl();
//	    request.setCharacterEncoding("UTF-8");	
//	    String DOS_ID = request.getParameter("DOS_ID");
//	    String ACT_MAIN_TITLE=request.getParameter("ACT_MAIN_TITLE");
//	    String ACT_MAIN_DESC = request.getParameter("ACT_MAIN_DESC");
//	    String ACT_MAIN_PERSON = request.getParameter("ACT_MAIN_PERSON");
//	    String ACT_MAIN_OPENING = request.getParameter("ACT_MAIN_OPENING");
//	    String ACT_MAIN_CLOSING = request.getParameter("ACT_MAIN_CLOSING");
//	    String ACT_MAIN_TIME = request.getParameter("ACT_MAIN_TIME");
//	    String ACT_MAIN_PAY = request.getParameter("ACT_MAIN_PAY");
//	    //Integer s=rs.getTime_to_status(ACT_MAIN_OPENING, ACT_MAIN_CLOSING);
//	    Timestamp amo = null;
//	    Timestamp amc=null;
//	    Timestamp amt=null;
//		try {
//			amo = rs.changeTS(ACT_MAIN_OPENING);
//		    amc=rs.changeTS(ACT_MAIN_CLOSING);
//	        amt=rs.changeTS(ACT_MAIN_TIME);
//		} catch (ParseException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	    //建立新的功能，使用seesion找出dos,act_type,act_status編號的物件
//	    //回傳act_bean給rs.selectid新增 一筆紀錄
//	    ACT act_bean=new ACT(null,mb.getMember_id(),null, ACT_MAIN_TITLE, ACT_MAIN_DESC, Integer.parseInt(ACT_MAIN_PERSON),
//	    		1,amo, amc, amt,amt, Integer.parseInt(ACT_MAIN_PAY),null,null,null,
//	    		Integer.parseInt(ACT_MAIN_PERSON),null,null,null,null);
//	    rs.insertACT(act_bean, 1, 1,1);
//	    	 //rs.selectid(act_bean);
////	    	 rs.selectid1(ACT_MAIN_OPENING, ACT_MAIN_CLOSING);
////	    	 System.out.print(date);
////
//	    	 //rs.select4();
////	    	 rs.select2();
////			request.setAttribute("ACT", act_bean);	//DOS資訊
//			//request.setAttribute("ACT_List", act_list);
//	    	 
//	          RequestDispatcher rd =                       		
//	                 request.getRequestDispatcher("ACT_Main");
//	          rd.forward(request, response);
//	    	 //response.sendRedirect("ACT_Main");
//	    	 
//	    	 
//		
//	    
//		
//	}

}
