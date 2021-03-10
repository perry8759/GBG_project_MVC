package com.web.GBG_project.ACT.controller.management.manager;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.ACT.model.ACT_RULE;
import com.web.GBG_project.ACT.model.ACT_STATUS;
import com.web.GBG_project.ACT.service.ACTService;




@Controller
public class Manager_ACT_list_detail  {
	ACTService actservice;
	@Autowired 
	public void setService(ACTService actservice) {
		this.actservice = actservice;
	}
    public Manager_ACT_list_detail() {
        super();
        // TODO Auto-generated constructor stub
    }
    @GetMapping("/ACT/Manager_ACT_list_detail")
	public String getACTById(@RequestParam("actid") Integer actid, Model model){
		ACT act=actservice.getACT(actid);
		model.addAttribute("ACT_exampass", act);
		return "/management_page/ACT/manager/MGT_ACT_Detail_Page";
	}
  //接收actBean，給service做更新
    @GetMapping("/ACT/Manager_ACT_list_detail_pass")
	public String editACT_pass(@RequestParam("actid") Integer actid, Model model) { 
    	    ACT actBean=actservice.getACT(actid);
    	    String a=actservice.changeTS2S
    			    (actBean.getACT_SIGN_O());
    	    String b= actservice.changeTS2S(actBean.getACT_SIGN_C());   	   
            int n=actservice.getTime_to_status(a,b);            
//            ACT_STATUS act_status=actservice.getACT_STATUS(n); //管理員按下通過，並改變狀態且ACT主頁顯示欄位	
//            actBean.setAct_status(act_status);
            actservice.updateact_status_exampass(actBean, n);
            return "/management_page/ACT/manager/MGT_ACT_Detail_Page_Close";
	}
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		try {
//			listACT(request,response);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
//
//	/**
//	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
//	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
//	private void listACT(HttpServletRequest request, HttpServletResponse response)
//		    throws SQLException, IOException, ServletException {
//		        //HttpSession session = request.getSession(false);
//		        //MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
//				
//				ACTService actservice=new ACTServiceImpl();
//				//List<ACT> act=actservice.select(mb.getMember_id());
//				Integer id = Integer.parseInt(request.getParameter("actid"));
//				ACT act=actservice.getACT(id);
//				request.setAttribute("ACT", act);	
//			    RequestDispatcher rd =                       		
//			         request.getRequestDispatcher("/management_page/MGT_ACT_Detail_Page.jsp");
//			         rd.forward(request, response);               		
//			    return ;                                     		
//			    }
}
