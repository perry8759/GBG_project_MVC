package com.web.GBG_project.ACT.controller.management.backUp;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.web.GBG_project.ACT.model.ACT;
import com.web.GBG_project.ACT.service.ACTService;
import com.web.GBG_project.ACT.service.impl.ACTServiceImpl;

/**
 * Servlet implementation class ACT_list
 */
@WebServlet("/ACT/ACT_list")
public class ACT_list extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ACT_list() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			listACT(request,response);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	private void listACT(HttpServletRequest request, HttpServletResponse response)
		    throws SQLException, IOException, ServletException {
		        //HttpSession session = request.getSession(false);
		        //MemberBean mb = (MemberBean) session.getAttribute("LoginOK");
				
				ACTService actservice=new ACTServiceImpl();
				//List<ACT> act=actservice.select(mb.getMember_id());
				List<ACT> act=actservice.allACT();
				request.setAttribute("AllACT", act);	
			    RequestDispatcher rd =                       		
			         request.getRequestDispatcher("/management_page/MGT_ACT_Page.jsp");
			         rd.forward(request, response);               		
			    return ;                                     		
			    }
}
