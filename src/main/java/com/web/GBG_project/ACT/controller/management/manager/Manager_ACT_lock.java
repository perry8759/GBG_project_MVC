package com.web.GBG_project.ACT.controller.management.manager;

import java.io.IOException;
import java.sql.Clob;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.ACT.service.ACTService;

//管理(更新活動狀態)
@Controller
public class Manager_ACT_lock  {
	ACTService actservice;
	@Autowired 
	public void setService(ACTService actservice) {
		this.actservice = actservice;
	}
    public Manager_ACT_lock() {
        super();
        // TODO Auto-generated constructor stub
    }
    @RequestMapping("/ACT/Manager_ACT_lock")
	public String editACT_lock(@RequestParam("actid") Integer actid, Model model) { 
    	    ACT act=actservice.getACT(actid);
    	    actservice.updateact_status_examlock(act);
            return "redirect: ../ACT/Manager_ACT_list";
	}
	
//	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		try {
//			updateForm(request,response);
//		} catch (SQLException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//	}
//
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}
//	private void updateForm(HttpServletRequest request, HttpServletResponse response)
//		    throws SQLException, ServletException, IOException {
//		        ACTService  rs = new ACTServiceImpl();
//		        response.setContentType("text/html");
//		        request.setCharacterEncoding("UTF-8");
//		        Integer id = Integer.parseInt(request.getParameter("actid"));
//		        ACT act=rs.getACT(id);
//		        int n=rs.updateact_status_examlock(act);
//		        RequestDispatcher dispatcher = request.getRequestDispatcher("ACT_list");
//		        dispatcher.forward(request, response);
//		    }
}
