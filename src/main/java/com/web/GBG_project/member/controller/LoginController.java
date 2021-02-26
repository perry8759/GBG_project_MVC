package com.web.GBG_project.member.controller;


import java.sql.SQLException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.web.GBG_project.member.model.MemberBean;
import com.web.GBG_project.member.service.LoginService;




@Controller
@RequestMapping("/loginform")
@SessionAttributes({"LoginOK"}) 
public class LoginController  {

	LoginService loginservice;
	@Autowired 
	public void setService(LoginService loginservice) {
		this.loginservice = loginservice;
	}
    public LoginController() {
        super();
        // TODO Auto-generated constructor stub
    }

    
    @GetMapping("/login01")
    public String login00(HttpServletRequest request, Model model, 
    		@CookieValue(value="member_account", required = false, defaultValue="") String member_account,
    		@CookieValue(value="member_pw", required = false) String member_pw    		
    			) {
    		if (member_account == null)
    			member_account = "";
    		if (member_pw == null) {
    			member_pw = "";
    		}    		  			
    		MemberBean bean = new MemberBean();
    		model.addAttribute(bean);   // 	loginBean	
		    return "login/login";
	}
    
    
    @PostMapping("/login")
	public String checkAccount(
			@ModelAttribute("memberBean") MemberBean bean,Model model,BindingResult result,
			HttpServletRequest request, HttpServletResponse response) throws SQLException {
		
		MemberBean mb = null;
		try {
			// 呼叫 loginService物件的 checkIDPassword()，傳入userid與password兩個參數
			mb = loginservice.checkIdPassword(bean.getMember_account(),bean.getMember_pw());
			
			if (mb != null) {
				// OK, 登入成功, 將mb物件放入Session範圍內，識別字串為"LoginOK"
				model.addAttribute("LoginOK", mb);
				System.out.println("登入成功");
			} else {
				System.out.println("登入失敗");
			}
		} catch (RuntimeException ex) {
			result.rejectValue("invalidCredentials", "", ex.getMessage());
			ex.printStackTrace();
			return "login/login";
		}
		HttpSession session = request.getSession();
		String nextPath = (String)session.getAttribute("requestURI");
		if (nextPath == null) {
			nextPath = request.getContextPath();
		}
		return "redirect: " + nextPath;
	}
    
	
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		LoginSeriveImpl lsi=new LoginSeriveImpl();
//		request.setCharacterEncoding("UTF-8");
//		HttpSession session = request.getSession();
//		String userId = request.getParameter("userId");
//		String password = request.getParameter("pswd");
//		String requestURI = (String) session.getAttribute("requestURI");
//		try {
//			MemberBean checkid=lsi.checkIdPassword(userId, password);
//			if(checkid!=null) {
//				System.out.println("登入成功");
//				session.setAttribute("LoginOK", checkid);
//			}
//			else {
//				System.out.println("登入失敗");
//			}
//			if (requestURI != null) {
//				requestURI = (requestURI.length() == 0 ? request.getContextPath() : requestURI);
//				if(requestURI.compareTo("/GBG_project/DOS/DOS_detail")==0){
//				response.sendRedirect("../DOS/SportDOS.jsp");
//				MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
//				
//				return;
//				}
//				else {
//					response.sendRedirect(response.encodeRedirectURL(requestURI));
//					MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
//					
//					return;
//				}
//			} else {
//				response.sendRedirect(response.encodeRedirectURL(request.getContextPath()));
//				System.out.print(requestURI);
//				return;
//			}
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}

}
